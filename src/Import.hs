module Import
    ( module Import
    ) where

import Control.Applicative     as Import (pure, (<$>), (<*>))
import Data.Maybe              as Import (fromMaybe, fromJust)
import Data.Monoid             as Import
import Data.Text               as Import (Text)
import Data.Thyme              as Import (getZonedTime)
import Data.Thyme.Format       as Import (formatTime)
import Data.Thyme.Time.Core    as Import (fromThyme, toThyme)
import Foundation              as Import
import Model                   as Import
import Prelude                 as Import hiding (head, init, last, readFile, tail, writeFile)
import Settings                as Import
import Settings.Development    as Import
import Settings.StaticFiles    as Import
import System.Locale           as Import
import Text.Markdown           as Import
import Text.Shakespeare.Text   as Import (st)
import Yesod                   as Import hiding (Route (..))
import Yesod.Auth              as Import hiding (requireAuthId)

-- requireAuthId wants a YesodAuthPersist instance for some reason. Who
-- knows?
requireAuthId :: Handler (AuthId App)
requireAuthId = maybeAuthId >>= maybe (permissionDenied "Turn back.") return
