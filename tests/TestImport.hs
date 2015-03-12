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
    runDBWithApp app $ do
        tables <- getTables
        sqlBackend <- ask

        let escapedTables = map (connEscapeName sqlBackend . DBName) tables
            query = "TRUNCATE TABLE " ++ (intercalate ", " escapedTables)
        rawExecute query []

getTables :: MonadIO m => ReaderT SqlBackend m [Text]
getTables = do
    tables <- rawSql "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';" []
    return $ map unSingle tables
