module Main where

import System.Directory
import Test.Hspec
import Test.Hspec.Runner
import Test.Hspec.Formatters
import qualified Spec
import Prelude

main :: IO ()
main = hspecWith defaultConfig { configFormatter = Just progress }
    $ beforeAll_ createTmp $ afterAll_ deleteTmp Spec.spec
    where
        createTmp = createDirectoryIfMissing True "tmp"
        deleteTmp = removeDirectoryRecursive "tmp"
