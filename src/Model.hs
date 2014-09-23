module Model where

import Data.Text (Text)
import Data.Thyme (UTCTime)
import Database.Persist.Quasi
import Model.Instances ()
import Prelude
import Text.Markdown (Markdown)
import Yesod
import Yesod.Text.Markdown ()

share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")
