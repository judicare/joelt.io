{-# Language NoMonomorphismRestriction #-}
{-# Language OverloadedStrings         #-}
{-# Language RecursiveDo #-}
{-# Language QuasiQuotes               #-}

module Frontend.Main (main) where

import Control.Lens
import Data.Text.Encoding
import Reflex.Dom                     hiding (Home)
import Reflex.Dom.Contrib.Router
import ReflexJsx
import URI.ByteString
import Web.Routes

import Routes

main :: IO ()
main = mainWidget $ do
    rec rout <- route' (\ u a -> u { uriPath = encodeUtf8 a })
                       (either (const NotFound) id . fromPathInfo . uriPath)
                       upd
        el "p" $ do
            text "Current route: "
            display rout
        h <- el "p" $ (Home <$) <$> button "Home"
        r <- el "p" $ do
            text "Post: "
            routeEv <- immediately rout
            t <- textInput (def { _textInputConfig_setValue = fmap (^. _Read) routeEv })
            b <- button "Go"
            return $ Read <$> tag (current $ _textInput_value t) b
        n <- el "p" $ (NotFound <$) <$> button "Not Found"
        let upd = toPathInfo <$> leftmost [h,r,n]
    return ()

immediately b = ffor getPostBuild $ \ pb -> leftmost [updated b, tag (current b) pb]
