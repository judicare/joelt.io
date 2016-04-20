{-# LANGUAGE TemplateHaskell #-}

module StaticFiles where

import Control.Arrow
import Data.ByteString                (ByteString)
import Data.FileEmbed
import Data.Monoid
import Language.Haskell.TH.Syntax     (qRunIO)
import Network.Wai
import Network.Wai.Application.Static
import StaticFiles.Delegated          (allCss)

staticFiles :: [(FilePath, ByteString)]
staticFiles = map (first ("s/" <>))
    [ ("css/all.css",         $(qRunIO allCss >>= bsToExp))
    , ("js/all.js",           $(embedFile "js/all.js"))
    , ("favicon.ico",         $(embedFile "img/favicon.ico"))

    , ("img/linkedin@2x.png", $(embedFile "img/linkedin@2x.png"))
    , ("img/github@2x.png",   $(embedFile "img/github@2x.png"))
    , ("img/otter@2x.png",    $(embedFile "img/otter@2x.png"))
    , ("img/linkedin.png",    $(embedFile "img/linkedin.png"))
    , ("img/github.png",      $(embedFile "img/github.png"))
    , ("img/otter.png",       $(embedFile "img/otter.png"))

    , ("fonts/fontawesome-webfont.woff2",
        $(embedFile "bower_components/font-awesome/fonts/fontawesome-webfont.woff2"))
    , ("fonts/fontawesome-webfont.woff",
        $(embedFile "bower_components/font-awesome/fonts/fontawesome-webfont.woff"))
    , ("fonts/fontawesome-webfont.ttf",
        $(embedFile "bower_components/font-awesome/fonts/fontawesome-webfont.ttf"))
    ]

serveStatic :: Application
serveStatic = staticApp set where
    set = (defaultWebAppSettings $ error "unused") { ssLookupFile = ssLookupFile embedded }
    embedded = embeddedSettings staticFiles
