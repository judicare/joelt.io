{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module StaticFiles.Delegated where

import qualified Data.ByteString                as B
import           Data.ByteString.Lazy
import           Data.Text.Lazy.Encoding
import           Prelude                        hiding (readFile)
import           Text.Lucius
#ifdef PRODUCTION
import qualified Data.Text.Lazy                 as T (unpack)
import           System.Exit
import           System.Process.ByteString.Lazy
#endif

allCss :: IO B.ByteString
allCss = do
    normalizeCss <- readFile "bower_components/foundation-sites/dist/foundation.css"
    fontAwesomeCss <- readFile "bower_components/font-awesome/css/font-awesome.css"
    let full = mconcat
            [ normalizeCss, fontAwesomeCss
            , cssToBs $(luciusFile "css/all.lucius")
            , cssToBs $(luciusFile "css/form.lucius")
            , cssToBs $(luciusFile "css/home.lucius")
            , cssToBs $(luciusFile "css/single.lucius")
            ]
    toStrict <$>
#ifdef PRODUCTION
        minify full
#else
        pure full
#endif
    where
        cssToBs c = encodeUtf8 (renderCss $ c id)

#ifdef PRODUCTION
minify :: ByteString -> IO ByteString
minify input = do
    (exit, stdout, stderr) <- readProcessWithExitCode "yuicompressor" ["--type", "css"] input
    case exit of
        ExitSuccess -> return stdout
        ExitFailure _ -> die $ T.unpack $ decodeUtf8 stderr
#endif
