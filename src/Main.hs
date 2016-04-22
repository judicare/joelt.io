{-# LANGUAGE CPP               #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}

module Main where

import           Control.Monad
import           Control.Monad.Writer
import           Data.Acid
import           Data.ByteString                           (ByteString)
import           Data.Maybe
import           Data.Text.Encoding
import           Data.Vault.Lazy
import           Database
import           Network.HTTP.Types.Status
import           Network.Wai
import           Network.Wai.Handler.Warp
import           Network.Wai.Middleware.Approot
import           Network.Wai.Middleware.Gzip
import           Network.Wai.Middleware.MethodOverridePost
import           Network.Wai.Middleware.RequestLogger
import           Network.Wai.Session
import           Network.Wai.Session.ClientSession
import           Pages.Edit
import           Pages.Home
import           Pages.Login
import           Pages.New
import           Pages.Prelude                             (method)
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

main :: IO ()
main = do
    port <- (fromMaybe 8000 . (>>= readMaybe)) <$> lookupEnv "PORT"
    (vaultKey, middlewares) <- getMiddlewares
    database <- openLocalStateFrom "db" (Database mempty mempty)
    run port $ middlewares $ \ req -> do
        let session :: Session IO ByteString ByteString
            Just session = lookup vaultKey (vault req)
            path = decodePathInfo (rawPathInfo req)

        canonPath path req $ \ resp -> do
            case path of
                ("s":_) -> serveStatic req resp
                _ -> do
                    let responses = execWriter $ case path of
                            []          -> home session database
                            ["in"]      -> login session
                            ["r", slug] -> single slug session database
                            ["n"]       -> new session database
                            ["e", slug] -> edit slug session database

                            _           -> method (requestMethod req) $ \ _ -> return $ responseLBS notFound404 [] "Not found"

                    (resp =<<) $ case Prelude.lookup (requestMethod req) responses of
                        Just f -> f req
                        Nothing -> return $ responseLBS methodNotAllowed405 [] "Not allowed"
    where
        canonPath ps req f
            | notElem mempty ps = f
            | otherwise = \ resp -> resp
                $ responseLBS movedPermanently301
                    [("Location", fromMaybe "" (getApprootMay req)
                               <> encodeUtf8 (encodePathInfo (filter (/= mempty) ps) [])
                               <> rawQueryString req)] ""
        getMiddlewares = do
            ef <- envFallback
            skey <- newKey
            k <- getDefaultKey
            return . ((,) skey) $
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
