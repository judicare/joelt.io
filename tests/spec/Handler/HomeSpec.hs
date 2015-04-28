{-# LANGUAGE OverloadedStrings #-}
module Handler.HomeSpec (
    spec
) where

import TestImport

spec :: Spec
spec = withApp $
    describe "Home page" $ do
        it "loads the index and checks it looks right" $ do
            t <- liftIO getCurrentTime
            _ <- runDB $ insert (Post "a test post" "a-test-post" "post contents" t)
            get HomeR
            statusIs 200
            htmlAnyContain "h5" "I’m Joel, a functional programmer with a colorful head."
            htmlCount ".preview-bubble" 1

        describe "uses pages" $ do
            it "next" $ do
                t <- liftIO getCurrentTime
                _ <- runDB $ forM [1..30 :: Int] (\ n -> insert
                         (Post [st|a test post #{n}|]
                               [st|a-test-post-#{n}|]
                               "post contents"
                               t))
                get $ PageR 3
                statusIs 200
                htmlAnyContain "a" "forward →"

            it "previous" $ do
                t <- liftIO getCurrentTime
                _ <- runDB $ insert (Post "a test post" "a-test-post" "post contents" t)
                get $ PageR 3
                statusIs 200
                htmlAnyContain "a" "← back"

        it "checks the feed" $ do
            t <- liftIO getCurrentTime
            _ <- runDB $ insert (Post "a test post" "a-test-post" "post contents" t)
            get FeedR
            statusIs 200
            htmlAnyContain "title" "a test post"

        it "is ok with no feed posts" $ do
            get FeedR
            statusIs 200
