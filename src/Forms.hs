{-# Language CPP               #-}
{-# Language FlexibleContexts  #-}
{-# Language GADTs             #-}
{-# Language OverloadedStrings #-}
{-# Language TemplateHaskell   #-}

module Forms where

import           Control.Lens
import           Control.Monad.IO.Class
import           Data.Char
import           Data.Map                   (Map)
import qualified Data.Map                   as M
import           Data.Maybe
import           Data.String
import           Data.Text                  (Text)
import qualified Data.Text                  as T
import           Data.Time
import           Text.Digestive

#if !ghcjs_HOST_OS
import           Crypto.PasswordStore
import           Data.ByteString            (ByteString)
import           Data.Text.Encoding
import           Database.Persist
import           Language.Haskell.TH.Lib
import           Language.Haskell.TH.Syntax
import           System.Environment
#endif

import           Database

type Errors = [(Path, Text)]
type FormData = Map Path Text
type FormPayload = Maybe (Errors, FormData)

mkEnv :: Applicative m => FormData -> FormEncType -> m (Env m)
mkEnv fd _ = pure $ \ path -> pure $ map TextInput $ maybeToList $ M.lookup path fd

mkSlug :: Text -> Text
mkSlug = T.foldr (\ e m -> if (T.take 1 m, e) == ("-", '-') then m else T.cons e m) mempty
       . T.map (\ x -> if isAlphaNum x then x else '-')
       . T.toLower

essayForm :: (Monad m, Monoid v, IsString v, MonadIO m
#if !ghcjs_HOST_OS
             , DBM m
#endif
             )
          => Bool -> FormData -> Form v m Essay
essayForm _checkDup fdata = (\ t c time -> Essay t (mkSlug t) c time)
    <$> "title" .: validateSlug (required (text (fdata ^? ix ["title"])))
    <*> "content" .: required (text (fdata ^? ix ["content"]))
    <*> monadic (pure <$> liftIO getCurrentTime)
    where
        required = check "Can't be empty" $ not . T.null
        validateSlug
#if !ghcjs_HOST_OS
            | _checkDup = validateM $ \ t -> do
                let slug = mkSlug t
                existing <- runDB $ getBy (UniqueEssay slug)
                case existing of
                    Nothing -> return (return t)
                    Just{} -> return $ Error "This title conflicts with an existing title"
#endif
            | otherwise = id

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
storedPw = $(qRunIO (getEnv "PASSWORD") >>= stringE)
#endif

postFormWith :: Monad m => Text -> (FormData -> Form v m a)
             -> FormData -> m (View v, Maybe a)
postFormWith name form data' = postForm name (form data') (mkEnv data')

getFormWith :: Monad m => Text -> (t -> Form v m a) -> t -> m (View v)
getFormWith name form data' = getForm name $ form data'
