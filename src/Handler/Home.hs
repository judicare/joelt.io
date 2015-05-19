module Handler.Home where

import Data.ByteString.Builder
import qualified Database.Esqueleto as E
import Import
import Text.Blaze.Html.Renderer.Text
import Yesod.Paginate

getFeedR :: Handler TypedContent
getFeedR = do
    posts <- runDB $ selectList [] [Desc PostCreatedAt]
    cur <- liftIO getCurrentTime
    newsFeed Feed
        { feedTitle = "joelt.io"
        , feedLinkSelf = FeedR
        , feedLinkHome = HomeR
        , feedAuthor = "Joel Taylor"
        , feedDescription = "Haskell, Ruby, and friends"
        , feedLanguage = "en-US"
        , feedUpdated = case posts of
            (Entity _ x:_) -> postCreatedAt x
            [] -> cur
        , feedEntries = map (toFeedEntry . entityVal) posts
        }

toFeedEntry :: Post -> FeedEntry (Route App)
toFeedEntry p = FeedEntry
    { feedEntryLink = ReadPostR (postSlug p)
    , feedEntryUpdated = postCreatedAt p
    , feedEntryTitle = postTitle p
    , feedEntryContent = toHtml $ postContent p
    }

getHomeR :: Handler Html
getHomeR = getPageR 1

getPageR :: Int -> Handler Html
getPageR i = do
    m <- maybeAuthId
    posts <- paginateWith (PageConfig 5 i PageR) $ \p -> do
        E.orderBy [E.desc (p E.^. PostCreatedAt)]
        return p
    defaultLayout $ do
        addCommentCounts (pageResults posts)
        $(widgetFile "home")

-- Manually calls to the disqus API and fetches post counts for all shown
-- posts. Long story short, you can't put HTML in the Disqus custom comment
-- counter, and we like our glyphicons
addCommentCounts :: [Entity Post] -> Widget
addCommentCounts posts = do
    u <- getUrlRenderParams
    let urls = map (\(Entity _ post) ->
                let v = [hamlet|@{ReadPostR (postSlug post)}|]
                 in ("2", Just . toStrict . renderHtml $ v u)) posts
        qs = decodeUtf8 . toLazyByteString $ renderQueryText True urls
    addScriptRemote [st|//otters.disqus.com/count-data.js#{qs}|]
