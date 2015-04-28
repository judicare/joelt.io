{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

-- | Easy pagination for Yesod.
module Yesod.Paginate (
    -- *** Paginating
    paginateWith,

    -- *** Datatypes
    PageConfig (..),
    Page (..)
) where

import Control.Monad
import Data.Int
import Data.Maybe
import Database.Esqueleto
import Database.Esqueleto.Internal.Language
import Database.Esqueleto.Internal.Sql
import Prelude
import Yesod hiding (Value)

-- | Metadata about how pagination should work.
data PageConfig app = PageConfig
    { pageSize :: Int
    , currentPage :: Int
    , pageRoute :: Int -> Route app
    }

-- | Returned by 'paginate' and friends.
data Page route r = Page
    { pageResults :: [r] -- ^ Returned entities.
    , nextPage :: Maybe route -- ^ Link to next page.
    , previousPage :: Maybe route -- ^ Link to previous page.
    }

-- | Paginate a model, given a configuration and an esqueleto query.
paginateWith :: ( From SqlQuery SqlExpr SqlBackend a1, SqlSelect a a2
                , YesodPersist site, YesodPersistBackend site ~ SqlBackend
                )
             => PageConfig app -- ^ Preferred config.
             -> (a1 -> SqlQuery a) -- ^ SQL query.
             -> HandlerT site IO (Page (Route app) a2) -- ^ Returned page.
paginateWith c sel = do
    let cp = max 1 $ fromIntegral (currentPage c)

    es <- runDB $ select $ from $ \ u -> do
        limit (fromIntegral (pageSize c) + 1)
        offset $ max 0 $ fromIntegral (pageSize c) * (cp - 1)
        sel u

    let route = pageRoute c . fromIntegral

    return Page { pageResults = take (fromIntegral $ pageSize c) es
                , nextPage = if fromIntegral (length es) == pageSize c + 1
                                 then Just (route $ cp + 1)
                                 else Nothing
                , previousPage = if cp == 1 then Nothing else Just (route $ cp - 1)
                }
