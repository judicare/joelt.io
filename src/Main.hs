{-# LANGUAGE CPP               #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TemplateHaskell   #-}

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
    database <- openLocalStateFrom "db" (Database mempty)
    run port $ middlewares $ \ req -> do
        let session :: Session IO ByteString ByteString
            Just session = lookup vaultKey (vault req)
            path = decodePathInfo (rawPathInfo req)

        canonPath path req $ do
            let responses = execWriter $ case path of
                    []          -> home session database
                    ["r", slug] -> single slug session database
                    ["e", slug] -> edit slug session database

                    ("s":_)     -> method "GET" serveStatic
                    _           -> method (requestMethod req) $ \ _ resp -> resp $ responseLBS notFound404 [] "Not found"

            case Prelude.lookup (requestMethod req) responses of
                Just f -> f req
                Nothing -> \ resp -> resp $ responseLBS methodNotAllowed405 [] "Not allowed"
    where
        canonPath ps req f
            | all (/= mempty) ps = f
            | otherwise = \ resp -> resp
                $ responseLBS movedPermanently301
                    [("Location", encodeUtf8 (encodePathInfo (filter (/= mempty) ps) []) <> rawQueryString req)] ""
        getMiddlewares = do
            ef <- envFallback
            skey <- newKey
            k <- getDefaultKey
            return . ((,) skey) $ id
                   . methodOverridePost
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
    s <- openLocalStateFrom "db" (Database mempty)
    m <- query s k
    closeAcidState s
    return m

execDB :: (UpdateEvent event, MethodState event ~ Database)
       => event -> IO (EventResult event)
execDB k = do
    s <- openLocalStateFrom "db" (Database mempty)
    q <- update s k
    closeAcidState s
    return q
#endif
