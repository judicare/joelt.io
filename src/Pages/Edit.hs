{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Pages.Edit where

import Pages.Form
import Pages.Prelude

edit :: EssaySlug -> Endpoint
edit slug = do
    method "GET" $ requireAuth $ \ _ -> do
        ese <- query $ SelectSlug slug
        case ese of
            Nothing -> return $ responseLBS notFound404 [] "Not found"
            Just e -> do
                view <- getForm "essay" (essayForm (Just e))
                let form = $(hamletFile "html/_form.hamlet")
                respDefaultLayout $ do
                    setTitle $ "Editing " <> unTitle (essayTitle e)
                    render $(hamletFile "html/edit.hamlet")

    method "PATCH" $ requireAuth $ \ _ -> do
        ese <- query $ SelectSlug slug
        case ese of
            Nothing -> return $ responseLBS notFound404 [] "Not found"
            Just e -> do
                (view, res) <- postFormEnv "essay" (essayForm (Just e))
                case res of
                    Nothing -> do
                        let form = $(hamletFile "html/_form.hamlet")
                        respDefaultLayout $ do
                            setTitle $ "Editing " <> unTitle (essayTitle e)
                            render $(hamletFile "html/edit.hamlet")
                    Just r -> do
                        update $ ReplaceSlug slug r
                        return $ redirectTo $ "/r/" <> encodeUtf8 (unSlug $ essaySlug r)
