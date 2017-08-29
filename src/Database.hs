{-# Language DeriveGeneric              #-}
{-# Language GADTs                      #-}
{-# Language GeneralizedNewtypeDeriving #-}
{-# Language MultiParamTypeClasses      #-}
{-# Language QuasiQuotes                #-}
{-# Language TemplateHaskell            #-}
{-# Language TypeFamilies               #-}

module Database where

import Data.Serialize
import Data.Text           (Text)
import Data.Time           (UTCTime)
import Database.Persist.TH
import GHC.Generics        (Generic)

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Essay
    title Text
    slug Text
    content Text
    createdAt UTCTime
    UniqueEssay slug
    deriving Show Generic
|]
