module Settings.StaticFiles where

import Data.Default (def)
import qualified Data.Text.Lazy.Encoding as LT
import Language.Haskell.TH (Q, Exp, Name)
import Prelude
import Settings (staticDir)
import Settings.Development
import Text.Jasmine
import Text.Lucius (luciusRTMinified)
import Yesod.Static
import qualified Yesod.Static as Static

staticSite :: IO Static.Static
staticSite = if development then Static.staticDevel staticDir
                            else Static.static      staticDir

$(staticFiles Settings.staticDir)

combineSettings :: CombineSettings
combineSettings = def
    { csCssPostProcess = \fps ->
          either (error . errorIntro fps) (return . LT.encodeUtf8)
        . flip luciusRTMinified []
        . LT.decodeUtf8
    , csJsPostProcess = \fps -> either (error . errorIntro fps) return . minifym
    }

errorIntro :: Show a => a -> String -> String
errorIntro fps s = "Error minifying" ++ show fps ++ ": " ++ s

combineStylesheets :: Name -> [Route Static] -> Q Exp
combineStylesheets = combineStylesheets' development combineSettings

combineScripts :: Name -> [Route Static] -> Q Exp
combineScripts = combineScripts' development combineSettings
