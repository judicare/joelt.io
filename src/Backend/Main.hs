{-# Language CPP               #-}
{-# Language OverloadedStrings #-}

module Backend.Main where

import           Data.Text                (unpack)
import qualified Data.Text                as T
import           Network.HTTP.Types
import           Network.Wai              (responseFile, responseLBS)
import qualified Network.Wai              as Wai
import           Network.Wai.Handler.Warp
import           System.Directory
import           System.Environment
import           System.FilePath          ((</>))

main = do
    let e = "/Users/judet/.dev/Haskell/jude-web"
        basedir = e </> "distjs/build/jude-web/jude-web.jsexe"
    run 8080 $ \ req resp -> do
        let pathinfo = Wai.pathInfo req
            pathinfo'
                | null pathinfo = []
                | ".js" `T.isSuffixOf` last pathinfo = [last pathinfo]
                | otherwise = pathinfo
            path = foldl (</>) basedir (map unpack pathinfo')
        e <- doesFileExist path
        resp $ responseFile status200 [] (if e then path else basedir </> "index.html") Nothing
