module Handler.Post.Edit where

import Handler.Post.New
import Import

getEditPostR :: PostId -> Handler Html
getEditPostR pid = do
    _ <- requireAuthId
    old <- runDB $ get404 pid
    ((_, widget), enctype) <- runFormPost $ postForm (Just old)
    let target = EditPostR pid in defaultLayout $(widgetFile "posts/form-wrapper")

postEditPostR :: PostId -> Handler Html
postEditPostR pid = do
    _ <- requireAuthId
    old <- runDB $ get404 pid
    ((res, widget), enctype) <- runFormPost $ postForm (Just old)
    case res of
        FormSuccess post -> do
            _ <- runDB $ replace pid post
            redirect $ ReadPostR (postSlug post)
        _ -> let target = EditPostR pid in defaultLayout $(widgetFile "posts/form-wrapper")
