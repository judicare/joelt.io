{-# LANGUAGE CPP               #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}
{-# LANGUAGE TemplateHaskell   #-}

module Main where

import           Control.Monad
import qualified Control.Monad.Logger                      as L
import           Control.Monad.Reader
import           Control.Monad.Writer
import           Data.ByteString                           (ByteString)
import           Data.Maybe
import           Data.Text.Encoding
import           Data.Vault.Lazy
import           Database
import           Database.Persist.Postgresql               hiding (In)
import           Network.HTTP.Types.Status
import           Network.Wai
import           Network.Wai.Application.Static
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
import           URLs
import           WaiAppStatic.Storage.Embedded
import           Web.ClientSession
import           Web.Cookie
import           Web.Routes

serveStatic :: Application
serveStatic = staticApp $(mkSettings mkEmbedded)

main :: IO ()
main = do
    port <- (fromMaybe 8000 . (>>= readMaybe)) <$> lookupEnv "PORT"
    (vaultKey, middlewares) <- getMiddlewares

    database <- L.runStderrLoggingT $ do
        pool <- createPostgresqlPool "" 10
        runSqlPool (runMigration migrateAll) pool
        return pool

    run port $ middlewares $ \ req -> do
        let session :: Session IO ByteString ByteString
            Just session = lookup vaultKey (vault req)
            path' = decodePathInfo (rawPathInfo req)

        canonPath path' req $ \ resp ->
            let path = if null path' then [""] else path' in
            case path of
                ("s":_) -> serveStatic req resp
                _ -> do
                    let responses = execWriter $ case parseSegments fromPathSegments path of
                            Left _      -> method (requestMethod req) $ return $ responseLBS notFound404 [] "Not found"

                            Right x     -> case x of
                                Home     -> home
                                In       -> login
                                Out      -> logout
                                N        -> new
                                (R slug) -> single slug
                                (E slug) -> edit slug
                                (D slug) -> Pages.Delete.delete slug

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
