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

data Database = Database (IxSet Essay)

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

deriveSafeCopy 0 'base ''Database
deriveSafeCopy 0 'base ''Essay
deriveSafeCopy 0 'base ''EssayTitle
deriveSafeCopy 0 'base ''EssaySlug
deriveSafeCopy 0 'base ''EssayContent
deriveSafeCopy 0 'base ''EssayCreatedAt

getAll :: Query Database [Essay]
getAll = do
    Database essays <- ask
    return $ sortBy (comparing essayCreatedAt) $ toList essays

selectSlug :: EssaySlug -> Query Database (Maybe Essay)
selectSlug slug = do
    Database essays <- ask
    return $ getOne $ essays @= slug

replaceSlug :: EssaySlug -> Essay -> Update Database ()
replaceSlug slug e = do
    Database essays <- get
    put $ Database $ updateIx slug e essays

insert :: Essay -> Update Database (Maybe String)
insert e = do
    Database es <- get
    case getOne (es @= essaySlug e) of
        Nothing -> do
            put $ Database $ Data.IxSet.insert e es
            return Nothing
        Just _ -> return $ Just "Slug collision"

delete :: EssaySlug -> Update Database Bool
delete e = do
    Database es <- get
    case getOne (es @= e) of
        Nothing -> return False
        Just _ -> do
            put $ Database $ Data.IxSet.deleteIx e es
            return True

makeAcidic ''Database ['getAll, 'selectSlug, 'replaceSlug, 'Database.insert, 'Database.delete]
