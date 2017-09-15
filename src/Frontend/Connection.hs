{-# Language FlexibleContexts      #-}
{-# Language OverloadedStrings     #-}
{-# Language PartialTypeSignatures #-}
{-# Language ScopedTypeVariables   #-}

module Frontend.Connection where

import Control.Lens
import Control.Monad.IO.Class
import Data.Serialize
import Reflex.Dom             hiding (Request, Response)

import Server

connection :: forall t m.
              (Reflex t, Applicative m, MonadIO m, MonadIO (Performable m),
               HasJSContext m, PerformEvent t m, TriggerEvent t m, PostBuild t m)
           => Event t [Request]
           -> m (Event t String, Event t Response)
connection pageRequest = do
    socket <- webSocket "ws://localhost:8000/" $ def
        { _webSocketConfig_send = map encode <$> pageRequest
        }
    let recv = decode <$> _webSocket_recv socket :: Event t (Either String Response)
        e500 = fmapMaybe (^? _Left) recv
        eok = fmapMaybe (^? _Right) recv
    pure (e500, eok)
