{-# LANGUAGE CPP                        #-}
{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveDataTypeable         #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
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
import Data.IxSet.Typed
import Data.List
import Data.Ord
import Data.SafeCopy
import Data.Text
import Data.Time
import Text.Blaze
import Web.Routes

data Database = Database
              { essays      :: IxSet '[EssaySlug] Essay
              , redirectMap :: IxSet '[From, To] Redirect
              } deriving Show

data Essay = Essay
           { essayTitle     :: EssayTitle
           , essaySlug      :: EssaySlug
           , essayContent   :: EssayContent
           , essayCreatedAt :: EssayCreatedAt
           } deriving (INSTANCES)

instance Indexable '[EssaySlug] Essay where
    indices = ixList (ixFun indexEssay)
        where indexEssay Essay{..} = [ essaySlug ]

newtype EssayTitle = EssayTitle { unTitle :: Text }
                     deriving (HTML_INSTANCES)
newtype EssaySlug = EssaySlug { unSlug :: Text }
                    deriving (HTML_INSTANCES)
newtype EssayContent = EssayContent { unContent :: Text }
                       deriving (HTML_INSTANCES)
newtype EssayCreatedAt = EssayCreatedAt { unCreatedAt :: UTCTime }
                         deriving (INSTANCES)

instance PathInfo EssaySlug where
    toPathSegments = toPathSegments . unSlug
    fromPathSegments = fmap EssaySlug fromPathSegments

data Redirect = Redirect
              { from :: From
              , to   :: To
              } deriving (INSTANCES)

newtype From = From EssaySlug deriving (INSTANCES)
newtype To = To EssaySlug deriving (INSTANCES)

instance Indexable '[From, To] Redirect where
    indices = ixList (ixFun indexFrom) (ixFun indexTo)
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

dump :: Query Database Database
dump = ask

getAll :: Query Database [Essay]
getAll = do
    Database essays _ <- ask
    return $ sortBy (flip (comparing essayCreatedAt)) $ toList essays

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
                          else Data.IxSet.Typed.insert
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
            put $ ds { essays = Data.IxSet.Typed.insert e essays }
            return True
        Just _ -> return False

delete :: EssaySlug -> Update Database Bool
delete e = do
    ds@Database{..} <- get
    case getOne (essays @= e) of
        Nothing -> return False
        Just _ -> do
            put $ ds { essays = Data.IxSet.Typed.deleteIx e essays
                     , redirectMap = deleteAll (To e) redirectMap
                     }
            return True
    where
        deleteAll ix set = Data.List.foldr (\ a b -> Data.IxSet.Typed.delete a . b) id
                              (toList $ set @= ix) set

makeAcidic ''Database [ 'getAll, 'selectSlugRedirect, 'selectSlug
                      , 'replaceSlug, 'dump
                      , 'Database.insert, 'Database.delete]
