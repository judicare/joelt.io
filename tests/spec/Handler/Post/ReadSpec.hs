{-# LANGUAGE OverloadedStrings #-}
module Handler.Post.ReadSpec (
    spec
) where

import TestImport

spec :: Spec
spec = withApp $ do
    describe "Read page" $ do
        it "shows posts" $ do
            t <- liftIO getCurrentTime
            _ <- runDB $ insert (Post "a test post" "a-test-post" "post contents" t)
            get $ ReadPostR "a-test-post"
            statusIs 200
            htmlAnyContain "article p" "post contents"

        it "renders code" $ do
            t <- liftIO getCurrentTime
            _ <- runDB $ insert (Post "a test post" "a-test-post" "``` haskell\nmain :: IO ()\n```" t)
            get $ ReadPostR "a-test-post"
            statusIs 200
            htmlAnyContain "article pre" "main"

        it "404s with unknown posts" $ do
            get $ ReadPostR "unknown-post"
            statusIs 404

    describe "Legacy page" $
        it "redirects" $ do
            get $ ReadLegacyR "foo"
            assertPermanentRedirectTo (ReadPostR "foo")
