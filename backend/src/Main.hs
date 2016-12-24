{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE NamedFieldPuns    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Main where

import API
import Control.Lens
import Control.Monad.IO.Class
import Control.Monad.Logger           (runStderrLoggingT)
import Control.Monad.Reader
import Control.Monad.RWS
import Crypto.Cipher.AES              (AES256)
import Crypto.Cipher.Types
import Crypto.Error
import Crypto.PasswordStore
import Data.ByteArray.Encoding
import Data.ByteString                (ByteString)
import Data.Pool                      (Pool)
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
import WaiAppStatic.Storage.Embedded

data Client a = Client
              { pool     :: Pool a
              } deriving Show

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

    run 8000 $ websocketsOr defaultConnectionOptions (wsApp db) backupApp
    where
        wsApp pool pc = do
            conn <- acceptRequest pc
            eval Client { pool } (ClientState False) $ fix $ \ f -> do
                bs <- liftIO $ receiveData conn
                let Right val = decode bs
                res <- respondTo val
                forM_ res $ \ r ->
                    liftIO $ sendBinaryData conn $ encode r
                f
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

respondTo (RCreate t s) = return [PageR $ NewR
    $ Just (FieldResult t (Just "Not a good title"), FieldResult s Nothing)]

respondTo RNew = withAuth $ return [PageR $ NewR Nothing]

respondTo (RAuth t) = case decode64 (encodeUtf8 t) of
    Right t' | verifyPassword (decrypt t') storedPw -> do
        authed .= True
        return [AuthR (Just t)]
    _ -> return [AuthR Nothing]

respondTo (RLogin Nothing) = return [PageR $ LoginR Nothing]
respondTo (RLogin (Just t)) = if verifyPassword (encodeUtf8 t) storedPw
    then do
        setMessage "Logged in"
        authed .= True
        return [AuthR $ Just $ decodeUtf8 $ encode64 $ decrypt $ encodeUtf8 t, RedirectR RHome]
    else return [PageR $ LoginR $ Just $ FieldResult t (Just "Invalid password")]
    where
        setMessage ~(_:_) = return ()

decode64 :: ByteString -> Either String ByteString
decode64 = convertFromBase Base64
encode64 :: ByteString -> ByteString
encode64 = convertToBase Base64

storedPw :: ByteString
storedPw = $(getenv "PASSWORD")

decrypt :: ByteString -> ByteString
decrypt = encrypt secret where
    secret :: ByteString
    secret = $(genSecret "SECRET")

encrypt :: ByteString -> ByteString -> ByteString
encrypt secret = ctrCombine ctx nullIV where
    ctx :: AES256
    CryptoPassed ctx = cipherInit secret

runDB :: (MonadReader (Client SqlBackend) m, MonadIO m)
      => SqlPersistM b -> m b
runDB m = liftIO . runSqlPersistMPool m =<< asks pool

withAuth :: MonadState ClientState m => m [API.Response] -> m [API.Response]
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
