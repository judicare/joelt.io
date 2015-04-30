module Yesod.Auth.Authy where

import Control.Exception
import Control.Lens hiding ((.=))
import Control.Monad
import Control.Monad.IO.Class
import Data.Aeson.Lens
import Data.ByteString.Lazy (ByteString)
import Data.Default
import qualified Data.Map as M
import Data.Maybe
import Data.Text (Text, unpack)
import Network.Connection
import Network.HTTP.Client (HttpException (..), ManagerSettings)
import Network.HTTP.Client.TLS
import Network.Wreq hiding (get, post)
import Prelude
import Settings
import System.FilePath

-- the Authy sandbox API's certificate is self-signed
ms :: ManagerSettings
ms = mkManagerSettings (def { settingDisableCertificateValidation = True }) Nothing

get :: String -> IO (Response ByteString)
get = getWith (defaults & manager .~ Left ms)

url :: [String] -> String
url path = "https://"
    ++ appAuthyEndpoint compileTimeAppSettings ++ "/protected/json"
    </> foldr (</>) "" path
    ++ "?api_key=" ++ appAuthyKey compileTimeAppSettings

#if MIN_VERSION_ghc(7,10,0)
verify :: MonadIO m
#else
verify :: (Functor m, MonadIO m)
#endif
       => Int -> Text -> m (Maybe Text)
verify userId token = fmap (^? (_Left . to translateException)) . liftIO . try
    $ get (url ["verify", unpack token, show userId])

translateException :: HttpException -> Text
translateException (StatusCodeException _ m _) =
    fromMaybe "Unknown error" $
        M.fromList m ^? ix "X-Response-Body-Start" . key "message" . _String
translateException _ = "Unknown error"
