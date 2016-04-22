{-# LANGUAGE CPP                        #-}
{-# LANGUAGE DeriveDataTypeable         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}

#define INSTANCES Data, Eq, Ord, Show
#define HTML_INSTANCES INSTANCES, ToMarkup

module Database where

import Control.Monad.Reader
import Control.Monad.State
import Data.Acid
import Data.Data            hiding (Proxy)
import Data.IxSet
import Data.List
import Data.Ord
import Data.SafeCopy
import Data.Text
import Data.Time
import Text.Blaze

data Database = Database
              { essays      :: IxSet Essay
              , redirectMap :: IxSet Redirect
              }

data Essay = Essay
           { essayTitle     :: EssayTitle
           , essaySlug      :: EssaySlug
           , essayContent   :: EssayContent
           , essayCreatedAt :: EssayCreatedAt
           } deriving (INSTANCES)

instance Indexable Essay where
    empty = ixSet [ ixFun indexEssay ]
        where indexEssay Essay{..} = [ essaySlug ]

newtype EssayTitle = EssayTitle { unTitle :: Text }
                     deriving (HTML_INSTANCES)
newtype EssaySlug = EssaySlug { unSlug :: Text }
                    deriving (HTML_INSTANCES)
newtype EssayContent = EssayContent { unContent :: Text }
                       deriving (HTML_INSTANCES)
newtype EssayCreatedAt = EssayCreatedAt { unCreatedAt :: UTCTime }
                         deriving (INSTANCES)

data Redirect = Redirect
              { from :: From
              , to   :: To
              } deriving (INSTANCES)

newtype From = From EssaySlug deriving (INSTANCES)
newtype To = To EssaySlug deriving (INSTANCES)

instance Indexable Redirect where
    empty = ixSet [ ixFun indexFrom, ixFun indexTo ]
        where
            indexFrom Redirect{..} = [ from ]
            indexTo Redirect{..} = [ to ]

deriveSafeCopy 0 'base ''Database
deriveSafeCopy 0 'base ''Essay
deriveSafeCopy 0 'base ''EssayTitle
deriveSafeCopy 0 'base ''EssaySlug
deriveSafeCopy 0 'base ''EssayContent
deriveSafeCopy 0 'base ''EssayCreatedAt
deriveSafeCopy 0 'base ''Redirect
deriveSafeCopy 0 'base ''To
deriveSafeCopy 0 'base ''From

getAll :: Query Database [Essay]
getAll = do
    Database essays _ <- ask
    return $ sortBy (comparing essayCreatedAt) $ toList essays

selectSlugRedirect :: EssaySlug -> Query Database (Maybe (Either EssaySlug Essay))
selectSlugRedirect slug = do
    Database{..} <- ask
    case getOne $ redirectMap @= From slug of
        Just (Redirect _ (To t)) -> return $ Just $ Left t
        Nothing -> fmap (fmap Right) $ selectSlug slug

selectSlug :: EssaySlug -> Query Database (Maybe Essay)
selectSlug slug = do
    Database{..} <- ask
    return $ getOne $ essays @= slug

replaceSlug :: EssaySlug -> Essay -> Update Database ()
replaceSlug oldSlug e = do
    ds@Database{..} <- get
    let newRedirect = if essaySlug e == oldSlug
                          then id
                          else Data.IxSet.insert
                            (Redirect (From oldSlug)
                                      (To $ essaySlug e))
    put $ ds { essays = updateIx oldSlug e essays
             , redirectMap = newRedirect redirectMap
             }

insert :: Essay -> Update Database Bool
insert e = do
    ds@Database{..} <- get
    case getOne (essays @= essaySlug e) of
        Nothing -> do
            put $ ds { essays = Data.IxSet.insert e essays }
            return True
        Just _ -> return False

delete :: EssaySlug -> Update Database Bool
delete e = do
    ds@Database{..} <- get
    case getOne (essays @= e) of
        Nothing -> return False
        Just _ -> do
            put $ ds { essays = Data.IxSet.deleteIx e essays }
            return True

makeAcidic ''Database [ 'getAll, 'selectSlugRedirect, 'selectSlug
                      , 'replaceSlug
                      , 'Database.insert, 'Database.delete]
