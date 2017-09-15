{-# Language CPP                 #-}
{-# Language FlexibleContexts    #-}
{-# Language GADTs               #-}
{-# Language OverloadedStrings   #-}
{-# Language ScopedTypeVariables #-}
{-# Language TemplateHaskell     #-}

module Backend.Main where

import           Control.Arrow
import           Control.Concurrent
import           Control.Exception
import           Control.Monad
import           Control.Monad.IO.Class
import           Control.Monad.Logger
import           Control.Monad.Reader
import           Data.Pool                      (Pool)
import           Data.Serialize                 (decode, encode)
import           Data.Text                      (unpack)
import qualified Data.Text                      as T
import           Data.Text.Lazy                 (toStrict)
import           Database.Persist.Postgresql
import           Network.HTTP.Types
import           Network.Wai
import           Network.Wai.Application.Static
import           Network.Wai.Handler.Warp
import           Network.Wai.Handler.WebSockets
import           Network.WebSockets
import           System.Directory
import           System.Environment
import           System.FilePath                ((</>))
import           Text.Blaze.Html.Renderer.Text
import           WaiAppStatic.Storage.Embedded

import           Backend.Render
import           Backend.StaticFiles
import           Database
import           Routes
import           Server

main = do
    let e = "/Users/judet/.code/Haskell/jude-web"
        basedir = e </> "distjs/build/jude-web/jude-web.jsexe"
        set_ = defaultFileServerSettings basedir
        app = staticApp (set_ { ss404Handler = Just $ \ req resp ->
                                  app (req { rawPathInfo = "/", pathInfo = [] }) resp
                              })

    pool <- runStderrLoggingT $ do
        pool <- createPostgresqlPool "" 64
        runSqlPool (runMigration migrateAll) pool
        return pool

    st <- forkIO $ run 8080 app

    (`finally` killThread st) $ run 8000 $
        websocketsOr defaultConnectionOptions (ws pool) $
            staticApp $(mkSettings mkEmbedded)
    where
        ws pool pc = acceptRequest pc >>= \ conn -> (`runReaderT` pool) $ forever $ do
            bs <- liftIO $ receiveData conn
            let Right msg = decode bs
            response <- respond msg
            liftIO $ do
                print (msg :: Server.Request)
                threadDelay 500000
                sendBinaryData conn $ encode response

runDB x = do
    pool <- ask
    runSqlPool x pool

respond (ReqRoute Home) = do
    posts <- runDB $ selectList [] []
    return $ ResHome $ map ((essayTitle &&& essaySlug) . entityVal) posts

respond (ReqRoute (Read t)) = do
    post <- runDB $ getBy $ UniqueEssay t
    return $ case post of
        Nothing -> ResNotFound
        Just p  -> let post = entityVal p
                    in ResSingle (post { essayContent = renderText (essayContent post) })

renderText = toStrict . renderHtml . renderMd
