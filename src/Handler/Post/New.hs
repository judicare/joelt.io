module Handler.Post.New where

import Handler.Post.Forms
import Import

getNewPostR :: Handler Html
getNewPostR = do
    _ <- requireAuthId
    ((_, widget), enctype) <- runFormPost $ postForm Nothing
    let target = NewPostR
    defaultLayout $(widgetFile "posts/form-wrapper")

postNewPostR :: Handler Html
postNewPostR = do
    _ <- requireAuthId
    ((res, widget), enctype) <- runFormPost $ postForm Nothing
    case res of
        FormSuccess post -> do
            _ <- runDB $ insert post
            redirect $ ReadPostR (postSlug post)
        _ -> do
            let target = NewPostR
            defaultLayout $(widgetFile "posts/form-wrapper")
