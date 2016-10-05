{-# LANGUAGE TemplateHaskell #-}

module URLs where

import Data.Text
import Web.Routes.TH

data SiteMap = Home
             | In
             | Out
             | N
             | R Text
             | E Text
             | D Text
             deriving Show

$(derivePathInfo' (\ x -> case x of "Home" -> ""; y -> standard y) ''SiteMap)
