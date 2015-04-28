{-# OPTIONS_GHC -fno-warn-orphans #-}

module Yesod.Text.Markdown where

import Data.Text (Text)
import Data.Text.Lazy (toStrict, fromStrict)
import Prelude
import Text.Hamlet (hamlet)
import Text.Markdown (Markdown (Markdown))
import Yesod.Core (HandlerSite, RenderMessage)
import Yesod.Core.Widget
import Yesod.Form

markdownField :: (Monad m, RenderMessage (HandlerSite m) FormMessage) => Field m Markdown
markdownField = Field
    { fieldParse = parseHelper $ Right . Markdown . fromStrict
    , fieldView = \theId name attrs val _isReq -> toWidget
        [hamlet|$newline never
<textarea id="#{theId}" name="#{name}" *{attrs}>#{either id extractStrict val}
|]
    , fieldEnctype = UrlEncoded
    }
    where
        extractStrict :: Markdown -> Text
        extractStrict (Markdown lt) = toStrict lt
