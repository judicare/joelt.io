{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
---------------------------------------------------------
--
-- | Serve static files from a Yesod app.
--
-- This is great for developing your application, but also for a
-- dead-simple deployment.  Caching headers are automatically
-- taken care of.
--
-- If you are running a proxy server (like Apache or Nginx),
-- you may want to have that server do the static serving instead.
--
-- In fact, in an ideal setup you'll serve your static files from
-- a separate domain name to save time on transmitting
-- cookies. In that case, you may wish to use 'urlRenderOverride'
-- to redirect requests to this subsite to a separate domain
-- name.
--
-- Note that this module's static subsite ignores all files and
-- directories that are hidden by Unix conventions (i.e. start
-- with a dot, such as @\".ssh\"@) and the directory "tmp" on the
-- root of the directory with static files.
module Yesod.Static.Extended
    ( -- * Subsite
      module Yesod.Static
    , combineStylesheets'
    , combineScripts'
      -- ** Settings
    , CombineSettings
    , csStaticDirs
    , csCssPostProcess
    , csJsPostProcess
    , csCssPreProcess
    , csJsPreProcess
    , csCombinedFolder
#ifdef TEST_EXPORT
    , getFileListPieces
#endif
    ) where

import Prelude hiding (FilePath)
import System.Directory
import Control.Monad

import Control.Monad.Trans.Resource (runResourceT)
import Yesod.Core
import Yesod.Core.Types
import Yesod.Static hiding
    (CombineSettings, csCombinedFolder, csJsPreProcess, csCssPreProcess
    , csJsPostProcess, csCssPostProcess, combineScripts', combineStylesheets')

import Data.List (find)
import Data.List.NonEmpty (NonEmpty(..))
import qualified Data.List.NonEmpty as N
import Language.Haskell.TH
import Language.Haskell.TH.Syntax as TH

import qualified Data.ByteString.Lazy as L
import Data.Text (pack)
import qualified Data.Text as T
import Data.Conduit
import Data.Conduit.List (consume)
import Data.Conduit.Binary (sourceFile)
import qualified Data.Conduit.Text as CT
import qualified Filesystem.Path.CurrentOS as F
import Filesystem.Path.CurrentOS ((</>), (<.>), FilePath)
import Filesystem (createTree)
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TLE
import Data.Default
--import Text.Lucius (luciusRTMinified)

data CombineType = JS | CSS

combineStatics' :: CombineType
                -> CombineSettings
                -> [Route Static] -- ^ files to combine
                -> Q Exp
combineStatics' combineType CombineSettings {..} routes = do
    fps <- qRunIO fps'
    texts <- qRunIO $ runResourceT $ mapM_ yield fps $$ awaitForever readUTFFile =$ consume
    ltext <- qRunIO $ preProcess $ TL.fromChunks texts
    bs    <- qRunIO $ postProcess fps $ TLE.encodeUtf8 ltext
    let hash' = base64md5 bs
        suffix = csCombinedFolder </> F.decodeString hash' <.> extension
        fp = N.head csStaticDirs </> suffix
    qRunIO $ do
        createTree $ F.directory fp
        L.writeFile (F.encodeString fp) bs
    let pieces = map T.unpack $ T.splitOn "/" $ either id id $ F.toText suffix
    [|StaticRoute (map pack pieces) []|]
  where
    fps' :: IO [F.FilePath]
    fps' = forM routes $ \route@(StaticRoute pieces _) -> do
        candidates <- forM (toFP route) $ \x -> do
            ex <- doesFileExist (F.encodeString x)
            return (x, ex)
        case find snd candidates of
            Just (path, _) -> return path
            Nothing -> error $ target ++ " was not found in any of csStaticDirs" where
                    target = F.encodeString (F.concat (map F.fromText pieces))
    toFP (StaticRoute pieces _) = map (</> F.concat (map F.fromText pieces))
        $ N.toList csStaticDirs
    readUTFFile fp = sourceFile (F.encodeString fp) =$= CT.decode CT.utf8
    postProcess =
        case combineType of
            JS -> csJsPostProcess
            CSS -> csCssPostProcess
    preProcess =
        case combineType of
            JS -> csJsPreProcess
            CSS -> csCssPreProcess
    extension =
        case combineType of
            JS -> "js"
            CSS -> "css"

-- | Data type for holding all settings for combining files.
--
-- This data type is a settings type. For more information, see:
--
-- <http://www.yesodweb.com/book/settings-types>
--
-- Since 1.2.0
data CombineSettings = CombineSettings
    { csStaticDirs :: NonEmpty F.FilePath
    -- ^ File path containing static files.
    --
    -- Default: static
    --
    -- Since 1.2.0
    , csCssPostProcess :: [FilePath] -> L.ByteString -> IO L.ByteString
    -- ^ Post processing to be performed on CSS files.
    --
    -- Default: Pass-through.
    --
    -- Since 1.2.0
    , csJsPostProcess :: [FilePath] -> L.ByteString -> IO L.ByteString
    -- ^ Post processing to be performed on Javascript files.
    --
    -- Default: Pass-through.
    --
    -- Since 1.2.0
    , csCssPreProcess :: TL.Text -> IO TL.Text
    -- ^ Pre-processing to be performed on CSS files.
    --
    -- Default: convert all occurences of /static/ to ../
    --
    -- Since 1.2.0
    , csJsPreProcess :: TL.Text -> IO TL.Text
    -- ^ Pre-processing to be performed on Javascript files.
    --
    -- Default: Pass-through.
    --
    -- Since 1.2.0
    , csCombinedFolder :: FilePath
    -- ^ Subfolder to put combined files into.
    --
    -- Default: combined
    --
    -- Since 1.2.0
    }

instance Default CombineSettings where
    def = CombineSettings
        { csStaticDirs = "static" :| []
        {- Disabled due to: https://github.com/yesodweb/yesod/issues/623
        , csCssPostProcess = \fps ->
              either (error . (errorIntro fps)) (return . TLE.encodeUtf8)
            . flip luciusRTMinified []
            . TLE.decodeUtf8
        -}
        , csCssPostProcess = const return
        , csJsPostProcess = const return
           -- FIXME The following borders on a hack. With combining of files,
           -- the final location of the CSS is no longer fixed, so relative
           -- references will break. Instead, we switched to using /static/
           -- absolute references. However, when served from a separate domain
           -- name, this will break too. The solution is that, during
           -- development, we keep /static/, and in the combining phase, we
           -- replace /static with a relative reference to the parent folder.
        , csCssPreProcess =
              return
            . TL.replace "'/static/" "'../"
            . TL.replace "\"/static/" "\"../"
        , csJsPreProcess = return
        , csCombinedFolder = "combined"
        }

liftRoutes :: [Route Static] -> Q Exp
liftRoutes =
    fmap ListE . mapM go
  where
    go :: Route Static -> Q Exp
    go (StaticRoute x y) = [|StaticRoute $(liftTexts x) $(liftPairs y)|]

    liftTexts = fmap ListE . mapM liftT
    liftT t = [|pack $(TH.lift $ T.unpack t)|]

    liftPairs = fmap ListE . mapM liftPair
    liftPair (x, y) = [|($(liftT x), $(liftT y))|]

-- | Combine multiple CSS files together. Common usage would be:
--
-- >>> combineStylesheets' development def 'StaticR [style1_css, style2_css]
--
-- Where @development@ is a variable in your site indicated whether you are in
-- development or production mode.
--
-- Since 1.2.0
combineStylesheets' :: Bool -- ^ development? if so, perform no combining
                    -> CombineSettings
                    -> Name -- ^ Static route constructor name, e.g. \'StaticR
                    -> [Route Static] -- ^ files to combine
                    -> Q Exp
combineStylesheets' development cs con routes
    | development = [| mapM_ (addStylesheet . $(return $ ConE con)) $(liftRoutes routes) |]
    | otherwise = [| addStylesheet $ $(return $ ConE con) $(combineStatics' CSS cs routes) |]


-- | Combine multiple JS files together. Common usage would be:
--
-- >>> combineScripts' development def 'StaticR [script1_js, script2_js]
--
-- Where @development@ is a variable in your site indicated whether you are in
-- development or production mode.
--
-- Since 1.2.0
combineScripts' :: Bool -- ^ development? if so, perform no combining
                -> CombineSettings
                -> Name -- ^ Static route constructor name, e.g. \'StaticR
                -> [Route Static] -- ^ files to combine
                -> Q Exp
combineScripts' development cs con routes
    | development = [| mapM_ (addScript . $(return $ ConE con)) $(liftRoutes routes) |]
    | otherwise = [| addScript $ $(return $ ConE con) $(combineStatics' JS cs routes) |]
