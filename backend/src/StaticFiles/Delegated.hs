{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}

module StaticFiles.Delegated where

import           Crypto.Hash                    (Digest, MD5, hashlazy)
import           Data.ByteString.Lazy
import qualified Data.ByteString.Lazy           as BL
import           Data.Monoid
import qualified Data.Text                      as T
import qualified Data.Text.Lazy                 as LT
import           Data.Text.Lazy.Encoding
import           Prelude                        hiding (readFile)
import           System.Exit
import           System.Process.ByteString.Lazy

fetchCss :: IO (T.Text, ByteString)
fetchCss = do
    a <- BL.readFile "css/all.scss"
    let prefixDef = "$static_prefix: '" <> staticPrefix <> "';\n"
    (exit, stdout, stderr) <- readProcessWithExitCode "sass" (args ++ extraArgs) (prefixDef <> a)
    case exit of
        ExitSuccess   -> return $ etag stdout
        ExitFailure _ -> die $ LT.unpack $ decodeUtf8 stderr
    where
        staticPrefix = "/"
        args = [ "--scss"
               , "-Icss"
               , "-Ibower_components/foundation-sites/scss"
               , "-Ibower_components/font-awesome/scss"
               ]
#ifdef PRODUCTION
        extraArgs = ["--style", "compact"]
#else
        extraArgs = []
#endif

cssnano :: ByteString -> IO ByteString
cssnano input = do
    (exit, stdout, stderr) <- readProcessWithExitCode "cssnano" [] input
    case exit of
        ExitSuccess   -> return stdout
        ExitFailure _ -> die $ LT.unpack $ decodeUtf8 stderr

etag :: ByteString -> (T.Text, ByteString)
etag s = (hash s, s) where
    hash = T.take 8 . T.pack . (show :: Digest MD5 -> String) . hashlazy
