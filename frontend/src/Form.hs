{-# LANGUAGE GADTs             #-}
{-# LANGUAGE OverloadedStrings #-}

module Form where

import API
import Control.Monad
import Data.Bool
import Data.Map       (fromList)
import Data.Monoid
import Reflex.Dom
import Text.Digestive hiding (bool, text)

form m = do
    formResult <- case m of
        Nothing -> getFormWith "essay" (essayForm False) mempty
        Just (es, d) -> do
            (view', _) <- postFormWith "essay" (essayForm False) d
            return (view' { viewErrors = es })

    elClass "h2" "form-title" $ text "Write something"
    (t, c, b) <- el "form" $ do
        t <- elClass "div" "form-group" $
            elAttr "label" (bool ("class" =: "is-invalid-label") mempty (null $ errors "title" formResult)) $ do
                text "Title"
                ti <- textInput (def & attributes .~ constDyn ("class" =: ("form-control" <> bool " is-invalid-input" "" (null $ errors "title" formResult)))
                                     & textInputConfig_initialValue .~ fieldInputText "title" formResult)
                forM_ (errors "title" formResult) $ \ e ->
                    elClass "span" "form-error is-visible" $ text e
                return ti

        c <- elClass "div" "form-group" $
            elAttr "label" (bool ("class" =: "is-invalid-label") mempty (null $ errors "content" formResult)) $ do
                text "Content"
                ti <- textArea (def & attributes .~ constDyn ("class" =: ("form-control" <> bool " is-invalid-input" "" (null $ errors "content" formResult)) <> "rows" =: "10")
                                    & textAreaConfig_initialValue .~ fieldInputText "content" formResult)
                forM_ (errors "content" formResult) $ \ e ->
                    elClass "span" "form-error is-visible" $ text e
                return ti

        (b, _) <- elClass' "a" "button" $ text "Commit"

        return (t, c, b)
    let contents = ffor (zipDyn (value t) (value c)) $ \ (t',c') ->
            fromList [(["title"], t'),(["content"], c')]

    return $ tag (current contents) (domEvent Click b)
