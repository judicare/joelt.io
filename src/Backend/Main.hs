{-# Language CPP               #-}
{-# Language OverloadedStrings #-}
{-# Language TemplateHaskell   #-}

module Backend.Main where

import           Control.Concurrent
import           Control.Exception
import           Control.Monad
import           Control.Monad.IO.Class
import           Data.Serialize                 (decode, encode)
import           Data.Text                      (unpack)
import qualified Data.Text                      as T
import           Network.HTTP.Types
import           Network.Wai
import           Network.Wai.Application.Static
import           Network.Wai.Handler.Warp
import           Network.Wai.Handler.WebSockets
import           Network.WebSockets
import           System.Directory
import           System.Environment
import           System.FilePath                ((</>))
import           WaiAppStatic.Storage.Embedded

import           Backend.StaticFiles
import           Routes
import           Server

main = do
    let e = "/Users/judet/.dev/Haskell/jude-web"
        basedir = e </> "distjs/build/jude-web/jude-web.jsexe"
        set_ = defaultFileServerSettings basedir
        app = staticApp (set_ { ss404Handler = Just $ \ req resp ->
                                  app (req { rawPathInfo = "/", pathInfo = [] }) resp
                              })

    st <- forkIO $ run 8080 app

    run 8000 (websocketsOr defaultConnectionOptions ws (staticApp $(mkSettings mkEmbedded)))
        `finally` killThread st
    where
        ws pc = acceptRequest pc >>= \ conn -> forever $ do
            bs <- liftIO $ receiveData conn
            let Right msg = decode bs
            print (msg :: Server.Request)
            threadDelay 500000
            sendBinaryData conn $ encode $ case msg of
                ReqRoute Home -> ResHome []
                _             -> error "oh no"
