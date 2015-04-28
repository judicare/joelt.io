module Yesod.Routes.Parse.Extension where

import Language.Haskell.TH.Quote
import Language.Haskell.TH.Syntax
import ClassyPrelude
import qualified System.IO as SIO
import Yesod.Core.Dispatch

parseRoutesFiles :: [SIO.FilePath] -> Q Exp
parseRoutesFiles fs = do
    forM_ fs qAddDependentFile
    strs <- concat <$> mapM (qRunIO . readUtf8File) fs
    quoteExp parseRoutesNoCheck strs
    where
        readUtf8File fp = do
            h <- SIO.openFile fp SIO.ReadMode
            SIO.hSetEncoding h SIO.utf8_bom
            SIO.hGetContents h
