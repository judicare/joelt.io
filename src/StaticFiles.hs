{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module StaticFiles where

import qualified Data.ByteString.Lazy          as BL
import           Data.FileEmbed
import           Data.Monoid
import           Network.Mime
import           StaticFiles.Delegated
import           WaiAppStatic.Storage.Embedded

mkEmbedded :: IO [EmbeddableEntry]
mkEmbedded = do
    ec <- embeddedCss
    return [ ec
           , toEmbedded "js/all.js"           $(embedFile "js/all.js")

           , toEmbedded "favicon.ico"         $(embedFile "img/favicon.ico")
           , toEmbedded "img/github@2x.png"   $(embedFile "img/github@2x.png")
           , toEmbedded "img/github.png"      $(embedFile "img/github.png")
           , toEmbedded "img/linkedin@2x.png" $(embedFile "img/linkedin@2x.png")
           , toEmbedded "img/linkedin.png"    $(embedFile "img/linkedin.png")
           , toEmbedded "img/newpost@2x.png"  $(embedFile "img/newpost@2x.png")
           , toEmbedded "img/newpost.png"     $(embedFile "img/newpost.png")
           , toEmbedded "img/otter@2x.png"    $(embedFile "img/otter@2x.png")
           , toEmbedded "img/otter.png"       $(embedFile "img/otter.png")
           , toEmbedded "img/loading@2x.gif"  $(embedFile "img/loading@2x.gif")
           , toEmbedded "img/loading.gif"     $(embedFile "img/loading.gif")

           , toEmbedded "fonts/fontawesome-webfont.woff2"
               $(embedFile "bower_components/font-awesome/fonts/fontawesome-webfont.woff2")
           , toEmbedded "fonts/fontawesome-webfont.woff"
               $(embedFile "bower_components/font-awesome/fonts/fontawesome-webfont.woff")
           , toEmbedded "fonts/fontawesome-webfont.ttf"
               $(embedFile "bower_components/font-awesome/fonts/fontawesome-webfont.ttf")
           ]
    where
        toEmbedded f s = EmbeddableEntry
                       { eLocation = "s/" <> f
                       , eMimeType = defaultMimeLookup f
                       , eContent = Left $ etag $ BL.fromStrict s
                       }

embeddedCss :: IO EmbeddableEntry
embeddedCss = do
#ifdef PRODUCTION
    (a,b) <- fetchCss
    content <- Left . ((,) a) <$> cssnano b
#else
    let content = Right [|fetchCss|]
#endif
    return EmbeddableEntry
        { eLocation = "s/css/all.css"
        , eMimeType = "text/css"
        , eContent = content
        }
