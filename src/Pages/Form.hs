{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ViewPatterns      #-}

module Pages.Form (
    module Pages.Form,
    module X
) where

import           Control.Monad
import           Control.Monad.IO.Class
import           Data.Char
import           Data.Maybe
import qualified Data.Text                   as T
import           Data.Text.Encoding
import           Data.Time
import           Network.Wai.Parse
import           Pages.Prelude
import qualified Text.Blaze.Html5            as H hiding (label)
import qualified Text.Blaze.Html5.Attributes as A
import           Text.Digestive              as X
import qualified Text.Digestive.Blaze.Html5  as H

postFormEnv :: (MonadReader PageEnv m, MonadIO m)
            => Text -> Form v m a -> m (View v, Maybe a)
postFormEnv name form = do
    req <- asks peReq
    reqBody <- liftIO $ parseRequestBody lbsBackEnd req
    postForm name form (\ _ -> envMaker reqBody)
    where
        -- envMaker :: ([Param], [File LB.ByteString]) -> IO (X.Env IO)
        envMaker (params, _) = return $ \ path ->
            return . map (TextInput . decodeUtf8) . maybeToList $
                lookup (encodeUtf8 $ T.intercalate "." path) params

essayForm :: Maybe Essay -> Form Text (ReaderT PageEnv IO) Essay
essayForm mEssay = monadic $ do
    t <- liftIO getCurrentTime
    return $ (\ title content -> Essay
        (EssayTitle title)
        (EssaySlug $ mkSlug title)
        (EssayContent content)
        (fromMaybe (EssayCreatedAt t) (essayCreatedAt <$> mEssay)))
            <$> "title" .: validateSlug (checkNotNull (text mtitle))
            <*> "content" .: checkNotNull (text mcontent)
    where
        mtitle = unTitle . essayTitle <$> mEssay
        mcontent = unContent . essayContent <$> mEssay
        checkNotNull = check "Can't be empty!" (/= mempty)
        validateSlug
            | isJust mEssay = id
            | otherwise = validateM $ \ t -> do
                let slug = mkSlug t
                existing <- query $ SelectSlug (EssaySlug slug)
                case existing of
                    Nothing -> return (return t)
                    Just{} -> return $ Error "This title conflicts with an existing title"

mkSlug :: Text -> Text
mkSlug = T.foldr (\ e m -> if (T.take 1 m, e) == ("-", '-') then m else T.cons e m) mempty
       . T.map (\ x -> if isAlphaNum x then x else '-')
       . T.toLower

foundationField :: H.ToMarkup a => String -> Text -> View a -> r -> H.Html
foundationField t r (fmap H.toHtml -> v) _ = H.div H.! A.class_ dclass $ do
    H.label r v $ do
        H.toHtml (t :: String)
        tagger r v H.! A.class_ "form-control"
    forM_ (errors r v) $ \ e ->
        H.small H.! A.class_ "error" $ e
    where
        dclass = H.toValue ("form-group" ++ (if not (null (errors r v)) then " error" else "") :: String)
        tagger "password" = H.inputPassword "password"
        tagger "content" = H.inputTextArea (Just 10) Nothing "content"
        tagger t' = H.inputText t'
