{-# LANGUAGE StandaloneDeriving #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Model.Instances where

import Control.Monad (liftM)
import Data.Thyme
import Data.Thyme.Time.Core
import Database.Persist.Sql
import Prelude
import Web.PathPieces

instance PersistField UTCTime where
    toPersistValue = toPersistValue . fromThyme
    fromPersistValue = fmap toThyme . fromPersistValue

instance PersistFieldSql UTCTime where
    sqlType = sqlType . liftM fromThyme

instance PathPiece () where
    fromPathPiece _ = Just ()
    toPathPiece () = ""
