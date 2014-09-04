{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}
module TestImport
    ( module Yesod.Test
    , module Model
    , module Foundation
    , module Database.Persist
    , runDB, withSeed
    , Spec
    , Example
    ) where

import Yesod.Test
import Database.Persist hiding (get)
import Database.Persist.Sql (SqlPersistM, runSqlPersistMPool)
import Control.Exception.Lifted
import Control.Monad
import Control.Monad.IO.Class (liftIO)
import Database.Persist.Sql (SqlBackend)

import Foundation
import Model

type Spec = YesodSpec App
type Example = YesodExample App

runDB :: SqlPersistM a -> Example a
runDB query = do
    pool <- fmap connPool getTestYesod
    liftIO $ runSqlPersistMPool query pool

withSeed :: (PersistEntity val, PersistEntityBackend val ~ SqlBackend)
         => [val] -> Example a -> Example a
withSeed xs f = do
    ks <- runDB $ mapM insert xs
    f `finally` runDB (mapM_ delete ks)
