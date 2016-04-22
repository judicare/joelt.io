{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Pages.Edit where

import Pages.Form
import Pages.Prelude

edit :: Text -> Session -> DB -> Endpoint
edit slug sess db = do
    method "GET" $ \ _ -> requireAuth sess $ \ _ -> do
        ese <- query db $ SelectSlug $ EssaySlug slug
        case ese of
            Nothing -> return $ responseLBS notFound404 [] "Not found"
            Just e -> do
                view <- getForm "essay" (essayForm (Just e) db)
                let form = $(hamletFile "html/_form.hamlet")
                return $ respDefaultLayout $ do
                    setTitle $ "Editing " <> unTitle (essayTitle e)
                    render $(hamletFile "html/edit.hamlet")

    method "PATCH" $ \ req -> requireAuth sess $ \ _ -> do
        ese <- query db $ SelectSlug $ EssaySlug slug
        case ese of
            Nothing -> return $ responseLBS notFound404 [] "Not found"
            Just e -> do
                (view, res) <- postFormEnv req "essay" (essayForm (Just e) db)
                case res of
                    Nothing -> do
                        let form = $(hamletFile "html/_form.hamlet")
                        return $ respDefaultLayout $ do
                            setTitle $ "Editing " <> unTitle (essayTitle e)
                            render $(hamletFile "html/edit.hamlet")
                    Just r -> do
                        update db $ ReplaceSlug (EssaySlug slug) r
                        return $ redirectTo $ "/r/" <> encodeUtf8 (unSlug $ essaySlug r)
