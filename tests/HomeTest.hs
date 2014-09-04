{-# LANGUAGE OverloadedStrings #-}
module HomeTest (
    homeSpecs
) where

import Data.Monoid
import Data.Text (singleton)
import TestImport

homeSpecs :: Spec
homeSpecs = ydescribe "These are some example tests" $ do
    yit "loads the index and checks it looks right" $ do
        withSeed [ Post s s mempty (read "2014-04-28 00:00:00.000000 UTC")
                 | s <- map singleton (take 11 ['a'..]) ] $ do
            get HomeR
            statusIs 200
            htmlAnyContain "h4" "I’m Joel, a functional programmer with a colorful head."
            htmlCount ".preview-bubble" 5
