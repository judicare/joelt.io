{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Pages.Login where

import Control.Monad
import Crypto.PasswordStore
import Data.FileEmbed
import Data.Maybe
import Pages.Form
import Pages.Prelude

loginForm :: Monad m => Form Text m Text
loginForm = const
    <$> "username" .: check "Can't be empty." (/= mempty) (text Nothing)
    <*> "password" .: checkPw (text Nothing)
    where
        checkPw = check "Invalid password." $
            \ pw -> verifyPassword (encodeUtf8 pw) $(embedFile "important-secret")

logout :: Endpoint
logout = method "GET" $ do
    m <- get KUser
    when (isJust m) $ do
        clear KUser
        put KMessage $ Message "All good." False
    return $ redirectTo "/"

login :: Endpoint
login = do
    method "GET" $ do
        mu <- get KUser
        case mu of
            Just _ -> return $ redirectTo "/"
            Nothing -> do
                view <- getForm "login" loginForm
                respDefaultLayout $ do
                    setTitle "Log in"
                    render $(hamletFile "html/login.hamlet")

    method "POST" $ do
        mu <- get KUser
        case mu of
            Just _ -> return $ redirectTo "/"
            Nothing -> do
                (view, res) <- postFormEnv "login" loginForm
                case res of
                    Nothing -> respDefaultLayout $ do
                        setTitle "Log in"
                        render $(hamletFile "html/login.hamlet")
                    Just user -> do
                        put KUser $ User user
                        put KMessage $ Message "All good" False
                        return $ redirectTo "/"
