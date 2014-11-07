{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE ViewPatterns #-}

module Foundation where

import Control.Applicative
import Data.Text (Text)
import qualified Database.Persist
import Database.Persist.Sql (SqlBackend)
import Handler.Error
import Model
import Network.HTTP.Conduit (Manager)
import Prelude
import qualified Settings
import Settings (widgetFile, Extra (..))
import Settings.Development (development)
import Settings.StaticFiles
import Text.Blaze.Html.Renderer.String (renderHtml)
import Text.Hamlet (hamletFile)
import Text.Jasmine (minifym)
import Yesod
import Yesod.Auth
import Yesod.Core.Types (Logger)
import Yesod.Default.Config
import Yesod.Default.Util (addStaticContentExternal)
import Yesod.Static

data App = App
    { settings :: AppConfig DefaultEnv Extra
    , getStatic :: Static
    , connPool :: Database.Persist.PersistConfigPool Settings.PersistConf
    , httpManager :: Manager
    , persistConfig :: Settings.PersistConf
    , appLogger :: Logger
    , magic :: Text
    }

mkMessage "App" "messages" "en"

mkYesodData "App" $(parseRoutesFileNoCheck "config/routes")

type Form x = Html -> MForm (HandlerT App IO) (FormResult x, Widget)

instance Yesod App where
    approot = ApprootMaster $ appRoot . settings

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
                [ javascripts_jquery_tipsy_js
                , js_app_js
                ])

            $(combineStylesheets 'StaticR
                [ css_bootstrap_css
                , stylesheets_tipsy_css
                , css_themes_amelie_css
                ])

            $(widgetFile "default-layout")
        let hasTitle = not . null . renderHtml $ pageTitle pc
        withUrlRenderer $(hamletFile "templates/default-layout-wrapper.hamlet")

    urlRenderOverride y (StaticR s) =
        Just $ uncurry (joinPath y (Settings.staticRoot $ settings y)) $ renderRoute s
    urlRenderOverride _ _ = Nothing

    authRoute _ = Just $ AuthR LoginR

    addStaticContent =
        addStaticContentExternal minify genFileName Settings.staticDir (StaticR . flip StaticRoute [])
      where
        genFileName lbs
            | development = "autogen-" ++ base64md5 lbs
            | otherwise   = base64md5 lbs
        minify | development = Right | otherwise = minifym

    jsLoader _ = BottomOfBody

    shouldLog _ _source level =
        development || level == LevelWarn || level == LevelError

    makeLogger = return . appLogger

instance YesodPersist App where
    type YesodPersistBackend App = SqlBackend
    runDB = defaultRunDB persistConfig connPool
instance YesodPersistRunner App where
    getDBRunner = defaultGetDBRunner connPool

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
            lift $ if pw == Just (magic app)
                then fmap toTypedContent $ setCreds True (Creds "magic" "nonsense" [])
                else loginErrorMessage (AuthR LoginR) "Nah."

    authHttpManager = httpManager

instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

getExtra :: Handler Extra
getExtra = fmap (appExtra . settings) getYesod
