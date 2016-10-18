{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE RecordWildCards       #-}

module HTMLRendering where

import Control.Monad.Writer
import Data.ByteString.Lazy          (ByteString)
import Data.Maybe
import Data.Text                     (Text, pack)
import Text.Blaze.Html.Renderer.Utf8
import Text.Hamlet
import URLs
import Web.Routes

newtype Stylesheet = Stylesheet { unStylesheet :: FilePath }

-- | Convenience to allow do-notation for rendering
type PageWriter = Writer Page ()

data Page = Page
          { pageHtml        :: HtmlUrl SiteMap
          , pageTitle       :: Last Text
          , pageStylesheets :: [Stylesheet]
          , pageLoggedIn    :: Last Bool
          }

instance Monoid Page where
    mempty = Page mempty mempty mempty mempty
    mappend (Page a b c d) (Page a' b' c' d') =
        Page (a <> a') (b <> b') (c <> c') (d <> d')

-- | Perform rendering
render :: HtmlUrl SiteMap -> PageWriter
render t = tell $ mempty { pageHtml = t }

setTitle :: Text -> PageWriter
setTitle t = tell $ mempty { pageTitle = Last (Just t) }

addStyleSheet :: FilePath -> PageWriter
addStyleSheet s = tell $ mempty { pageStylesheets = [Stylesheet s] }

setLoggedIn :: PageWriter
setLoggedIn = tell $ mempty { pageLoggedIn = Last $ Just True }

htmlRender :: ((SiteMap -> t -> Text) -> Html) -> ByteString
htmlRender x = renderHtml $ x myUrlRenderer

myUrlRenderer :: SiteMap -> t -> Text
myUrlRenderer (S p) _ = staticPrefix <> pack p
myUrlRenderer uri _   = toPathInfo uri

-- | Render a page with the default layout
defaultLayout :: PageWriter -> ByteString
defaultLayout ham = htmlRender [hamlet|
    $newline never
    $doctype 5
    <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">

        <link rel="shortcut icon" href=@{S "favicon.ico"}>

        <title>jude.bio
          $maybe t <- getLast pageTitle
            \ » #{t}

        $forall Stylesheet s <- pageStylesheets
          <link rel="stylesheet" href=@{S s} type="text/css">

        \<!--[if lt IE 9]>
        \<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        \<![endif]-->
      <body>
        <div .row role=main>
          <div .speech .large-12 .columns>
            <header>
              <a #head href=/>jude.bio
              <span .arrow>
              <div #dots>
                <span .up-arrow>
                <a href="https://github.com/pikajude" .dot #github data-tipsy title="I'm on GitHub!">I'm on GitHub!
                <a href="http://www.linkedin.com/in/pikajude" .dot #linkedin data-tipsy title="I'm on LinkedIn!">I'm on LinkedIn!
                $if fromMaybe False (getLast pageLoggedIn)
                  <a href="/n" .dot #new-post title="Make a new post">New post
            ^{pageHtml}
            <footer>
              Talk to me: <a href="mailto:me@jude.bio">me@jude.bio</a>.

        <script src=@{S "js/all.js"}>
    |]
    where
        Page{..} = execWriter $ do
            addStyleSheet "css/all.css"
            ham
