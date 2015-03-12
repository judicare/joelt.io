module Handler.Post.Read where

import Control.Lens
import qualified Data.ByteString as BS
import qualified Data.Text.Encoding as T
import Data.Text.Lens
import Import hiding (head)
import Prelude (head)
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Highlighter hiding (Entity)
import Text.Regex.PCRE.Light

getReadLegacyR :: Text -> Handler Html
getReadLegacyR t = redirectWith status301 (ReadPostR t)

getReadPostR :: Text -> Handler Html
getReadPostR t = do
    Entity k post <- runDB . getBy404 $ UniquePost t
    mai <- maybeAuthId
    defaultLayout $ do
        setTitle [shamlet|#{postTitle post}|]
        addScriptRemote "//otters.disqus.com/embed.js"
        $(widgetFile "posts/read")

renderMd :: Markdown -> Html
renderMd (Markdown m) = markdown defWithHighlight m where
    defWithHighlight = def { msBlockCodeRenderer = rendered }
    pickLexer cod = fromMaybe textLexer $ lookup (maybe "text" (view unpacked) cod) fixedLexers
    fixedLexers = map (\(_,x) -> (head (lAliases x), x)) lexers
    textLexer = Lexer "text" [] [] [] [Match ".*" Text Continue] [dotall]
    renderer l (tx,_) = case runLexer (pickLexer l) (T.encodeUtf8 tx) of
        Left es -> [Token Text $ T.encodeUtf8 [st|parse error: #{show es}|]]
        Right ts -> ts
    rendered ah bh = H.figure . decentFormat $ renderer ah bh
    decentFormat ts = H.table H.! A.class_ "highlight-table" $ H.tr $ do
        H.td H.! A.class_ "linenos" $
            H.div H.! A.class_ "lineno" $
                H.pre (lineNos (countLines ts))

        H.td H.! A.class_ "code" $
            H.div H.! A.class_ "highlight" $
                H.pre $ highlight ts
    countLines [] = 0
    countLines (Token _ s:ts) =
        -- elemIndices 10 counts the number of newlines (char 10)
        -- in the string
        length (BS.elemIndices 0x0A s) + countLines ts
    highlight [] = return ()
    highlight (Token t s:ts) = do
        H.span H.! A.class_ (H.toValue $ shortName t) $ toHtml (T.decodeUtf8 s)
        highlight ts
    lineNos n = lineNos' 1 where
        lineNos' c
            | c - 1 <= n = do
                toHtml (show c)
                toHtml ("\n" :: Text)
                lineNos' (c + 1)
            | otherwise = return ()
