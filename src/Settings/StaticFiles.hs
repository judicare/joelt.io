module Settings.StaticFiles where

import ClassyPrelude
import Data.Default (def)
import Language.Haskell.TH (Q, Exp, Name)
import Settings (appStaticDir, compileTimeAppSettings)
import System.Exit
import System.Process.ByteString.Lazy (readProcessWithExitCode)
import Text.Lucius (luciusRTMinified)
import Text.Printf (printf)
import Yesod.Static

staticFiles (appStaticDir compileTimeAppSettings)

combineSettings :: CombineSettings
combineSettings = def
    { csStaticDir = fromString (appStaticDir compileTimeAppSettings)
    , csCssPostProcess = \fps ->
          either (error . errorIntro fps) (return . encodeUtf8)
        . flip luciusRTMinified []
        . decodeUtf8
    , csJsPostProcess = uglify
    }
    where
        errorIntro fps s = "Error minifying " ++ show fps ++ ": " ++ s

uglify :: [FilePath] -> LByteString -> IO LByteString
uglify paths code = do
    (status, out, err) <- readProcessWithExitCode "uglifyjs" ["-c", "-m"] code
    case status of
        ExitSuccess -> return out
        ExitFailure i -> error $ printf "Error minifying %s (shell exited %d): %s"
            (show paths) i (unpack $ decodeUtf8 err)

combineStylesheets :: Name -> [Route Static] -> Q Exp
combineStylesheets = combineStylesheets' False combineSettings

combineScripts :: Name -> [Route Static] -> Q Exp
combineScripts = combineScripts' False combineSettings
