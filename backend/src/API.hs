{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE CPP                       #-}
{-# LANGUAGE DeriveGeneric             #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE FlexibleInstances         #-}
{-# LANGUAGE GADTs                     #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings         #-}
{-# LANGUAGE StandaloneDeriving        #-}
{-# LANGUAGE TemplateHaskell           #-}

module API where

import           Control.Lens
import           Control.Monad.Reader
import           Data.Char
import           Data.Map             (Map)
import qualified Data.Map             as M
import           Data.Maybe
import           Data.Serialize       (Serialize (..))
import           Data.Serialize.Text  ()
import           Data.String          (IsString)
import           Data.Text            (Text)
import qualified Data.Text            as T
import           Data.Time
import           Database
import           GHC.Generics         (Generic)
import           Text.Digestive
#if !ghcjs_HOST_OS
import           Crypto.PasswordStore
import           Data.ByteString      (ByteString)
import           Data.Pool            (Pool)
import           Data.Text.Encoding
import           Database.Persist.Sql hiding (get)
import           Getenv
#endif

data Response = PageR ResponsePage
              | AuthR (Maybe Text)
              | RedirectR Request
              deriving (Show, Generic)

data ResponsePage = HomeR (Page Preview)
                  | SingleR Essay
                  | NewR FormPayload
                  | LoginR FormPayload
                  | EditR Text Text FormPayload
                  | ErrorR Text
                  deriving (Show, Generic)

type Errors = [(Path, Text)]
type FormData = Map Path Text

type FormPayload = Maybe (Errors, FormData)

data Request = RHome
             | RPage Integer
             | RSingle Text
             | RAuth Text
             | RNew (Maybe FormData)
             | REdit Text (Maybe FormData)
             | RLogin (Maybe FormData)
             | RDel Text
             deriving (Show, Generic)

data Preview = Preview
             { previewTitle :: Text
             , previewSlug  :: Text
             } deriving (Show, Generic)

data Page a = Page
            { nextPage     :: Maybe Integer
            , previousPage :: Maybe Integer
            , items        :: [a]
            } deriving (Show, Generic)

instance Functor Page where
    fmap f p = p { items = fmap f (items p) }

instance Serialize a => Serialize (Page a)
instance Serialize Essay
instance Serialize Preview
instance Serialize Request
instance Serialize Response
instance Serialize ResponsePage

deriving instance Generic UTCTime
deriving instance Generic Day

instance Serialize DiffTime where
    put = put . diffTimeToPicoseconds
    get = picosecondsToDiffTime <$> get

instance Serialize Day
instance Serialize UTCTime

makePrisms ''Request
makePrisms ''Response
makePrisms ''ResponsePage

mkEnv :: Applicative m => FormData -> FormEncType -> m (Env m)
mkEnv fd _ = pure $ \ path -> pure $ map TextInput $ maybeToList $ M.lookup path fd

loginForm :: (Monad m, Monoid v, IsString v)
          => FormData -> Form v m Text
loginForm fdata =
    "password" .: check "Password invalid" validator (text (fdata ^? ix ["password"]))
    where
#if ghcjs_HOST_OS
        validator _ = True
#else
        validator t = verifyPassword (encodeUtf8 t) storedPw

storedPw :: ByteString
storedPw = $(getenv "PASSWORD")
#endif

essayForm :: (Monad m, Monoid v, IsString v, MonadIO m
#if !ghcjs_HOST_OS
             , MonadReader (Client SqlBackend) m
#endif
             )
          => Bool -> FormData -> Form v m Essay
essayForm checkDup fdata = (\ t c time -> Essay t (mkSlug t) c time)
    <$> "title" .: validateSlug (required (text (fdata ^? ix ["title"])))
    <*> "content" .: required (text (fdata ^? ix ["content"]))
    <*> monadic (pure <$> liftIO getCurrentTime)
    where
        required = check "Can't be empty" $ not . T.null
        validateSlug
#if !ghcjs_HOST_OS
            | checkDup = validateM $ \ t -> do
                let slug = mkSlug t
                existing <- runDB $ getBy (UniqueEssay slug)
                case existing of
                    Nothing -> return (return t)
                    Just{} -> return $ Error "This title conflicts with an existing title"
#endif
            | otherwise = id

mkSlug :: Text -> Text
mkSlug = T.foldr (\ e m -> if (T.take 1 m, e) == ("-", '-') then m else T.cons e m) mempty
       . T.map (\ x -> if isAlphaNum x then x else '-')
       . T.toLower

postFormWith :: Monad m => Text -> (FormData -> Form v m a)
             -> FormData -> m (View v, Maybe a)
postFormWith name form data' = postForm name (form data') (mkEnv data')

getFormWith :: Monad m => Text -> (t -> Form v m a) -> t -> m (View v)
getFormWith name form data' = getForm name $ form data'

#if !ghcjs_HOST_OS
runDB :: (MonadReader (Client SqlBackend) m, MonadIO m)
      => SqlPersistM b -> m b
runDB m = liftIO . runSqlPersistMPool m =<< asks pool

data Client a = Client
              { pool     :: Pool a
              } deriving Show
#endif
