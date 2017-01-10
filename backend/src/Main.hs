{-# LANGUAGE CPP                 #-}
{-# LANGUAGE FlexibleContexts    #-}
{-# LANGUAGE FlexibleInstances   #-}
{-# LANGUAGE GADTs               #-}
{-# LANGUAGE NamedFieldPuns      #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE RecordWildCards     #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell     #-}

module Main where

import API
import Control.Lens
import Control.Monad.Catch            (catch)
import Control.Monad.IO.Class
import Control.Monad.Logger           (runStderrLoggingT)
import Control.Monad.Reader
import Control.Monad.RWS              hiding (listen)
import Crypto.Cipher.AES              (AES256)
import Crypto.Cipher.Types
import Crypto.Error
import Crypto.PasswordStore
import Data.ByteArray.Encoding
import Data.ByteString                (ByteString)
import Data.Map                       (fromList)
import Data.Serialize                 (decode, encode)
import Data.Text.Encoding
import Data.Text.Lazy                 (toStrict)
import Database
import Database.Persist
import Database.Persist.Postgresql
import Getenv
import Network.Wai.Application.Static
import Network.Wai.Handler.Warp       (run)
import Network.Wai.Handler.WebSockets
import Network.WebSockets
import RenderMD
import StaticFiles
import Text.Blaze.Html.Renderer.Text  (renderHtml)
import Text.Digestive                 (viewErrors)
import WaiAppStatic.Storage.Embedded
#ifndef PRODUCTION
import Control.Concurrent             (forkIO, killThread)
import Control.Monad.Catch            (finally)
import Network.Wai                    (pathInfo, rawPathInfo)
import Network.Wai.Middleware.Cors
import System.Directory               (getCurrentDirectory)
#endif

data ClientState = ClientState
                 { _authed :: Bool }
                 deriving Show

makeLenses ''ClientState

main :: IO ()
main = do
    db <- runStderrLoggingT $ do
        pool <- createPostgresqlPool "" 10
        runSqlPool (runMigration migrateAll) pool
        return pool

#ifndef PRODUCTION
    serverThread <- forkIO $ do
        s <- getCurrentDirectory
        let set_ = defaultFileServerSettings (s <> "/../frontend/dist/build/frontend/frontend.jsexe")
            app = staticApp (set_ { ss404Handler = Just $ \ req resp ->
                                      app (req { rawPathInfo = "/", pathInfo = [] }) resp
                                  })
        run 8080 app

    let corsWrap = simpleCors
#else
    let corsWrap = id
#endif

    run 8000 (corsWrap . websocketsOr defaultConnectionOptions (wsApp db) $ backupApp)
#ifndef PRODUCTION
        `finally` killThread serverThread
#endif
    where
        wsApp pool pc = do
            conn <- acceptRequest pc
            eval Client { pool } (ClientState False) $ fix (\ f -> do
                bs <- liftIO $ receiveData conn
                bs' <- do
                    liftIO $ print bs
                    return bs
                let val = either (error . show) id $ decode bs'
                res <- respondTo val
                forM_ res $ \ r -> liftIO $ sendBinaryData conn $ encode r
                f) `catch` \ (c :: ConnectionException) ->
                    liftIO $ putStrLn $ "Closing connection: " ++ show c
        backupApp = staticApp $(mkSettings mkEmbedded)
        eval r s m = do
            (_, ()) <- evalRWST m r s
            return ()

respondTo :: (MonadState ClientState m, MonadReader (Client SqlBackend) m, MonadIO m)
          => API.Request -> m [API.Response]
respondTo RHome = respondTo (RPage 1)

respondTo (RPage n) = do
    page <- runDB $ paginate n 5
    return [PageR $ HomeR $ (\ (Entity _ p) -> Preview (essayTitle p) (essaySlug p)) <$> page]

respondTo (RSingle t) = do
    Just (Entity _ post) <- runDB $ getBy $ UniqueEssay t
    return [PageR $ SingleR (post { essayContent = toStrict $ renderHtml $ renderMd (essayContent post) })]

respondTo (RNew fdata) = withAuth $ case fdata of
    Nothing -> return [PageR $ NewR Nothing]
    Just fd -> do
        (view', res) <- postFormWith "essay" (essayForm True) fd
        case res of
            Just e  -> do
                _ <- runDB $ insert e
                return [RedirectR $ RSingle (essaySlug e)]
            Nothing -> return [PageR $ NewR $ Just (viewErrors view', fd)]

respondTo (REdit sl fdata) = withAuth $ do
    Just (Entity k post) <- runDB $ getBy $ UniqueEssay sl
    case fdata of
        Nothing -> return [PageR $ EditR (essayTitle post) sl $ Just ([], essayData post)]
        Just fd -> do
            (view', res) <- postFormWith "essay" (essayForm False) fd
            case res of
                Just p -> do
                    runDB $ replace k p
                    return [RedirectR $ RSingle $ essaySlug p]
                Nothing -> return [PageR $ EditR (essayTitle post) sl $ Just (viewErrors view', fd)]
    where
        essayData (Essay t _ c _) = fromList [(["title"],t),(["content"],c)]

respondTo (RAuth t) = case decode64 (encodeUtf8 t) of
    Right t' | verifyPassword (decrypt t') storedPw -> do
        authed .= True
        return [AuthR (Just t)]
    _ -> return [AuthR Nothing]

respondTo (RLogin Nothing) = return [PageR $ LoginR Nothing]
respondTo (RLogin (Just fdata)) = do
    (v, res) <- postFormWith "login" loginForm fdata
    case res of
        Just r' -> do
            authed .= True
            return [AuthR $ Just $ decodeUtf8 $ encode64 $ decrypt $ encodeUtf8 r', RedirectR RHome]
        Nothing -> return [PageR $ LoginR $ Just (viewErrors v, fdata)]

respondTo (RDel t) = withAuth $ do
    runDB $ deleteBy $ UniqueEssay t
    return [RedirectR RHome]

decode64 :: ByteString -> Either String ByteString
decode64 = convertFromBase Base64
encode64 :: ByteString -> ByteString
encode64 = convertToBase Base64

decrypt :: ByteString -> ByteString
decrypt = encrypt secret where
    secret :: ByteString
    secret = $(genSecret "SECRET")

encrypt :: ByteString -> ByteString -> ByteString
encrypt secret = ctrCombine ctx nullIV where
    ctx :: AES256
    CryptoPassed ctx = cipherInit secret

withAuth :: (MonadIO m, MonadState ClientState m) => m [API.Response] -> m [API.Response]
withAuth f = do
    a <- use authed
    if a then f else return [PageR $ ErrorR "Auth required"]

paginate :: (BaseBackend backend ~ SqlBackend, PersistQueryRead backend, MonadIO m)
         => Integer -> Int -> ReaderT backend m (Page (Entity Essay))
paginate page limit = do
    xs <- selectList [] [ Desc EssayCreatedAt
                        , OffsetBy (fromIntegral (page - 1) * limit)
                        , LimitTo (fromIntegral limit + 1)]
    let nextPage' = if length xs > limit then Just (page + 1) else Nothing
        prevPage = if page == 1 then Nothing else Just (page - 1)
        previews' = take limit xs
    return $ Page prevPage nextPage' previews'
