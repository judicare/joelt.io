module Handler.Post.Delete where

import Import

postDeletePostR :: PostId -> Handler Html
postDeletePostR pid = do
    _ <- requireAuthId
    runDB $ delete pid
    redirect HomeR
