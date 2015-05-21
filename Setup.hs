import Control.Exception
import Control.Monad
import qualified Distribution.ModuleName
import Distribution.PackageDescription hiding (Flag)
import Distribution.Simple
import Distribution.Simple.Hpc
import Distribution.Simple.LocalBuildInfo
import Distribution.Simple.Program
import Distribution.Simple.Program.Hpc
import Distribution.Simple.Setup
import Distribution.Simple.Test
import Distribution.Text
import System.Directory
import System.FilePath
import System.IO

main :: IO ()
main = defaultMainWithHooks simpleUserHooks { testHook = testWithHpcUnion }

testWithHpcUnion :: Args -> PackageDescription -> LocalBuildInfo -> UserHooks -> TestFlags -> IO ()
testWithHpcUnion args pkg_descr lbi _ flags = do
    test args pkg_descr lbi flags

    let verbosity = fromFlag $ testVerbosity flags
        coverageEnabled = fromFlag $ configCoverage $ configFlags lbi

    when coverageEnabled $ do
        (hpcProg, hpcVer, _) <- requireProgramVersion verbosity hpcProgram anyVersion (withPrograms lbi)
        let way = guessWay lbi
            distPref = fromFlag $ testDistPref flags
            libName = display (package pkg_descr)
            htmlDir' = htmlDir distPref way libName
            suites = testSuites pkg_descr
            mixDirs = map (mixDir distPref way) (libName : map testName suites)
            tixFiles = map (tixFilePath distPref way . testName) suites
            outFile = tixFilePath distPref way libName
            excluded = concatMap testModules suites ++ [ Distribution.ModuleName.main ]

        let extraDraftsDir = "coverage"

        extraTixFiles' <- do
            e <- doesDirectoryExist extraDraftsDir
            if e
                then filter (\ x -> takeExtension x == ".draft")
                         <$> getDirectoryContents extraDraftsDir
                else return []
        let extraTixFiles = map (extraDraftsDir </>) extraTixFiles'

        bracket
            (openTempFile "." "overlay.tix")
            (\ (fp, _) -> removeFile fp)
            (\ (fp, _) -> do
                unless (null extraTixFiles) $
                    runProgramInvocation verbosity $
                        programInvocation hpcProg $
                            ["overlay"]
                         ++ map ("--hpcdir=" ++) mixDirs
                         ++ extraTixFiles
                         ++ ["--output=" ++ fp]
                let allTixFiles = (if null extraTixFiles then id else (fp :)) tixFiles
                union hpcProg verbosity allTixFiles outFile excluded
                markup hpcProg hpcVer verbosity outFile mixDirs htmlDir' excluded
            )
