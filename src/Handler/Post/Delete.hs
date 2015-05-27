module Handler.Post.Delete where

import Import

postDeletePostR :: PostId -> Handler Html
postDeletePostR pid = do
    _ <- requireAuthId
    post <- runDB $ get404 pid
    runDB $ delete pid
    setMessageI $ MsgDeleted (postTitle post)
    redirect HomeR
