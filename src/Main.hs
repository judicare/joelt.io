{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import API
import Control.Monad.IO.Class
import Control.Monad.Logger           (runStderrLoggingT)
import Control.Monad.Reader
import Data.Aeson                     (decode, encode)
import Data.Text                      (Text)
import Database
import Database.Persist
import Database.Persist.Postgresql
import Network.HTTP.Types             (status400)
import Network.Wai
import Network.Wai.Handler.Warp       (run)
import Network.Wai.Handler.WebSockets
import Network.WebSockets
import Servant

main :: IO ()
main = do
    db <- runStderrLoggingT $ do
        pool <- createPostgresqlPool "" 10
        runSqlPool (runMigration migrateAll) pool
        return pool

    run 3000 $ websocketsOr defaultConnectionOptions (wsApp db) backupApp
    where
        wsApp pool pc = do
            conn <- acceptRequest pc
            fix $ \ f -> do
                bs <- receiveData conn
                print bs
                let Just val = decode bs
                res <- runReaderT (respondTo val) pool
                sendBinaryData conn $ encode res
                f
        backupApp _ = ($ responseLBS status400 [] "Not allowed")

respondTo (RHome n) = do
    page <- runDB $ paginate n 5
    return $ HomeR $ (\ (Entity _ p) -> Preview (postTitle p) (postSlug p)) <$> page

respondTo (RSingle t) = do
    Just (Entity _ post) <- runDB $ getBy $ UniquePost t
    return $ SingleR post

runDB m = liftIO . runSqlPersistMPool m =<< ask

paginate page limit = do
    xs <- selectList [] [ Desc PostCreatedAt
                        , OffsetBy (fromIntegral (page - 1) * limit)
                        , LimitTo (fromIntegral limit + 1)]
    let nextPage = if length xs > limit then Just (page + 1) else Nothing
        prevPage = if page == 1 then Nothing else Just (page - 1)
        previews = take limit xs
    return $ Page prevPage nextPage previews
