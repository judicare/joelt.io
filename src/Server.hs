{-# Language DeriveGeneric      #-}
{-# Language StandaloneDeriving #-}

module Server where

import Data.Serialize
import Data.Text
import Data.Text.Encoding
import Data.Time
import GHC.Generics

import Database
import Routes             (Site)

data Request = ReqRoute Site
             | ReqAuth Text
             deriving (Show, Generic)

data Response = ResHome [Essay]
              deriving (Show, Generic)

instance Serialize Request
instance Serialize Response

instance Serialize Essay

deriving instance Generic UTCTime
instance Serialize UTCTime

deriving instance Generic Day
instance Serialize Day

instance Serialize DiffTime where
    put = put . diffTimeToPicoseconds
    get = picosecondsToDiffTime <$> get
