{-# LANGUAGE TemplateHaskell #-}

module URLs where

import Database
import Web.Routes.TH

data SiteMap = Home
             | In
             | Out
             | N
             | R EssaySlug
             | E EssaySlug
             | D EssaySlug
             deriving Show

$(derivePathInfo' (\ x -> case x of "Home" -> ""; y -> standard y) ''SiteMap)
