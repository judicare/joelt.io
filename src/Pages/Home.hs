{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Pages.Home where

import Pages.Prelude

home :: Session -> DB -> Endpoint
home s db = method "GET" $ \ _ resp -> do
    mu <- get s KUser
    mmsg <- get s KMessage
    clear s KMessage
    es <- query db GetAll
    resp $ respDefaultLayout $ do
        setTitle "Home"
        render $(hamletFile "html/home.hamlet")
