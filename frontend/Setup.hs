import Distribution.Simple
import Distribution.Simple.LocalBuildInfo
import System.Directory
import System.FilePath

main :: IO ()
main = defaultMainWithHooks $ simpleUserHooks
    { postBuild = \ _ _ _ lbi -> do
        d <- getCurrentDirectory
        let bDir = buildDir lbi
            exePath = bDir </> "frontend" </> "frontend.jsexe"
        putStrLn $ "Replacing " ++ exePath </> "index.html"
        copyFile (d </> "support" </> "index.override.html")
                 (exePath </> "index.html")
    }
