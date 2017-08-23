{-# Language OverloadedStrings #-}
{-# Language TemplateHaskell   #-}

module Routes where

import Control.Applicative
import Control.Lens.TH
import Control.Monad
import Data.Text
import Debug.Trace
import Web.Routes          hiding (Site)

data Site = Home
          | Read Text
          | NotFound
          deriving Show

makePrisms ''Site

instance PathInfo Site where
    toPathSegments Home     = []
    toPathSegments (Read t) = ["r", t]
    toPathSegments NotFound = ["404"]
    fromPathSegments = patternParse (\ x -> traceShow x $ guard (x == []) >> return Home)
                   <|> (Read <$> (segment "r" *> anySegment))
                   <|> pure NotFound
