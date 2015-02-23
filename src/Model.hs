module Model where

import ClassyPrelude.Yesod
import Database.Persist.Quasi
import Model.Instances ()
import Text.Email.Validate
import Text.Markdown (Markdown)

share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")
