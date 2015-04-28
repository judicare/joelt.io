{-# LANGUAGE OverloadedStrings #-}
module Handler.AuthSpec (
    spec
) where

import TestImport

spec :: Spec
spec = withApp $
    describe "Auth page" $ do
        it "renders the login page" $ do
            get $ AuthR LoginR
            statusIs 200

        it "logs in" $ do
            login
            statusIs 303

        it "rejects dumb credentials" $ do
            loginWith "foobar" "baz"
            assertRedirectedTo (AuthR LoginR)

        it "logs out" $ do
            login
            statusIs 303

            post $ AuthR LogoutR
            statusIs 303
            assertRedirectedTo HomeR

        it "404s with unknown pages" $ do
            get $ AuthR $ PluginR "authy" ["foobar"]
            statusIs 404
