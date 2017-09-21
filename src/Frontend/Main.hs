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

import           Control.Lens             hiding (element)
import           Control.Monad
import           Control.Monad.IO.Class
import           Control.Monad.Trans
import           Data.Bool
import           Data.Foldable            (toList)
import           Data.Monoid
import           Data.Proxy
import           Data.Text                (Text)
import           GHCJS.DOM                (currentWindow)
import           GHCJS.DOM.Document
import           GHCJS.DOM.Element
import           GHCJS.DOM.Node
import           GHCJS.DOM.Storage        (getItem)
import           GHCJS.DOM.Window         (getLocalStorage)
import           Reflex.Dom               hiding (Element, Home, Response)
import qualified Reflex.Dom.Builder.Class
import           ReflexJsx
import           Text.Digestive.View

import           Database
import           Forms
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
                , return . routeToRequest <$> traceEvent "Updated page" newPage
                ]

        (_e500, msgEv') <- connection $ traceEvent "Request page" requestPage
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
title ResLogin{}    = Just "Log in"

page :: forall t t1 t2 t3 m.
        (RawElement (DomBuilderSpace (t2 (ImmediateDomBuilderT t1 m))) ~ Element,
         MonadTrans t2, Monad m, (MonadIO (t2 (ImmediateDomBuilderT t1 m))),
         HasDomEvent t3 (Reflex.Dom.Builder.Class.Element EventResult (DomBuilderSpace (t2 (ImmediateDomBuilderT t1 m))) t) 'ClickTag,
         DomBuilder t (t2 (ImmediateDomBuilderT t1 m)), Reflex t3,
         DomBuilderSpace (t2 (ImmediateDomBuilderT t1 m)) ~ GhcjsDomSpace,
         DomBuilder t3 (t2 (ImmediateDomBuilderT t1 m)),
         PostBuild t3 (t2 (ImmediateDomBuilderT t1 m)))
     => Response -> t2 (ImmediateDomBuilderT t1 m) (Event t3 Site)
page (ResHome posts) = do
    elClass "article" "bubble last-bubble" $
        elClass "h5" "site-title" $ text "I\8217m Jude, a functional programmer with a colorful head. \129300"
    postLinks <- forM posts $ \ (t', slug) -> elClass "article" "bubble preview-bubble" $
        elClass "h3" "post-preview" $ do
            let spec = (def :: ElementConfig EventResult t (DomBuilderSpace (t2 (ImmediateDomBuilderT t1 m))))
                    & elementConfig_eventSpec
                        %~ addEventSpecFlags (Proxy :: Proxy (DomBuilderSpace (t2 (ImmediateDomBuilderT t1 m)))) Click (const preventDefault)
                    & initialAttributes
                        .~ ("class" =: "post-title" <> "href" =: ("/r/" <> slug))
            (e, _) <- element "a" spec (text t')
            return $ Read slug <$ domEvent Click e

    return $ leftmost postLinks

page (ResSingle e) = elClass "article" "bubble blog-post" $ do
    elClass "h1" "post-title" $ do
        text (essayTitle e)
    parent <- lift askParent
    Just doc <- getOwnerDocument parent
    body <- createElement doc ("div" :: Text)
    setInnerHTML body $ essayContent e
    placeRawElement body
    return never

page (ResLogin m) = elClass "article" "bubble" $ do
    formResult <- case m of
        Nothing -> getFormWith "login" loginForm mempty
        Just (es, d) -> do
            (view', _) <- postFormWith "login" loginForm d
            return (view' { viewErrors = es })
    let isValid = null $ errors "password" formResult

    [jsx|<h3 class="form-title">Log in</h3>|]

    v <- el "form" $ do
        v <- elClass "div" "row" $ do
            elClass "div" "large-6 columns" $ elClass "div" "form-group" $
                elAttr "label" ("for" =: "login.username") $ do
                    text "Username"
                    [jsx|<input type="text" id="login.username" class="form-control" />|]

            let cls = "form-control" <> bool " is-invalid-input" "" isValid
            elClass "div" "large-6 columns" $ elClass "div" "form-group" $
                elAttr "label" ("for" =: "login.password") $ do
                    text "Password"
                    textInput (def & attributes .~ constDyn ("class" =: cls <> "autofocus" =: "true")
                                   & textInputConfig_initialValue .~ fieldInputText "password" formResult
                                   & textInputConfig_inputType .~ "password")

        (a, _) <- elClass' "a" "button tiny" $ text "Log\160in"
        return $ tag (current $ value v) (leftmost [domEvent Click a, keypress Enter v])

    forM_ (errors "password" formResult) $ \ e ->
        elClass "span" "form-error is-visible" $ text e

    return $ Login . Just . (["password"] =:) <$> v

page ResNotFound = elClass "article" "bubble" $ do
    el "h4" $ text "Not found"
    return never
