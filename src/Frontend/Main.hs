{-# Language CPP                       #-}
{-# Language FlexibleContexts          #-}
{-# Language NoMonomorphismRestriction #-}
{-# Language OverloadedStrings         #-}
{-# Language PartialTypeSignatures     #-}
{-# Language QuasiQuotes               #-}
{-# Language RecursiveDo               #-}

module Frontend.Main (main) where

import Control.Lens
import Control.Monad.IO.Class
import Data.Foldable             (toList)
import Data.Map                  (fromList)
import Data.Monoid
import Data.Serialize            (decode, encode)
import Data.Text                 (Text)
import Data.Text.Encoding
import GHCJS.DOM                 (currentWindow)
import GHCJS.DOM.Storage         (getItem)
import GHCJS.DOM.Window          (getLocalStorage)
import Reflex.Dom                hiding (Home, Response)
import Reflex.Dom.Contrib.Router
import ReflexJsx
import URI.ByteString
import Web.Routes                hiding (Site)

import Frontend.Connection
import Frontend.Router
import Routes
import Server

main :: IO ()
main = mainWidgetWithHead' $ (,) wHead $ \ () -> wrapPage $ do
    pb <- getPostBuild

    authKey <- liftIO $ do
        Just wv <- currentWindow
        s <- getLocalStorage wv
        m <- getItem s ("authKey" :: Text)
        return $ toList $ ReqAuth <$> m

    rec rout <- currentRoute $ traceEvent "New page" newPage

        let requestPage = leftmost
                [ ffor (tag (current rout) pb) $ \ r -> routeToRequest r : authKey
                , return . routeToRequest <$> traceEventWith show (updated rout)]

        (e500, msgEv') <- connection $ traceEvent "Request page" requestPage
        let msgEv = traceEvent "Message event" msgEv'

        hEv <- header showLoading

        pageDyn <- widgetHold (initialWidget >> return never) (page <$> msgEv)

        showLoading <- holdDyn True $ leftmost [True <$ requestPage, False <$ msgEv]

        let newPage = leftmost [hEv, switch $ current pageDyn]

        titleDyn <- holdDyn Nothing (title <$> msgEv)
    return titleDyn
    where
        initialWidget = elClass "article" "bubble" $ el "h4" $ text "Loading..."
        wrapPage = elClass "div" "row" . elClass "div" "speech large-12 columns"
        wHead titleDyn = do
            elAttr "link" ("rel" =: "stylesheet"
                        <> "href" =: staticHost "css/all.css")
                $ return ()
            elAttr "link" ("rel" =: "shortcut icon" <> "href" =: staticHost "favicon.ico")
                $ return ()
            elAttr "meta" ("name" =: "viewport" <> "content" =: "width=device-width,initial-scale=1")
                $ return ()
            el "title" $ dynText $ ffor titleDyn $ maybe "jude.bio" ("jude.bio » " <>)
#ifdef PRODUCTION
        staticHost p = "https://static.jude.bio/" <> p
#else
        staticHost p = "http://localhost:8000/s/" <> p
#endif

header :: (DomBuilder t m, Reflex t, PostBuild t m) => Dynamic t Bool -> m (Event t Site)
header showLoading = el "header" $ do
    (link', _) <- elDynAttr' "a" (headAttrs showLoading) $ text "jude.bio"
    elClass "span" "arrow" $ return ()
    elAttr "div" ("id" =: "dots") $ do
        elClass "span" "up-arrow" $ return ()
        elAttr "a" (fromList [ ("class", "dot"), ("id", "github")
                             , ("title", "I'm on GitHub!")
                             , ("href", "https://github.com/pikajude") ])
            $ text "I'm on GitHub!"
        elAttr "a" (fromList [ ("class", "dot"), ("id", "linkedin")
                             , ("title", "I'm on GitHub!")
                             , ("href", "http://www.linkedin.com/in/pikajude") ])
            $ text "I'm on LinkedIn!"
    return $ Home <$ domEvent Click link'
    where
        headAttrs loading = ffor loading $ \ l -> "id" =: "head" <> if l then "class" =: "loading" else mempty

title :: Response -> Maybe Text
title ResHome{}     = Nothing
-- title NotFound = Just "Not found"

page (ResHome _) = elClass "article" "bubble" $ do
    el "h4" $ text "Home"
    l <- link "Go to 404"
    return $ NotFound <$ _link_clicked l

-- page NotFound = elClass "article" "bubble" $ do
--     el "h4" $ text "Not found"
--     return never
