module Handler.Post.New where

import Control.Lens
import Data.Char
import Data.Text.Lens
import Import
import Yesod.Text.Markdown

postForm :: Maybe Post -> Form Post
postForm mp extra = do
    (tres, tview) <- mreq textField (bootstrapInput "Title") (postTitle <$> mp)
    let sl = fmap mkSlug tres
    (ctres, ctview) <- mreq markdownField (bootstrapTextarea "Content") (postContent <$> mp)
    curtime <- liftIO getCurrentTime
    let pRes = Post <$> tres <*> sl <*> ctres <*> pure curtime
    return (pRes, $(widgetFile "posts/form"))
    where
        bootstrapInput m = m { fsAttrs = [("class", "form-control")] }
        bootstrapTextarea m = m { fsAttrs = [("class", "form-control"), ("rows", "10")] }
        mkSlug = over text (dasherize . toLower) where
            dasherize x | isAlphaNum x = x
                        | otherwise = '-'

getNewPostR :: Handler Html
getNewPostR = do
    _ <- requireAuthId
    ((_, widget), enctype) <- runFormPost $ postForm Nothing
    let target = NewPostR in defaultLayout $(widgetFile "posts/form-wrapper")

postNewPostR :: Handler Html
postNewPostR = do
    _ <- requireAuthId
    ((res, widget), enctype) <- runFormPost $ postForm Nothing
    case res of
        FormSuccess post -> do
            _ <- runDB $ insert post
            redirect $ ReadPostR (postSlug post)
        _ -> let target = NewPostR in defaultLayout $(widgetFile "posts/form-wrapper")
