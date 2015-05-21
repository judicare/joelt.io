{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ViewPatterns #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Application
    ( getApplicationDev
    , appMain
    , develMain
    , makeFoundation
    -- * for GHCI
    , handler
    , db
    ) where

import Control.Monad.Logger (liftLoc, runLoggingT)
import Language.Haskell.TH.Syntax (qLocation)
import Import hiding ((</>))
import Network.Wai.Handler.Warp
    ( Settings, setPort, setHost, setOnException, defaultShouldDisplayException
    , defaultSettings, runSettings)
import Network.Wai.Middleware.RequestLogger
    ( mkRequestLogger, outputFormat, Destination (Logger), OutputFormat (..)
    , IPAddrSource (..), destination
    )
import System.Log.FastLogger (newStdoutLoggerSet, defaultBufSize, toLogStr)
#ifdef TESTING
import Database.Persist.Sqlite
#else
import Database.Persist.Postgresql hiding (LogFunc)
#endif

import Handler.Common
import Handler.Home
import Handler.Post.Edit
import Handler.Post.New
import Handler.Post.Read

mkYesodDispatch "App" resourcesApp

makeApplication :: App -> IO Application
makeApplication foundation = do
    logWare <- mkRequestLogger def
        { outputFormat =
            if appDetailedRequestLogging $ appSettings foundation
                then Detailed True
                else Apache
                        (if appIpFromHeader $ appSettings foundation
                            then FromFallback
                            else FromSocket)
        , destination = Logger $ loggerSet $ appLogger foundation
        }

    -- Create the WAI application and apply middlewares
    appPlain <- toWaiAppPlain foundation
    return $ logWare $ defaultMiddlewaresNoLogging appPlain

makeFoundation :: AppSettings -> IO App
makeFoundation appSettings = do
    -- Some basic initializations: HTTP connection manager, logger, and static
    -- subsite.
    appHttpManager <- newManager
    appLogger <- newStdoutLoggerSet defaultBufSize >>= makeYesodLogger
    appStatic <- static $ appStaticDir appSettings

    -- We need a log function to create a connection pool. We need a connection
    -- pool to create our foundation. And we need our foundation to get a
    -- logging function. To get out of this loop, we initially create a
    -- temporary foundation without a real connection pool, get a log function
    -- from there, and then create the real foundation.
    let mkFoundation appConnPool = App {..}
        logFunc = messageLoggerSource
            (mkFoundation $ error "connPool forced in tempFoundation")
            appLogger

    -- Create the database connection pool
#ifdef TESTING
    pool <- flip runLoggingT logFunc $ createSqlitePool
        (sqlDatabase $ appDatabaseConf appSettings)
        (sqlPoolSize $ appDatabaseConf appSettings)
#else
    pool <- flip runLoggingT logFunc $ createPostgresqlPool
        (pgConnStr  $ appDatabaseConf appSettings)
        (pgPoolSize $ appDatabaseConf appSettings)
#endif

    -- Perform database migration using our application's logging settings.
    runLoggingT (runSqlPool (runMigration migrateAll) pool) logFunc

    -- Return the foundation
    return $ mkFoundation pool

warpSettings :: App -> Settings
warpSettings foundation =
      setPort (appPort $ appSettings foundation)
    $ setHost (appHost $ appSettings foundation)
    $ setOnException (\_req e ->
        when (defaultShouldDisplayException e) $ messageLoggerSource
            foundation
            (appLogger foundation)
            $(qLocation >>= liftLoc)
            "yesod"
            LevelError
            (toLogStr $ "Exception from Warp: " ++ show e))
      defaultSettings

getApplicationDev :: IO (Settings, Application)
getApplicationDev = fmap (\ (a, _, c) -> (a, c)) mkApp

mkApp :: IO (Settings, App, Application)
mkApp = do
    settings <- getAppSettings
    foundation <- makeFoundation settings
    wsettings <- getDevSettings $ warpSettings foundation
    app <- makeApplication foundation
    return (wsettings, foundation, app)

getAppSettings :: IO AppSettings
getAppSettings = loadAppSettings [configSettingsYml] [] useEnv

-- | main function for use by yesod devel
develMain :: IO ()
develMain = develMainHelper getApplicationDev

appMain :: IO ()
appMain = do
    -- Get the settings from all relevant sources
    settings <- loadAppSettingsArgs
        -- fall back to compile-time values, set to [] to require values at runtime
        [configSettingsYmlValue]

        -- allow environment variables to override
        useEnv

    -- Generate the foundation from the settings
    foundation <- makeFoundation settings

    -- Generate a WAI Application from the foundation
    app <- makeApplication foundation

    -- Run the application with Warp
    runSettings (warpSettings foundation) app

handler :: Handler a -> IO a
handler h = getAppSettings >>= makeFoundation >>= flip unsafeHandler h

db :: ReaderT SqlBackend (HandlerT App IO) a -> IO a
db = handler . runDB
