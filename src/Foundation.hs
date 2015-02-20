{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE ViewPatterns #-}

module Foundation where

import Control.Applicative
import Database.Persist.Sql (ConnectionPool, runSqlPool)
import Handler.Error
import Import.NoFoundation
import Settings.Development (development)
import Text.Blaze.Html.Renderer.String (renderHtml)
import Text.Hamlet (hamletFile)
import Text.Jasmine (minifym)
import Yesod.Core.Types (Logger)
import Yesod.Default.Util (addStaticContentExternal)
import qualified Yesod.Core.Unsafe as Unsafe

data App = App
    { appSettings    :: AppSettings
    , appStatic      :: Static -- ^ Settings for static file serving.
    , appConnPool    :: ConnectionPool -- ^ Database connection pool.
    , appHttpManager :: Manager
    , appLogger      :: Logger
    , appMagic       :: Text
    }

instance HasHttpManager App where
    getHttpManager = appHttpManager

mkMessage "App" "messages" "en"

mkYesodData "App" $(parseRoutesFileNoCheck "config/routes")

type Form x = Html -> MForm (HandlerT App IO) (FormResult x, Widget)

instance Yesod App where
    approot = ApprootMaster $ appRoot . appSettings

    makeSessionBackend _ = Just <$> defaultClientSessionBackend
        (120 * 60)
        "config/client_session_key.aes"

    errorHandler = otterHandler

    defaultLayout widget = do
        mmsg <- getMessage
        mai <- maybeAuthId

        pc <- widgetToPageContent $ do
            addScriptRemote "//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"
            $(combineScripts 'StaticR
                [ js_jquery_tipsy_js
                , js_disqus_js
                ])

            $(combineStylesheets 'StaticR
                [ css_bootstrap_css
                , css_tipsy_css
                , css_themes_amelie_css
                ])

            $(widgetFile "default-layout")
        let hasTitle = not . null . renderHtml $ pageTitle pc
        withUrlRenderer $(hamletFile "templates/default-layout-wrapper.hamlet")

    urlRenderOverride y (StaticR s) =
        Just $ uncurry (joinPath y [st|#{appRoot (appSettings y)}/s|]) $ renderRoute s
    urlRenderOverride _ _ = Nothing

    authRoute _ = Just $ AuthR LoginR

    addStaticContent ext mime content = do
        master <- getYesod
        let staticDir = appStaticDir $ appSettings master
        addStaticContentExternal
            minifym
            genFileName
            staticDir
            (StaticR . flip StaticRoute [])
            ext
            mime
            content
      where
        -- Generate a unique filename based on the content itself
        genFileName lbs = "autogen-" ++ base64md5 lbs

    jsLoader _ = BottomOfBody

    shouldLog _ _source level =
        development || level == LevelWarn || level == LevelError

    makeLogger = return . appLogger

instance YesodPersist App where
    type YesodPersistBackend App = SqlBackend
    runDB action = do
        master <- getYesod
        runSqlPool action $ appConnPool master
instance YesodPersistRunner App where
    getDBRunner = defaultGetDBRunner appConnPool

instance YesodAuth App where
    type AuthId App = ()

    loginDest _ = HomeR
    logoutDest _ = HomeR

    getAuthId _ = return $ Just ()
    maybeAuthId = do
        s <- lookupSession credsKey
        return $ () <$ s

    authPlugins app = [AuthPlugin "magic" dispatch render] where
        render tm = $(widgetFile "login")
        dispatch "POST" ["login"] = postLoginR >>= sendResponse
        dispatch _ _ = notFound
        login = PluginR "magic" ["login"]
        postLoginR = do
            pw <- lift $ runInputPost (iopt textField "password")
            lift $ if pw == Just (appMagic app)
                then fmap toTypedContent $ setCreds True (Creds "magic" "nonsense" [])
                else loginErrorMessage (AuthR LoginR) "Nah."

    authHttpManager = getHttpManager

instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

unsafeHandler :: App -> Handler a -> IO a
unsafeHandler = Unsafe.fakeHandlerGetLogger appLogger
