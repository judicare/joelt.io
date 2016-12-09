{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE GADTs              #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell    #-}

module API where

import           API.TH
import           Control.Monad       (guard)
import           Data.Aeson
import           Data.Aeson.TH
import qualified Data.HashMap.Strict as H
import           Data.Text
import           Database

data Response = HomeR (Page Preview)
              | SingleR Post
              | NothingR
              deriving Show

data Request = RHome Integer
             | RSingle Text
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
