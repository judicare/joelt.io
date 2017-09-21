{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# Language CPP                        #-}
{-# Language ConstraintKinds            #-}
{-# Language DeriveGeneric              #-}
{-# Language FlexibleContexts           #-}
{-# Language GADTs                      #-}
{-# Language GeneralizedNewtypeDeriving #-}
{-# Language MultiParamTypeClasses      #-}
{-# Language QuasiQuotes                #-}
{-# Language StandaloneDeriving         #-}
{-# Language TemplateHaskell            #-}
{-# Language TypeFamilies               #-}

module Database where

import Data.Serialize
import Data.Serialize.Text         ()
import Data.Text                   (Text)
import Data.Time
import Database.Persist.TH
import GHC.Generics                (Generic)

#if !ghcjs_HOST_OS
import Control.Monad.Reader
import Control.Monad.Trans.Control
import Data.Pool
import Database.Persist.Postgresql (SqlBackend, runSqlPool)
#endif

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Essay
    title Text
    slug Text
    content Text
    createdAt UTCTime
    UniqueEssay slug
    deriving Show Generic
|]

instance Serialize DiffTime where
    put = put . diffTimeToPicoseconds
    get = picosecondsToDiffTime <$> get

deriving instance Generic Day
instance Serialize Day

deriving instance Generic UTCTime
instance Serialize UTCTime

instance Serialize Essay

#if !ghcjs_HOST_OS
type DBM m = (MonadReader (Pool SqlBackend) m, MonadBaseControl IO m)

runDB :: (MonadReader (Pool SqlBackend) m, MonadBaseControl IO m)
      => ReaderT SqlBackend m b -> m b
runDB x = do
    pool <- ask
    runSqlPool x pool
#endif
