{-# OPTIONS_GHC -fno-warn-orphans #-}

module Model.Instances where

import Control.Monad (liftM)
import Data.Text (pack)
import Database.Persist.Sql
import Prelude
import Text.Email.Validate
import Text.Markdown (Markdown (..))
import Web.PathPieces

instance PersistField EmailAddress where
    toPersistValue = toPersistValue . toByteString
    fromPersistValue x = do
        y <- fromPersistValue x
        case validate y of
            Left z -> Left (pack z)
            Right m -> Right m

instance PersistFieldSql EmailAddress where
    sqlType = sqlType . liftM toByteString

instance PersistField Markdown where
    toPersistValue (Markdown t) = toPersistValue t
    fromPersistValue = fmap Markdown . fromPersistValue

instance PersistFieldSql Markdown where
    sqlType = sqlType . liftM (\ (Markdown t) -> t)

instance PathPiece () where
    fromPathPiece _ = Just ()
    toPathPiece () = ""
