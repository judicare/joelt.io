{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}

module HTMLRendering where

import Control.Monad.Writer
import Data.ByteString.Lazy          (ByteString)
import Data.Text                     (Text, pack)
import Network.URI
import Text.Blaze.Html.Renderer.Utf8
import Text.Hamlet

-- | Convenience to allow do-notation for rendering
newtype Stylesheet = Stylesheet { unStylesheet :: FilePath }

type PageWriter = Writer (HtmlUrl URI, Last Text, [Stylesheet]) ()

-- | Perform rendering
render :: HtmlUrl URI -> PageWriter
render t = tell (t, mempty, mempty)

setTitle :: Text -> PageWriter
setTitle t = tell (mempty, Last (Just t), mempty)

addStyleSheet :: FilePath -> PageWriter
addStyleSheet s = tell (mempty, mempty, [Stylesheet s])

htmlRender :: ((URI -> t -> Text) -> Html) -> ByteString
htmlRender x = renderHtml $ x myUrlRenderer

myUrlRenderer :: URI -> t -> Text
myUrlRenderer uri _ = pack ("/" <> show uri)

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

        <link rel="shortcut icon" href="/s/favicon.ico">

        <title>jude.bio
            $maybe t <- getLast mtitle
                \ » #{t}

        $forall Stylesheet s <- sheets
            <link rel="stylesheet" href="/s/#{s}">

        <script src="/s/js/all.js">

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
                <a href="http://www.linkedin.com/pub/joel-taylor/6a/691/988/" .dot #linkedin data-tipsy title="I'm on LinkedIn!">I'm on LinkedIn!
            ^{page}
            <footer>
              Talk to me: <a href="mailto:me@jude.bio">me@jude.bio</a>.
    |]
    where
        (page, mtitle, sheets) = execWriter $ do
            addStyleSheet "css/all.css"
            ham
