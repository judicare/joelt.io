{-# LANGUAGE OverloadedStrings #-}

module Pages.Delete where

import Pages.Prelude

delete :: EssaySlug -> Endpoint
delete slug = method "DELETE" $ requireAuth $ \ _ -> do
    deleted <- update $ Delete slug
    if deleted
        then do
            put KMessage $ Message "All good." False
            return $ redirectTo "/"
        else do
            put KMessage $ Message "Slug not found." True
            return $ redirectTo "/"
