{-# Language DeriveGeneric              #-}
{-# Language GADTs                      #-}
{-# Language GeneralizedNewtypeDeriving #-}
{-# Language MultiParamTypeClasses      #-}
{-# Language QuasiQuotes                #-}
{-# Language StandaloneDeriving         #-}
{-# Language TemplateHaskell            #-}
{-# Language TypeFamilies               #-}

module Database where

import Data.Serialize
import Data.Serialize.Text ()
import Data.Text           (Text)
import Data.Time
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

instance Serialize DiffTime where
    put = put . diffTimeToPicoseconds
    get = picosecondsToDiffTime <$> get

deriving instance Generic Day
instance Serialize Day

deriving instance Generic UTCTime
instance Serialize UTCTime

instance Serialize Essay
