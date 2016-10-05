{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Pages.Edit where

import Pages.Form
import Pages.Prelude

edit :: Text -> Endpoint
edit slug = do
    method "GET" $ requireAuth $ \ _ -> do
        ese <- runDB $ getBy $ UniqueEssay slug
        case ese of
            Nothing -> return $ responseLBS notFound404 [] "Not found"
            Just (Entity _ e) -> do
                view <- getForm "essay" (essayForm (Just e))
                let form = $(hamletFile "html/_form.hamlet")
                respDefaultLayout $ do
                    setTitle $ "Editing " <> essayTitle e
                    render $(hamletFile "html/edit.hamlet")

    method "PATCH" $ requireAuth $ \ _ -> do
        ese <- runDB $ getBy $ UniqueEssay slug
        case ese of
            Nothing -> return $ responseLBS notFound404 [] "Not found"
            Just (Entity k e) -> do
                (view, res) <- postFormEnv "essay" (essayForm (Just e))
                case res of
                    Nothing -> do
                        let form = $(hamletFile "html/_form.hamlet")
                        respDefaultLayout $ do
                            setTitle $ "Editing " <> essayTitle e
                            render $(hamletFile "html/edit.hamlet")
                    Just r -> do
                        runDB $ do
                            replace k r
                            when (slug /= essaySlug r) $
                                void $ insert $ Redirect slug (essaySlug r)
                        return $ redirectTo $ "/r/" <> encodeUtf8 (essaySlug r)
