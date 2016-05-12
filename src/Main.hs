{-# LANGUAGE CPP               #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TemplateHaskell   #-}

module Main where

import           Control.Concurrent
import           Control.Monad
import           Control.Monad.Reader
import           Control.Monad.Writer
import           Data.Acid
import           Data.Acid.Remote
import           Data.ByteString                           (ByteString)
import           Data.FileEmbed
import           Data.Maybe
import           Data.Set                                  (fromList)
import           Data.Text.Encoding
import           Data.Vault.Lazy
import           Database
import           Network
import           Network.HTTP.Types.Status
import           Network.Wai
import           Network.Wai.Handler.Warp
import           Network.Wai.Middleware.Approot
import           Network.Wai.Middleware.Gzip
import           Network.Wai.Middleware.MethodOverridePost
import           Network.Wai.Middleware.RequestLogger
import           Network.Wai.Session
import           Network.Wai.Session.ClientSession
import           Pages.Delete
import           Pages.Edit
import           Pages.Home
import           Pages.Login
import           Pages.New
import           Pages.Prelude                             (PageEnv (..),
                                                            method)
import           Pages.Single
import           Prelude                                   hiding (lookup)
import qualified Prelude
import           StaticFiles
import           System.Environment
import           Text.Read                                 hiding (lift)
import           Web.ClientSession
import           Web.Cookie
import           Web.Routes.Base
#ifndef PRODUCTION
import           Data.Acid.Core                            (MethodState)
#endif

runDBServer :: AcidState Database -> IO ()
runDBServer = acidServer
    (sharedSecretCheck $ fromList [$(embedFile "important-secret")])
    (UnixSocket "/var/run/jude-db.sock")

main :: IO ()
main = do
    port <- (fromMaybe 8000 . (>>= readMaybe)) <$> lookupEnv "PORT"
    (vaultKey, middlewares) <- getMiddlewares

    database <- openLocalStateFrom "db" (Database mempty mempty)
    _ <- forkIO $ runDBServer database

    run port $ middlewares $ \ req -> do
        let session :: Session IO ByteString ByteString
            Just session = lookup vaultKey (vault req)
            path = decodePathInfo (rawPathInfo req)

        canonPath path req $ \ resp ->
            case path of
                ("s":_) -> serveStatic req resp
                _ -> do
                    let responses = execWriter $ case path of
                            []          -> home
                            ["in"]      -> login
                            ["out"]     -> logout
                            ["n"]       -> new
                            ["r", slug] -> single slug
                            ["e", slug] -> edit slug
                            ["d", slug] -> Pages.Delete.delete slug

                            _           -> method (requestMethod req) $ return $ responseLBS notFound404 [] "Not found"

                    (resp =<<) $ case Prelude.lookup (requestMethod req) responses of
                        Just f -> runReaderT f $ PageEnv database session req
                        Nothing -> return $ responseLBS methodNotAllowed405 [] "Not allowed"
    where
        canonPath ps req f
            | mempty `notElem` ps = f
            | otherwise = \ resp -> resp
                $ responseLBS movedPermanently301
                    [("Location", fromMaybe "" (getApprootMay req)
                               <> encodeUtf8 (encodePathInfo (filter (/= mempty) ps) [])
                               <> rawQueryString req)] ""
        getMiddlewares = do
            ef <- envFallback
            skey <- newKey
            k <- getDefaultKey
            return . (,) skey $
                     methodOverridePost
                   . ef
                   . gzip def
                   . withSession (clientsessionStore k) "_SESSION" (def { setCookiePath = Just "/" }) skey
#ifdef PRODUCTION
                   . logStdout
#else
                   . logStdoutDev
#endif

#ifndef PRODUCTION
runDB :: (QueryEvent event, MethodState event ~ Database)
      => event -> IO (EventResult event)
runDB k = do
    s <- openLocalStateFrom "db" (Database mempty mempty)
    m <- query s k
    closeAcidState s
    return m

execDB :: (UpdateEvent event, MethodState event ~ Database)
       => event -> IO (EventResult event)
execDB k = do
    s <- openLocalStateFrom "db" (Database mempty mempty)
    q <- update s k
    closeAcidState s
    return q
#endif
