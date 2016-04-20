{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Pages.Edit where

import Pages.Form
import Pages.Prelude

edit :: Text -> Session -> DB -> Endpoint
edit slug _ db = do
    method "GET" $ \ _ resp -> do
        ese <- query db $ SelectSlug $ EssaySlug slug
        case ese of
            Nothing -> resp $ responseLBS notFound404 [] "Not found"
            Just e -> do
                view <- getForm "essay" (essayForm (Just e) db)
                let form = $(hamletFile "html/_form.hamlet")
                resp $ respDefaultLayout $ do
                    setTitle $ "Editing " <> unTitle (essayTitle e)
                    render $(hamletFile "html/edit.hamlet")

    method "PATCH" $ \ req resp -> do
        ese <- query db $ SelectSlug $ EssaySlug slug
        case ese of
            Nothing -> resp $ responseLBS notFound404 [] "Not found"
            Just e -> do
                (view, res) <- postFormEnv req "essay" (essayForm (Just e) db)
                error $ show (view, res)
