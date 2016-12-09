{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}

module Database where

import Data.Text           (Text)
import Data.Time           (UTCTime)
import Database.Persist
import Database.Persist.TH
import Text.Markdown       (Markdown)

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Post
    title Text
    slug Text
    content Text
    createdAt UTCTime
    UniquePost slug
    deriving Show
|]
