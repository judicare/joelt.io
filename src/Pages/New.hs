{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Pages.New where

import Pages.Form
import Pages.Prelude

new :: Endpoint
new = do
    method "GET" $ requireAuth $ \ _ -> do
        view <- getForm "essay" (essayForm Nothing)
        respDefaultLayout $ do
            setTitle "New post"
            let form = $(hamletFile "html/_form.hamlet")
            render $(hamletFile "html/new.hamlet")

    method "PUT" $ requireAuth $ \ _ -> do
        (view, es) <- postFormEnv "essay" (essayForm Nothing)
        case es of
            Nothing -> respDefaultLayout $ do
                setTitle "New post"
                let form = $(hamletFile "html/_form.hamlet")
                render $(hamletFile "html/new.hamlet")
            Just e -> do
                _ <- runDB $ insert e
                return $ redirectTo $ "/r/" <> encodeUtf8 (essaySlug e)
