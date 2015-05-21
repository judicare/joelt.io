{-# LANGUAGE OverloadedStrings #-}
module Handler.Post.NewSpec (
    spec
) where

import TestImport

spec :: Spec
spec = withApp $
    describe "New post" $ do
        it "creates a post" $ do
            login

            get NewPostR
            request $ do
                addToken
                setUrl NewPostR
                byLabel "Title" "Title"
                byLabel "Content" "foobar"
                setMethod "POST"
            assertRedirectedTo (ReadPostR "title")

        it "performs validation" $ do
            login

            get NewPostR
            request $ do
                addToken
                setUrl NewPostR
                setMethod "POST"
            statusIs 200
            htmlAnyContain ".error" "Value is required"

        it "rejects unauthenticated users" $ do
            get NewPostR
            assertRedirectedTo (AuthR LoginR)
