{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Pages.Home where

import Pages.Prelude

home :: Session -> DB -> Endpoint
home s db = method "GET" $ \ _ -> do
    mu <- get s KUser
    mmsg <- get s KMessage
    clear s KMessage
    es <- query db GetAll
    return $ respDefaultLayout $ do
        setTitle "Home"
        render $(hamletFile "html/home.hamlet")
