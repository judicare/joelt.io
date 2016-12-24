{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE GADTs                     #-}
{-# LANGUAGE NamedFieldPuns            #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedLists           #-}
{-# LANGUAGE OverloadedStrings         #-}
{-# LANGUAGE RankNTypes                #-}
{-# LANGUAGE RecursiveDo               #-}

module Main where

import API
import Control.Lens        (preview, (^?))
import Control.Lens.Prism
import Control.Monad
import Control.Monad.Trans
import Data.Maybe
import Data.Monoid
import Data.Serialize      (decode, encode)
import Data.Text           (Text, pack)
import Data.Text.Read      (decimal)
import Database
import GHCJS.DOM           (currentWindow)
import GHCJS.DOM.Document
import GHCJS.DOM.Element
import GHCJS.DOM.Node
import GHCJS.DOM.Storage
import GHCJS.DOM.Window    (getLocalStorage)
import Reflex.Dom
import Router
import Text.Parsec
import Web.Routes.PathInfo

instance PathInfo API.Request where
    toPathSegments RHome       = []
    toPathSegments (RPage n)   = ["page", pack $ show n]
    toPathSegments (RSingle t) = ["r", t]
    toPathSegments RNew        = ["n"]
    toPathSegments RCreate{}   = ["n"]
    toPathSegments RLogin{}    = ["login"]
    toPathSegments RAuth{}     = Prelude.error "toPathSegments RAuth"

    fromPathSegments = patternParse (\ x -> guard (x == [""]) >> return RHome)
                   <|> (do
                       _ <- segment "page"
                       ds <- anySegment
                       either fail (return . RPage . fst) (decimal ds))
                   <|> (RSingle <$> (segment "r" *> anySegment))
                   <|> (RNew <$ segment "n")
                   <|> (RLogin Nothing <$ segment "login")

main :: IO ()
main = mainWidgetWithHead' (wHead, \ () -> do
    pb <- getPostBuild

    authKey <- liftIO $ do
        Just wv <- currentWindow
        Just s <- getLocalStorage wv
        getItem s ("authKey" :: Text)

    wrapPage $ do
        rec routText <- partialPathRoute "" (toPathInfo <$> leftmost [pageEv, redirectEv])
            let rout = fmap (parseSegments fromPathSegments) routText

            ws <- webSocket "wss://jude.bio/socket/" (def { _webSocketConfig_send = map encode
                                                       <$> leftmost [return <$> pageEv, return <$> redirectEv, getInitial] })
            let getInitial = ffor (fmap (^? _Right) initialPageEv) $ \ r -> maybeToList (RAuth <$> authKey) ++ maybeToList r
                pageEv = leftmost [switch $ current pageDyn, headerEv]
                initialPageEv = tag (current rout) pb

                socketMessage = fmapMaybe (preview _Right . decode) $ _webSocket_recv ws
                curPage = fmapMaybe (preview _PageR) socketMessage
                redirectEv = fmapMaybe (preview _RedirectR) socketMessage

            is404 <- holdDyn False $ True <$ fmapMaybe (^? _Left) initialPageEv
            is500 <- holdDyn False $ ((/= 1000) . snd3) <$> _webSocket_close ws

            titleDyn <- holdDyn Nothing $ title <$> curPage

            showLoading <- holdDyn True $ leftmost [ True <$ updated routText
                                                   , False <$ curPage
                                                   , False <$ updated is404
                                                   , False <$ updated is500
                                                   ]

            authDyn <- holdDyn Nothing $ fmapMaybe (preview _AuthR) socketMessage

            headerEv <- header authDyn showLoading

            pageDyn <- widgetHold (initialWidget (zipDyn is404 is500) >> return never) (page authDyn <$> curPage)

            el "footer" $ do
                text "Talk to me: "
                elAttr "a" ("href" =: "mailto:me@jude.bio") $ text "me@jude.bio"
                text "."

        _ <- performEvent $ ffor (updated authDyn) $ \ a -> liftIO $ do
            Just wv <- currentWindow
            Just s <- getLocalStorage wv
            case a of
                Just a' -> setItem s ("authKey" :: Text) a'
                Nothing -> removeItem s ("authKey" :: Text)

        return titleDyn)
    where
        snd3 (_,a,_) = a
        initialWidget dyn404 = elClass "article" "bubble" $ el "h4" $
            dyn $ ffor dyn404 $ \ (x,y) -> text $ if x then "404 not found" else
                                                  if y then "500 internal server error" else "Loading..."
        wrapPage = elClass "div" "row"
                 . elClass "div" "speech large-12 columns"
        wHead titleDyn = do
            elAttr "link" ("rel" =: "stylesheet"
                        <> "href" =: "https://static.jude.bio/css/all.css")
                $ return ()
            elAttr "link" ("rel" =: "shortcut icon" <> "href" =: "https://static.jude.bio/favicon.ico")
                $ return ()
            elAttr "meta" ("name" =: "viewport" <> "content" =: "width=device-width,initial-scale=1")
                $ return ()
            el "title" $ dynText $ ffor titleDyn $ maybe "jude.bio" ("jude.bio » " <>)

header :: (MonadHold t m, PostBuild t m, DomBuilder t m)
       => Dynamic t (Maybe a) -> Dynamic t Bool -> m (Event t API.Request)
header authDyn showLoading = el "header" $ do
    (link', _) <- elDynAttr' "a" (headAttrs showLoading) $ text "jude.bio"
    elClass "span" "arrow" $ return ()
    newEv <- elAttr "div" ("id" =: "dots") $ do
        elClass "span" "up-arrow" $ return ()
        elAttr "a" [ ("class", "dot"), ("id", "github"), ("title", "I'm on GitHub!")
                   , ("href", "https://github.com/pikajude") ]
            $ text "I'm on GitHub!"
        elAttr "a" [ ("class", "dot"), ("id", "linkedin"), ("title", "I'm on GitHub!")
                   , ("href", "http://www.linkedin.com/in/pikajude") ]
            $ text "I'm on LinkedIn!"

        guardDynJust authDyn $ \ _ -> do
            (newLink, _) <- elAttr' "a" [ ("class", "dot"), ("id", "new-post"), ("title", "make a new post") ]
                $ text "New post"
            return $ domEvent Click newLink
    return $ leftmost [ RHome <$ domEvent Click link', RNew <$ newEv ]
    where
        headAttrs loading = ffor loading $ \ l -> "id" =: "head" <> if l then "class" =: "loading" else mempty

title :: ResponsePage -> Maybe Text
title HomeR{}        = Nothing
title (SingleR post) = Just $ essayTitle post
title NewR{}         = Just "New post"
title LoginR{}       = Just "Log in"
title (ErrorR _)     = Just "Error"

page :: (DomBuilderSpace (t (ImmediateDomBuilderT t1 m)) ~ GhcjsDomSpace,
         MonadHold t2 (t (ImmediateDomBuilderT t1 m)),
         PostBuild t2 (t (ImmediateDomBuilderT t1 m)),
         DomBuilder t2 (t (ImmediateDomBuilderT t1 m)), MonadTrans t,
         MonadIO (t (ImmediateDomBuilderT t1 m)), Monad m) =>
        Dynamic t2 (Maybe a)
        -> ResponsePage
        -> t (ImmediateDomBuilderT t1 m) (Event t2 API.Request)
page authDyn (HomeR Page { items }) = do
    _ <- dyn $ ffor authDyn $ \ u ->
        elClass "article" "bubble last-bubble" $
            elClass "h5" "site-title" $ text $
                case u of
                    Just _  -> "Welcome back! (\65417\9685\12526\9685)\65417\10023\65381\65439*\10023 \10023*\65381\65439\10023\12541(\9685\12526\9685)\65417"
                    Nothing -> "I’m Jude, a functional programmer with a colorful head."
    evs <- forM items $ \ i -> do
        (link', _) <- previewWrap $ elClass' "a" "post-title" $ text (previewTitle i)
        return $ RSingle (previewSlug i) <$ domEvent Click link'
    return $ leftmost evs
    where
        previewWrap = elClass "article" "bubble preview-bubble"
                    . elClass "h3" "post-preview"

page authDyn (SingleR post) = elClass "article" "bubble blog-post" $ do
    _ <- elClass "h1" "post-title" $ do
        text (essayTitle post)
        guardDynJust authDyn $ \ _ -> do
            text " "
            elClass "a" "edit-link fa fa-pencil" $ return ()
            text " "
            elClass "form" "delete-form" $ elClass "button" "fa fa-trash-o" $ return ()
            return never
    par <- lift askParent
    Just doc <- getOwnerDocument par
    Just e <- createElement doc (Just "div" :: Maybe Text)
    setInnerHTML e $ Just $ essayContent post
    placeRawElement e
    return never

page _ (NewR r) = elClass "article" "bubble" $ do
    elClass "h2" "form-title" $ text "Write something"
    (t, c, b) <- el "form" $ do
        t <- elClass "div" "form-group" $
            elAttr "label" (maybe mempty (const $ "class" =: "is-invalid-label") (fieldError curTitle)) $ do
                text "Title"
                ti <- textInput (def & attributes .~ constDyn ("class" =: ("form-control" <> maybe "" (const " is-invalid-input") (fieldError curTitle)))
                                     & textInputConfig_initialValue .~ fieldValue curTitle)
                forM_ (fieldError curTitle) $ \ e ->
                    elClass "span" "form-error is-visible" $ text e
                return ti

        c <- elClass "div" "form-group" $
            elAttr "label" (maybe mempty (const $ "class" =: "is-invalid-label") (fieldError curContent)) $ do
                text "Content"
                ti <- textArea (def & attributes .~ constDyn ("class" =: ("form-control" <> maybe "" (const " is-invalid-input") (fieldError curContent)) <> "rows" =: "10")
                                    & textAreaConfig_initialValue .~ fieldValue curContent)
                forM_ (fieldError curContent) $ \ e ->
                    elClass "span" "form-error is-visible" $ text e
                return ti

        (b, _) <- elClass' "a" "button" $ text "Commit"

        return (t, c, b)
    let contents = ffor (zipDyn (value t) (value c)) (uncurry RCreate)

    return $ tag (current contents) (domEvent Click b)
    where
        (curTitle, curContent) = fromMaybe (emptyResult, emptyResult) r
        emptyResult = FieldResult "" Nothing

page _ (LoginR m) = elClass "article" "bubble" $ do
    v <- elClass "div" "input-group" $ do
        v <- textInput (def & attributes .~ constDyn ("class" =: ("input-group-field" <> maybe "" (const " is-invalid-input") res)
                                                   <> "autofocus" =: "true")
                            & textInputConfig_initialValue .~ maybe "" fieldValue m
                            & textInputConfig_inputType .~ "password")
        (a, _) <- elClass "div" "input-group-button" $
            elClass' "a" "button" $ text "Log\160in"
        return $ tag (current $ value v) (leftmost [domEvent Click a, keypress Enter v])

    forM_ res $ \ e ->
        elClass "span" "form-error is-visible" $ text e

    return $ RLogin . Just <$> v
    where
        res = m >>= fieldError

page _ (ErrorR err) = elClass "article" "bubble" $ do
    el "h3" $ text "Error"
    el "p" $ text err
    return never

guardDynJust :: (MonadHold t m, PostBuild t m, DomBuilder t m)
             => Dynamic t (Maybe a) -> (a -> m (Event t b)) -> m (Event t b)
guardDynJust mDyn action = do
    event <- dyn $ ffor mDyn $ \ contents -> forM contents action
    switchPromptly never $ fmapMaybe id event
