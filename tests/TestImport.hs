{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}
module TestImport
    ( module TestImport
    , module X
    ) where

import Yesod.Test as X
import Foundation as X
import Model as X
import ClassyPrelude as X
import Application (makeFoundation)
import Database.Persist as X hiding (get)
import Database.Persist.Sql
import Yesod.Default.Config2 (ignoreEnv, loadAppSettings)
import Test.Hspec as X

import Database.Persist.Sqlite              (sqlDatabase, wrapConnection)
import qualified Database.Sqlite as Sqlite
import Control.Monad.Logger                 (runLoggingT)
import Settings (appDatabaseConf)
import Yesod.Core (messageLoggerSource)

runDB :: SqlPersistM a -> YesodExample App a
runDB query = do
    app <- getTestYesod
    liftIO $ runDBWithApp app query

runDBWithApp :: App -> SqlPersistM a -> IO a
runDBWithApp app query = runSqlPersistMPool query (appConnPool app)

withApp :: SpecWith App -> Spec
withApp = before $ do
    settings <- loadAppSettings
        ["config/test-settings.yml", "config/settings.yml"]
        []
        ignoreEnv
    foundation <- makeFoundation settings
    wipeDB foundation
    return foundation

wipeDB :: App -> IO ()
wipeDB app = do
    let settings = appSettings app
    sqliteConn <- rawConnection (sqlDatabase $ appDatabaseConf settings)
    disableForeignKeys sqliteConn

    let logFunc = messageLoggerSource app (appLogger app)
    pool <- runLoggingT (createSqlPool (wrapConnection sqliteConn) 1) logFunc

    flip runSqlPersistMPool pool $ do
        tables <- getTables
        sqlBackend <- ask
        let queries = map (\t -> "DELETE FROM " ++ connEscapeName sqlBackend (DBName t)) tables
        forM_ queries (\q -> rawExecute q [])

rawConnection :: Text -> IO Sqlite.Connection
rawConnection = Sqlite.open

disableForeignKeys :: Sqlite.Connection -> IO ()
disableForeignKeys conn = Sqlite.prepare conn "PRAGMA foreign_keys = OFF;" >>= void . Sqlite.step

getTables :: MonadIO m => ReaderT SqlBackend m [Text]
getTables = do
    tables <- rawSql "SELECT name FROM sqlite_master WHERE type = 'table';" []
    return (fmap unSingle tables)
