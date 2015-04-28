{-# OPTIONS_GHC -fno-warn-orphans #-}

module Model.Instances where

import Control.Monad (liftM)
import Database.Persist.Sql
import Prelude
import Text.Markdown (Markdown (..))
import Web.PathPieces

instance PersistField Markdown where
    toPersistValue (Markdown t) = toPersistValue t
    fromPersistValue = fmap Markdown . fromPersistValue

instance PersistFieldSql Markdown where
    sqlType = sqlType . liftM (\ (Markdown t) -> t)

instance PathPiece () where
    fromPathPiece _ = Just ()
    toPathPiece () = ""
