{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Pages.Home where

import Pages.Prelude

home :: Endpoint
home = method "GET" $ do
    mu <- get KUser
    mmsg <- get KMessage
    clear KMessage
    es <- runDB $ selectList [] [Desc EssayCreatedAt]
    respDefaultLayout $ do
        setTitle "Home"
        render $(hamletFile "html/home.hamlet")
