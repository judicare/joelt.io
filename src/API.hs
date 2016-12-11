{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE GADTs              #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell    #-}

module API where

import           API.TH
import           Control.Lens.TH
import           Control.Monad       (guard)
import           Data.Aeson
import           Data.Aeson.TH
import qualified Data.HashMap.Strict as H
import           Data.Text
import           Database

data Response = PageR ResponsePage
              | AuthR (Maybe Text)
              deriving Show

data ResponsePage = HomeR (Page Preview)
                  | SingleR Post
                  | NewR
                  deriving Show

data Request = RHome Integer
             | RSingle Text
             | RNew
             | RAuthenticated
             deriving Show

data Preview = Preview
             { previewTitle :: Text
             , previewSlug  :: Text
             } deriving Show

data Page a = Page
            { nextPage     :: Maybe Integer
            , previousPage :: Maybe Integer
            , items        :: [a]
            } deriving Show

instance Functor Page where
    fmap f p = p { items = fmap f (items p) }

deriveJSON jsonOptions ''Preview
deriveJSON jsonOptions ''Page
deriveJSON jsonOptions ''Post
deriveJSON jsonOptions ''Request
deriveJSON jsonOptions ''Response
deriveJSON jsonOptions ''ResponsePage

makePrisms ''Request
makePrisms ''Response
makePrisms ''ResponsePage
