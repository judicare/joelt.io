{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE NamedFieldPuns    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecursiveDo       #-}

module Main where

import           API
import           Control.Monad
import           Data.Aeson           (decodeStrict, encode)
import           Data.ByteString      (ByteString)
import qualified Data.ByteString.Lazy as LB
import           Data.Text            (pack)
import           Reflex.Dom

main :: IO ()
main = mainWidget $ do
    rec pb <- getPostBuild
        let getHome = RHome 1 <$ pb
            pageEv = leftmost [switch $ current pageDyn, getHome]

        ws <- webSocket "ws://localhost:3000" (def { _webSocketConfig_send = return . LB.toStrict . encode <$> pageEv })
        let curPage = fmapMaybe decodeStrict $ _webSocket_recv ws
        pageDyn <- widgetHold (text "Nothing yet" >> return never) (page <$> curPage)
    return ()

page h@(HomeR Page { items }) = do
    el "pre" $ text $ pack $ show h
    evs <- forM items $ \ i -> do
        (link, _) <- el "h3" $ elAttr' "a" ("href" =: "#") $ text (previewTitle i)
        return $ RSingle (previewSlug i) <$ domEvent Click link
    return $ leftmost evs

page h@(SingleR post) = do
    el "pre" $ text $ pack $ show post
    return never
