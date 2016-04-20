{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}

module Pages.Prelude (
    module Pages.Prelude,
    module X
) where

import           Control.Monad.Writer
import           Data.Acid                 as X
import           Data.ByteString           as X (ByteString)
import           Data.Monoid               as X ((<>))
import           Data.Text                 as X (Text)
import           Database                  as X
import           HTMLRendering             as X
import           Network.HTTP.Types.Method
import           Network.HTTP.Types.Status as X
import           Network.Wai               as X
import           Network.Wai.Session       as X hiding (Session)
import qualified Network.Wai.Session
import           SessionData               as X
import           Text.Hamlet               as X

type Session = Network.Wai.Session.Session IO ByteString ByteString

type DB = AcidState Database

type Endpoint = Writer [(Method, Application)] ()

respDefaultLayout :: PageWriter -> Response
respDefaultLayout = responseLBS ok200 [("Content-Type", "text/html; charset=utf-8")] . defaultLayout

method :: Method -> Application -> Endpoint
method m q = tell [(m, q)]
