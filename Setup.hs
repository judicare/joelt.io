import Control.Monad
import Distribution.Simple
import Distribution.Simple.LocalBuildInfo
import System.Directory
import System.FilePath

main :: IO ()
main = defaultMainWithHooks $ simpleUserHooks
    { postBuild = \ _ _ _ lbi -> when (compilerFlavor (compiler lbi) == GHCJS) $ do
        d <- getCurrentDirectory
        let bDir = buildDir lbi
            exePath = bDir </> "jude-web" </> "jude-web.jsexe"
        putStrLn $ "Replacing " ++ exePath </> "index.html"
        copyFile (d </> "support" </> "index.override.html")
                 (exePath </> "index.html")
    }
