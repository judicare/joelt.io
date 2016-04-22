import           Control.Monad
import           Control.Monad.Fix
import           Crypto.PasswordStore
import qualified Data.ByteString          as B
import           Data.ByteString.UTF8     (fromString)
import           System.Console.Haskeline
import           System.Directory
import           System.Exit
import           System.IO

main :: IO ()
main = do
    ex <- doesFileExist "important-secret"
    unless ex $ die "Please run this tool from the root of the project"

    hSetBuffering stdout NoBuffering
    hSetBuffering stdin NoBuffering

    pw1 <- fix $ \ f -> do
        pw1 <- getPw "Enter your new password: "
        pw2 <- getPw "Enter it again: "
        if pw1 == pw2
            then return pw1
            else hPutStrLn stderr "Passwords don't match." >> f

    B.writeFile "important-secret" =<< makePassword (fromString pw1) 14
    putStrLn "Updated password."

getPw :: String -> IO String
getPw s = maybe exitFailure return
    =<< runInputT defaultSettings (getPassword (Just '*') s)
