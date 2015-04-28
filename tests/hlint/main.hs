import Control.Monad
import Language.Haskell.HLint
import System.Environment
import System.Exit

main :: IO ()
main = do
    args <- getArgs
    hints <- hlint $ [".", "--cpp-define=HLINT", "--cpp-ansi", "-XQuasiQuotes"] ++ args
    unless (null hints) exitFailure
