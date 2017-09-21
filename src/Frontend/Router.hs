{-# Language FlexibleContexts #-}
{-# Language GADTs            #-}

module Frontend.Router where

import Control.Monad.Fix
import Control.Monad.IO.Class
import Control.Monad.Ref
import Data.IORef
import Data.Text.Encoding
import Foreign.JavaScript.TH
import Reflex                       hiding (Request)
import Reflex.Dom.Builder.Class
import Reflex.Dom.Builder.Immediate
import Reflex.Dom.Contrib.Router
import Reflex.Host.Class
import URI.ByteString
import Web.Routes                   hiding (Site)

import Routes
import Server

currentRoute :: (DomBuilderSpace m ~ GhcjsDomSpace, Ref m ~ IORef,
                 Ref (Performable m) ~ IORef, MonadSample t (Performable m),
                 MonadFix m, MonadHold t m, DomBuilder t m,
                 MonadReflexCreateTrigger t m, PostBuild t m, PerformEvent t m,
                 MonadIO m, MonadIO (Performable m), TriggerEvent t m,
                 HasJSContext m, HasJSContext (Performable m), HasDocument m,
                 MonadRef m, MonadRef (Performable m), PathInfo url) =>
                Event t url -> m (Dynamic t Site)
currentRoute = route'
    (\ u a -> u { uriPath = encodeUtf8 $ toPathInfo a })
    (either (const NotFound) id . fromPathInfo . uriPath)

routeToRequest :: Site -> Request
routeToRequest = ReqRoute
