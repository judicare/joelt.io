module Getenv where

import Crypto.Random
import Data.ByteString             (ByteString)
import Data.ByteString.Char8       (unpack)
import Data.FileEmbed              (bsToExp)
import Language.Haskell.TH
import System.Posix.Env.ByteString (getEnv)

getenv :: ByteString -> Q Exp
getenv s = do
    val <- runIO $ getEnv s
    case val of
        Just val' -> bsToExp val'
        Nothing -> error $ "Environment variable " ++ unpack s ++ " not set"

genSecret :: ByteString -> Q Exp
genSecret s = do
    val <- runIO $ getEnv s
    case val of
        Just val' -> bsToExp val'
        Nothing -> do
            dg <- runIO getSystemDRG
            let (bytes, _) = randomBytesGenerate 32 dg
            bsToExp bytes
