module Handler.Home where

import Blaze.ByteString.Builder.Internal
import Control.Lens
import Control.Monad
import Data.Text.Lazy (toStrict)
import Data.Text.Encoding (decodeUtf8)
import Data.Thyme.LocalTime
import qualified Database.Esqueleto as E
import Import
import Network.HTTP.Types.URI
import Text.Blaze.Html.Renderer.Text
import Yesod.Feed
import Yesod.Paginate

getFeedR :: Handler TypedContent
getFeedR = do
    posts <- runDB $ selectList [] [Desc PostCreatedAt]
    cur <- liftIO getZonedTime
    newsFeed Feed
        { feedTitle = "joelt.io"
        , feedLinkSelf = FeedR
        , feedLinkHome = HomeR
        , feedAuthor = "Joel Taylor"
        , feedDescription = "Haskell, Ruby, and friends"
        , feedLanguage = "en-US"
        , feedUpdated = fromThyme . snd $ case posts of
                            (Entity _ x:_) -> postCreatedAt x ^. from zonedTime
                            [] -> cur ^. from zonedTime
        , feedEntries = map (toFeedEntry . entityVal) posts
        }

toFeedEntry :: Post -> FeedEntry (Route App)
toFeedEntry p = FeedEntry
    { feedEntryLink = ReadPostR (postSlug p)
    , feedEntryUpdated = fromThyme $ snd (postCreatedAt p ^. from zonedTime)
    , feedEntryTitle = postTitle p
    , feedEntryContent = toHtml $ postContent p
    }

getHomeR :: Handler Html
getHomeR = getPageR 1

getPageR :: Int -> Handler Html
getPageR i = do
    m <- maybeAuthId
    posts <- paginateWith (PageConfig 5 i HomeR PageR) $ \p -> do
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
    urls <- forM posts $ \(Entity _ post) -> do
        let v = [hamlet|@{ReadPostR (postSlug post)}|]
        return ("2", Just . toStrict . renderHtml $ v u)
    let qs = decodeUtf8 . toByteString $ renderQueryText True urls
    addScriptRemote [st|//otters.disqus.com/count-data.js#{qs}|]
