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

data Response = ResHome [(Text, Text)]
              | ResSingle Essay
              | ResNotFound
              deriving (Show, Generic)

instance Serialize Request
instance Serialize Response
