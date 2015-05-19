{-# LANGUAGE OverloadedStrings #-}
module Handler.Post.NewSpec (
    spec
) where

import TestImport

spec :: Spec
spec = withApp $
    describe "New post" $ do
        it "creates" $ do
            login

            get NewPostR
            request $ do
                addToken
                setUrl NewPostR
                byLabel "Title" "Title"
                byLabel "Content" "foobar"
                setMethod "POST"
            assertRedirectedTo (ReadPostR "title")

        it "denies unauthenticated" $ do
            get NewPostR
            assertRedirectedTo (AuthR LoginR)
