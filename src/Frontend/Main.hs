{-# Language CPP                       #-}
{-# Language DataKinds                 #-}
{-# Language ExplicitForAll            #-}
{-# Language FlexibleContexts          #-}
{-# Language GADTs                     #-}
{-# Language NoMonomorphismRestriction #-}
{-# Language OverloadedStrings         #-}
{-# Language PartialTypeSignatures     #-}
{-# Language QuasiQuotes               #-}
{-# Language RecursiveDo               #-}
{-# Language ScopedTypeVariables       #-}

module Frontend.Main where

import           Control.Lens              hiding (element)
import           Control.Monad
import           Control.Monad.IO.Class
import           Control.Monad.Trans
import           Data.Foldable             (toList)
import           Data.Map                  (fromList)
import           Data.Monoid
import           Data.Proxy
import           Data.Serialize            (decode, encode)
import           Data.Text                 (Text, pack)
import           Data.Text.Encoding
import           GHCJS.DOM                 (currentWindow)
import           GHCJS.DOM.Document
import           GHCJS.DOM.Element
import           GHCJS.DOM.Node
import           GHCJS.DOM.Storage         (getItem)
import           GHCJS.DOM.Window          (getLocalStorage)
import           Reflex.Dom                hiding (Element, Home, Response)
import qualified Reflex.Dom.Builder.Class
import           Reflex.Dom.Contrib.Router
import           ReflexJsx
import           URI.ByteString
import           Web.Routes                hiding (Site)

import           Database
import           Frontend.Connection
import           Frontend.Router
import           Routes
import           Server

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

        showLoading <- holdDyn True $ leftmost [True <$ requestPage, False <$ msgEv]

        let newPage = leftmost [hEv, switch $ current pageDyn]

        titleDyn <- holdDyn Nothing (title <$> msgEv)

        pageDyn <- widgetHold (initialWidget >> return never) (page <$> msgEv)

        el "footer" $ do
            text "Contact me @ "
            elAttr "a" ("href" =: "mailto:me@jude.xyz") $ text "me@jude.xyz"
    return titleDyn
    where
        initialWidget = elClass "article" "bubble" $ el "h4" $ text "Loading..."
        wrapPage = elClass "div" "row" . elClass "div" "speech large-12 columns"
        wHead titleDyn = do
            [jsx|<link rel="stylesheet" href={staticHost "css/all.css"} />|]
            [jsx|<link rel="shortcut icon" href={staticHost "favicon.ico"} />|]
            [jsx|<meta name="viewport" content="width=device-width,initial-scale=1" />|]
            el "title" $ dynText $ ffor titleDyn $ maybe "jude.xyz" ("jude.xyz » " <>)
#ifdef PRODUCTION
        staticHost p = "https://static.jude.xyz/" <> p
#else
        staticHost p = "http://localhost:8000/s/" <> p
#endif

header :: (DomBuilder t m, Reflex t, PostBuild t m)
       => Dynamic t Bool -> m (Event t Site)
header showLoading = el "header" $ do
    (link', _) <- elDynAttr' "a" (headAttrs showLoading) $ text "jude.xyz"
    elClass "span" "arrow" $ return ()
    [jsx|
      <div id="dots">
        <span class="up-arrow"></span>
        <a class="dot" id="github" title="I'm on GitHub!"
           href="https://github.com/pikajude">I'm on GitHub!</a>
        <a class="dot" id="linkedin" title="I'm on LinkedIn!"
           href="https://www.linkedin.com/in/pikajude">I'm on LinkedIn!</a>
      </div>
    |]
    return $ Home <$ domEvent Click link'
    where
        headAttrs loading = ffor loading $ \ l ->
            "id" =: "head" <> if l then "class" =: "loading" else mempty

title :: Response -> Maybe Text
title ResHome{}     = Nothing
title ResNotFound{} = Just "Not Found"
title (ResSingle e) = Just (essayTitle e)

page :: forall t t1 t2 t3 m.
        (RawElement (DomBuilderSpace (t2 (ImmediateDomBuilderT t1 m))) ~ Element,
         MonadTrans t2, Monad m, (MonadIO (t2 (ImmediateDomBuilderT t1 m))),
         HasDomEvent t3 (Reflex.Dom.Builder.Class.Element EventResult (DomBuilderSpace (t2 (ImmediateDomBuilderT t1 m))) t) 'ClickTag,
         DomBuilder t (t2 (ImmediateDomBuilderT t1 m)), Reflex t3)
     => Response -> t2 (ImmediateDomBuilderT t1 m) (Event t3 Site)
page (ResHome posts) = do
    elClass "article" "bubble last-bubble" $
        elClass "h5" "site-title" $ text "I\8217m Jude, a functional programmer with a colorful head. \129300"
    postLinks <- forM posts $ \ (title, slug) -> elClass "article" "bubble preview-bubble" $
        elClass "h3" "post-preview" $ do
            let spec = (def :: ElementConfig EventResult t (DomBuilderSpace (t2 (ImmediateDomBuilderT t1 m))))
                    & elementConfig_eventSpec
                        %~ addEventSpecFlags (Proxy :: Proxy (DomBuilderSpace (t2 (ImmediateDomBuilderT t1 m)))) Click (const preventDefault)
                    & initialAttributes
                        .~ ("class" =: "post-title" <> "href" =: ("/r/" <> slug))
            (e, _) <- element "a" spec (text title)
            return $ Read slug <$ domEvent Click e

    return $ leftmost postLinks

page (ResSingle e) = elClass "article" "bubble blog-post" $ do
    elClass "h1" "post-title" $ do
        text (essayTitle e)
    parent <- lift askParent
    Just doc <- getOwnerDocument parent
    el <- createElement doc ("div" :: Text)
    setInnerHTML el $ essayContent e
    placeRawElement el
    return never

page ResNotFound = elClass "article" "bubble" $ do
    el "h4" $ text "Not found"
    return never
