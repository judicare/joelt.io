{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE DeriveGeneric             #-}
{-# LANGUAGE FlexibleInstances         #-}
{-# LANGUAGE GADTs                     #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings         #-}
{-# LANGUAGE StandaloneDeriving        #-}
{-# LANGUAGE TemplateHaskell           #-}

module API where

import Control.Lens
import Data.Serialize      (Serialize (..))
import Data.Serialize.Text ()
import Data.Text           (Text)
import Data.Time
import Database
import GHC.Generics        (Generic)

data Response = PageR ResponsePage
              | AuthR (Maybe Text)
              | RedirectR Request
              deriving (Show, Generic)

data ResponsePage = HomeR (Page Preview)
                  | SingleR Essay
                  | NewR (Maybe (FieldResult, FieldResult))
                  | LoginR (Maybe FieldResult)
                  | ErrorR Text
                  deriving (Show, Generic)

data FormResult = FormResult
                { errorMessage :: Maybe Text
                , formAttrs    :: (FieldResult, FieldResult)
                } deriving (Show, Generic)

data FieldResult = FieldResult
                 { fieldValue :: Text
                 , fieldError :: Maybe Text
                 } deriving (Show, Generic)

type ErrorMessage = Text

data Request = RHome
             | RPage Integer
             | RSingle Text
             | RNew
             | RCreate Text Text
             | RAuth Text
             | RLogin (Maybe Text)
             deriving (Show, Generic)

data Preview = Preview
             { previewTitle :: Text
             , previewSlug  :: Text
             } deriving (Show, Generic)

data Page a = Page
            { nextPage     :: Maybe Integer
            , previousPage :: Maybe Integer
            , items        :: [a]
            } deriving (Show, Generic)

instance Functor Page where
    fmap f p = p { items = fmap f (items p) }

instance Serialize a => Serialize (Page a)
instance Serialize Essay
instance Serialize Preview
instance Serialize Request
instance Serialize Response
instance Serialize ResponsePage
instance Serialize FormResult
instance Serialize FieldResult

deriving instance Generic UTCTime
deriving instance Generic Day

instance Serialize DiffTime where
    put = put . diffTimeToPicoseconds
    get = picosecondsToDiffTime <$> get

instance Serialize Day
instance Serialize UTCTime

makePrisms ''Request
makePrisms ''Response
makePrisms ''ResponsePage
