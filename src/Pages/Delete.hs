{-# LANGUAGE OverloadedStrings #-}

module Pages.Delete where

import Pages.Prelude

delete :: Text -> Endpoint
delete slug = method "DELETE" $ requireAuth $ \ _ -> do
    runDB $ deleteBy $ UniqueEssay slug
    put KMessage $ Message "All good." False
    return $ redirectTo "/"
