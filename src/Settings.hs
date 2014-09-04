module Settings where

import Control.Applicative
import Control.Lens
import Data.Default (def)
import Data.Monoid ((<>))
import Data.Text (Text)
import Data.Text.Lens
import Data.Yaml
import Database.Persist.Postgresql (PostgresConf)
import Language.Haskell.TH.Syntax
import Network.URI
import Prelude
import Settings.Development
import Text.Hamlet
import Text.Shakespeare.Text (st)
import Yesod.Default.Config
import Yesod.Default.Util

type PersistConf = PostgresConf

staticDir :: FilePath
staticDir = "static"

staticRoot :: AppConfig DefaultEnv x -> Text
staticRoot conf =
    if development
        then [st|#{appRoot conf}/s|]
        else staticize (appRoot conf)

staticize :: Text -> Text
staticize t = t & unpacked . _URI . _uriAuthority . _Just . _uriRegName
                %~ ("static." <>)
    where
        _URI = prism' show parseURI
        _uriAuthority = lens uriAuthority (\ a b -> a { uriAuthority = b })
        _uriRegName = lens uriRegName (\ a b -> a { uriRegName = b })

widgetFileSettings :: WidgetFileSettings
widgetFileSettings = def
    { wfsHamletSettings = defaultHamletSettings
        { hamletNewlines = AlwaysNewlines
        }
    }

widgetFile :: String -> Q Exp
widgetFile = (if development then widgetFileReload
                             else widgetFileNoReload)
              widgetFileSettings

data Extra = Extra
    { extraCopyright :: Text
    , extraAnalytics :: Maybe Text
    } deriving Show

parseExtra :: DefaultEnv -> Object -> Parser Extra
parseExtra _ o = Extra
    <$> o .:  "copyright"
    <*> o .:? "analytics"
