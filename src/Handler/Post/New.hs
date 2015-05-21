module Handler.Post.New where

import Data.Char (isAlphaNum)
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
        mkSlug = squash . omap dasherize . toLower where
            dasherize x = if isAlphaNum x then x else '-'
            squash = ofoldr (\ e m -> if (headMay m, e) == (Just '-', '-')
                                then m
                                else e `cons` m) mempty

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
