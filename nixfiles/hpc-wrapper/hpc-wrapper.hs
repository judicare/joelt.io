import Control.Applicative ((<$>))
import Data.List
import System.Directory
import System.Environment
import System.IO
import System.Process

main :: IO ()
main = do
    a@(hpc:args) <- getArgs
    newArgs <- case args of
        ("markup" : _) -> addExcludes args
        xs -> return xs
    callProcess hpc newArgs

addExcludes :: [String] -> IO [String]
addExcludes args = do
    let hpcdirs = map (drop 9) $ filter ("--hpcdir" `isPrefixOf`) args
    contents <- concat <$> mapM getDirectoryContents hpcdirs
    let contentsNoMix = map (\ x -> take (length x - 4) x) contents
        badModules = filter ("Spec" `isInfixOf`) contentsNoMix
    return $ args ++ map ("--exclude=" ++) badModules
