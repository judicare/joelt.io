{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StandaloneDeriving #-}

module Settings where

import ClassyPrelude.Yesod
import Control.Exception (throw)
import Data.Aeson (Result (..), fromJSON, withObject)
import Data.FileEmbed              (embedFile)
import Data.Yaml
#ifdef TESTING
import Database.Persist.Sqlite     (SqliteConf (..))
#else
import Database.Persist.Postgresql (PostgresConf (..))
#endif
import Language.Haskell.TH.Syntax
import Network.Wai.Handler.Warp    (HostPreference)
import Text.Coffee
import Text.Hamlet
import Yesod.Default.Config2       (applyEnvValue, configSettingsYml)
import Yesod.Default.Util

#ifdef TESTING
type PersistConf = SqliteConf
#else
type PersistConf = PostgresConf
#endif

data AppSettings = AppSettings
    { appStaticDir              :: String
    -- ^ Directory from which to serve static files.
    , appDatabaseConf           :: PersistConf
    -- ^ Configuration settings for accessing the database.
    , appRoot                   :: Text
    -- ^ Base for all generated URLs.
    , appStaticRoot             :: Text
    -- ^ Base for all generated URLs.
    , appHost                   :: HostPreference
    -- ^ Host/interface the server should bind to.
    , appPort                   :: Int
    -- ^ Port to listen on
    , appIpFromHeader           :: Bool
    -- ^ Get the IP address from the header when logging. Useful when sitting
    -- behind a reverse proxy.

    , appDetailedRequestLogging :: Bool
    -- ^ Use detailed request logging system
    , appShouldLogAll           :: Bool
    -- ^ Should all log messages be displayed?
    , appReloadTemplates        :: Bool
    -- ^ Use the reload version of templates
    , appSkipCombining          :: Bool
    -- ^ Perform no stylesheet/script combining

    -- Example app-specific configuration values.
    , appAuthyKey               :: String
    , appAuthyEndpoint          :: String
    }

instance FromJSON AppSettings where
    parseJSON = withObject "AppSettings" $ \o -> do
        let defaultDev =
#if DEVELOPMENT
                True
#else
                False
#endif
        appStaticDir              <- o .: "static-dir"
        appDatabaseConf           <- o .: "database"
        appRoot                   <- o .: "approot"
        appStaticRoot             <- o .: "staticroot"
        appHost                   <- fromString <$> o .: "host"
        appPort                   <- o .: "port"
        appIpFromHeader           <- o .: "ip-from-header"

        appDetailedRequestLogging <- o .:? "detailed-logging" .!= defaultDev
        appShouldLogAll           <- o .:? "should-log-all"   .!= defaultDev
        appReloadTemplates        <- o .:? "reload-templates" .!= defaultDev
        appSkipCombining          <- o .:? "skip-combining"   .!= defaultDev

        appAuthyKey               <- o .: "authy-key"
        appAuthyEndpoint          <- o .: "authy-endpoint"

        return AppSettings {..}

widgetFileSettings :: WidgetFileSettings
widgetFileSettings = def
    { wfsHamletSettings = defaultHamletSettings
        { hamletNewlines = AlwaysNewlines
        }
    , wfsLanguages = \ hset -> defaultTemplateLanguages hset ++
        [ TemplateLanguage True "coffee"
              coffeeFile
              coffeeFileReload ]
    }

widgetFile :: String -> Q Exp
widgetFile = (if appReloadTemplates compileTimeAppSettings
                then widgetFileReload
                else widgetFileNoReload)
              widgetFileSettings

configSettingsYmlBS :: ByteString
configSettingsYmlBS = $(embedFile configSettingsYml)

configSettingsYmlValue :: Value
configSettingsYmlValue = either throw id $ decodeEither' configSettingsYmlBS

compileTimeAppSettings :: AppSettings
compileTimeAppSettings =
    case fromJSON $ applyEnvValue False mempty configSettingsYmlValue of
        Error e -> error e
        Success settings -> settings
