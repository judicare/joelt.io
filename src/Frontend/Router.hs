{-# Language FlexibleContexts #-}
{-# Language GADTs            #-}

module Frontend.Router where

import Data.Text.Encoding
import Reflex.Dom.Contrib.Router
import URI.ByteString
import Web.Routes

import Routes
import Server

currentRoute = route'
    (\ u a -> u { uriPath = encodeUtf8 $ toPathInfo a })
    (either (const NotFound) id . fromPathInfo . uriPath)

routeToRequest = ReqRoute
