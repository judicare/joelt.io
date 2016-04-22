{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE OverloadedStrings #-}

module Pages.Prelude (
    module Pages.Prelude,
    module X
) where

import           Control.Monad             as X
import           Control.Monad.Reader      as X
import           Control.Monad.Writer
import qualified Data.Acid                 as A
import           Data.Acid.Core            (MethodState)
import           Data.ByteString           as X (ByteString)
import           Data.Maybe                as X
import           Data.Monoid               as X ((<>))
import           Data.Text                 as X (Text)
import           Data.Text.Encoding        as X
import           Database                  as X
import           HTMLRendering             as X
import           Network.HTTP.Types.Method
import           Network.HTTP.Types.Status as X
import           Network.Wai               as X
import           Network.Wai.Session       as X hiding (Session)
import qualified Network.Wai.Session
import           SessionData               as X hiding (clear, get, put)
import qualified SessionData               as S
import           Text.Hamlet               as X

type Session = Network.Wai.Session.Session IO ByteString ByteString

type DB = A.AcidState Database

data PageEnv = PageEnv
             { peDB      :: DB
             , peSession :: Session
             , peReq     :: Request
             }

type Endpoint = Writer [(Method, ReaderT PageEnv IO Response)] ()

respDefaultLayout :: (MonadReader PageEnv m, MonadIO m)
                  => PageWriter -> m Response
respDefaultLayout pw = do
    mu <- get KUser
    return $ responseLBS ok200 [("Content-Type", "text/html; charset=utf-8")]
        $ defaultLayout (pw >> when (isJust mu) setLoggedIn)

method :: Method -> (ReaderT PageEnv IO Response) -> Endpoint
method m q = tell [(m, q)]

redirectTo :: ByteString -> Response
redirectTo loc = responseLBS movedPermanently301 [("Location", loc)] ""

requireAuth :: (MonadReader PageEnv m, MonadIO m)
            => (User -> m Response) -> m Response
requireAuth f = do
    mu <- get KUser
    case mu of
        Nothing -> do
            put KMessage $ Message "Sorry, I'm afraid you can't do that." True
            return $ redirectTo "/"
        Just x -> f x

query :: (A.QueryEvent event, MonadIO m, MonadReader PageEnv m,
          Data.Acid.Core.MethodState event ~ Database)
      => event -> m (A.EventResult event)
query f = do
    db <- asks peDB
    liftIO $ A.query db f

update :: (A.UpdateEvent event, MonadIO m, MonadReader PageEnv m,
           Data.Acid.Core.MethodState event ~ Database)
       => event -> m (A.EventResult event)
update f = do
    db <- asks peDB
    liftIO $ A.update db f

get :: (SessionData a, MonadIO m, MonadReader PageEnv m)
    => proxy a -> m (Maybe a)
get k = do
    s <- asks peSession
    liftIO $ S.get s k

clear :: (SessionData a, MonadIO m, MonadReader PageEnv m)
      => proxy a -> m ()
clear k = do
    s <- asks peSession
    liftIO $ S.clear s k

put :: (SessionData a, MonadIO m, MonadReader PageEnv m)
    => proxy a -> a -> m ()
put k m = do
    s <- asks peSession
    liftIO $ S.put s k m
