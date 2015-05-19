{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}
module TestImport
    ( module TestImport
    , module X
    ) where

import Application (makeFoundation)
import Blaze.ByteString.Builder
import ClassyPrelude as X
import Data.Aeson
import Database.Persist as X hiding (get)
import Database.Persist.Sql
import Foundation as X
import Model as X
import Network.HTTP.Types.Header as X
import Network.Wai.Test as X (SResponse(..))
import Settings
import Test.Hspec as X
import Text.Shakespeare.Text as X hiding (text)
import Yesod.Auth as X
import qualified Yesod.Core as Core
import Yesod.Default.Config2 (ignoreEnv, loadAppSettings)
import Yesod.Test as X

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
    makeFoundation settings >>= wipeDB

wipeDB :: App -> IO App
wipeDB app = do
    let sqlitePool = appConnPool app
    _ <- flip runSqlPersistMPool sqlitePool $
             rawSql "PRAGMA foreign_keys = OFF;" [] :: IO [Entity Post]

    flip runSqlPersistMPool sqlitePool $ do
        tables <- getTables
        sqlBackend <- ask
        let queries = map (\t -> "DELETE FROM " ++ connEscapeName sqlBackend (DBName t)) tables
        forM_ queries (\q -> rawExecute q [])

    return app

getTables :: MonadIO m => ReaderT SqlBackend m [Text]
getTables = do
    tables <- rawSql "SELECT name FROM sqlite_master WHERE type = 'table';" []
    return (fmap unSingle tables)

login :: YesodExample App ()
login = do
    loginWith "me@joelt.io" "0000000"
    assertRedirectedTo HomeR

loginWith :: Text -> Text -> YesodExample App ()
loginWith email password = do
    request $ do
        setMethod "POST"
        setUrl $ AuthR $ PluginR "authy" ["login"]
        addPostParam "email" email
        addPostParam "password" password
    statusIs 303

assertRedirectedTo, assertPermanentRedirectTo
    :: Core.RenderRoute a => Route a -> YesodExample App ()
assertRedirectedTo = redirectHelper 303
assertPermanentRedirectTo = redirectHelper 301

redirectHelper :: Core.RenderRoute a => Int -> Route a -> YesodExample App ()
redirectHelper s m = do
    app <- getTestYesod
    let dest = toByteString $ uncurry
                   (Core.joinPath app (appRoot (appSettings app)))
                   (Core.renderRoute m)
    statusIs s
    assertHeader "Location" dest

getJson :: Core.RedirectUrl App url => url -> YesodExample App ()
getJson u = request $ do
    setUrl u
    addRequestHeader (hAccept, "application/json")

bodyHasKey :: Core.ToJSON a => Text -> a -> YesodExample App ()
bodyHasKey k v = withResponse $ \ res -> liftIO $
    case ((decode :: LByteString -> Maybe Object) >=> lookup k) (simpleBody res) of
        Nothing -> expectationFailure ("Body should have key "
                       ++ unpack k
                       ++ ", but no such key was found")
        Just val -> val `shouldBe` Core.toJSON v
