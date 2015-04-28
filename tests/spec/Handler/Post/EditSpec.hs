{-# LANGUAGE OverloadedStrings #-}
module Handler.Post.EditSpec (
    spec
) where

import TestImport

makeEditablePost :: YesodExample App (Key Post)
makeEditablePost = do
    t <- liftIO getCurrentTime
    k <- runDB $ insert (Post "Title" "title" "foobar" t)

    login

    get $ EditPostR k
    statusIs 200

    return k

spec :: Spec
spec = withApp $
    describe "Editing a post" $ do
        it "works" $ do
            k <- makeEditablePost

            request $ do
                addToken
                setUrl (EditPostR k)
                byLabel "Title" "A new title"
                byLabel "Content" "More post content goes here"
                setMethod "POST"
            assertRedirectedTo (ReadPostR "a-new-title")

            get (ReadPostR "title")
            statusIs 404

            get (ReadPostR "a-new-title")
            statusIs 200
            htmlAnyContain "p" "More post content goes here"
            htmlAnyContain "h1" "A new title"

        it "requires valid input" $ do
            k <- makeEditablePost

            request $ do
                addToken
                setUrl (EditPostR k)
                byLabel "Title" "Some new title"
                setMethod "POST"
            statusIs 200
