{-# LANGUAGE OverloadedStrings #-}
module Handler.HomeSpec (
    spec
) where

import TestImport hiding (singleton)

spec :: Spec
spec = withApp $ do
    describe "These are some example tests" $ do
        it "loads the index and checks it looks right" $ do
            t <- liftIO getCurrentTime
            _ <- runDB $ insert (Post "a test post" "a-test-post" "post contents" t)
            get HomeR
            statusIs 200
            htmlAnyContain "h5" "I’m Joel, a functional programmer with a colorful head."
            htmlCount ".preview-bubble" 1
