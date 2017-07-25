{-# LANGUAGE CPP               #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module URLs where

import Data.String   (IsString)
import Data.Text
import Web.Routes.TH

data SiteMap = Home
             | In
             | Out
             | N
             | R Text
             | E Text
             | D Text
             | S String
             deriving Show

$(derivePathInfo' (\ x -> case x of "Home" -> ""; y -> standard y) ''SiteMap)

staticPrefix :: IsString s => s
#ifdef PRODUCTION
staticPrefix = "https://static.jude.xyz/"
#else
staticPrefix = "/s/"
#endif
