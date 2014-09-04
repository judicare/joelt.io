{-# OPTIONS_GHC -fno-warn-orphans #-}
module Application
    ( makeApplication
    , getApplicationDev
    , makeFoundation
#ifdef DEVELOPMENT
    , devMain
#endif
    ) where

import Import
import Settings
import Yesod.Default.Config
import Yesod.Default.Main
import Yesod.Default.Handlers
import Network.Wai.Middleware.RequestLogger
    ( mkRequestLogger, outputFormat, OutputFormat (..), IPAddrSource (..), destination
    )
import qualified Network.Wai.Middleware.RequestLogger as RequestLogger
import qualified Database.Persist
import Network.HTTP.Conduit (newManager, conduitManagerSettings)
import qualified Data.Text.IO as T
import qualified Data.Text as T
import Control.Monad.Logger (runLoggingT)
import Control.Concurrent (forkIO, threadDelay)
import Control.Monad.Random
import System.Directory
import System.FilePath
import System.Log.FastLogger (newStdoutLoggerSet, defaultBufSize)
import Network.Wai.Logger (clockDateCacher)
import Yesod.Core.Types (loggerSet, Logger (Logger))
import Database.Persist.Postgresql
import Control.Monad
import qualified Data.ByteString as B

import Handler.Home
import Handler.Post.Edit
import Handler.Post.New
import Handler.Post.Read

#ifdef DEVELOPMENT
import System.Environment
#endif

mkYesodDispatch "App" resourcesApp

makeApplication :: AppConfig DefaultEnv Extra -> IO (Application, LogFunc)
makeApplication conf = do
    foundation <- makeFoundation conf

    logWare <- mkRequestLogger def
        { outputFormat =
            if development
                then Detailed True
                else Apache FromSocket
        , destination = RequestLogger.Logger $ loggerSet $ appLogger foundation
        }

    app <- toWaiAppPlain foundation
    let logFunc = messageLoggerSource foundation (appLogger foundation)
    return (logWare app, logFunc)

makeFoundation :: AppConfig DefaultEnv Extra -> IO App
makeFoundation conf = do
    manager <- newManager conduitManagerSettings
    s <- staticSite
    dbconf <- Database.Persist.applyEnv $ PostgresConf "" 100
    when (B.null (pgConnStr dbconf))
        $ fail "no PG* variables in environment. restart with dotenv"
    p <- Database.Persist.createPoolConfig (dbconf :: Settings.PersistConf)

    loggerSet' <- newStdoutLoggerSet defaultBufSize
    (getter, updater) <- clockDateCacher

    let updateLoop = do
            threadDelay 1000000
            updater
            updateLoop
    _ <- forkIO updateLoop

    magick <- genSecret

    let logger = Yesod.Core.Types.Logger loggerSet' getter
        foundation = App conf s p manager dbconf logger magick

    runLoggingT
        (Database.Persist.runPool dbconf (runMigration migrateAll) p)
        (messageLoggerSource foundation logger)

    return foundation

genSecret :: IO Text
genSecret = do
    hasMagic <- doesFileExist magicPath
    if hasMagic
        then T.readFile magicPath
        else do
            magick <- fmap T.pack . evalRandIO $ replicateM 16 (getRandomR ('A', 'z'))
            T.putStrLn $ "The secret word is: " <> magick
            T.writeFile magicPath magick
            return magick
    where magicPath = "config" </> "magic"

getApplicationDev :: IO (Int, Application)
getApplicationDev =
    defaultDevelApp loader (fmap fst . makeApplication)
  where
    loader = Yesod.Default.Config.loadConfig (configSettings Development)
        { csParseExtra = parseExtra
        }

#ifdef DEVELOPMENT
devMain :: IO ()
devMain = withArgs ["Development"] (putStrLn "initializing..." >> main) where
    main = defaultMain (fromArgs parseExtra) (fmap fst . makeApplication)
#endif
