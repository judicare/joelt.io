{-# LANGUAGE RecordWildCards #-}

module Yesod.Auth.Authy (
    User(..),
    createUser,
    verify, url
) where

import Control.Exception
import Control.Lens hiding ((.=))
import Control.Monad
import Control.Monad.IO.Class
import Data.Aeson
import Data.Aeson.Lens
import Data.Bifunctor
import Data.Functor
import qualified Data.Map as M
import Data.Maybe
import Data.Text (Text, unpack)
import Data.Text.Encoding (decodeUtf8)
import Debug.Trace
import Network.HTTP.Client (HttpException (..))
import Network.Wreq
import Prelude
import Settings
import System.FilePath
import Text.Email.Validate

data User = User
          { userEmail :: EmailAddress
          , userCellphone :: String
          , userCountryCode :: String
          }

-- authyId :: String
-- authyId = "3856637"

url :: [String] -> String
url path = join traceShow $ "https://"
    ++ appAuthyEndpoint compileTimeAppSettings ++ "/protected/json"
    </> foldr (</>) "" path
    ++ "?api_key=" ++ appAuthyKey compileTimeAppSettings

createUser :: MonadIO m => User -> m (Either Text Int)
createUser User{..} = liftM (second extractId) $
    liftIO . tryHttp $ post (url ["users", "new"]) userBody
    where
        extractId resp = fromIntegral
            $ resp ^?! responseBody . key "user" . key "id" . _Integer
        userBody = object ["user" .=
            (object [ "email" .= decodeUtf8 (toByteString userEmail)
                    , "cellphone" .= userCellphone
                    , "country_code" .= userCountryCode
                    ])
            ]

verify :: MonadIO m => Int -> Text -> m (Either Text ())
verify userId token = liftM (() <$)
    $ liftIO . tryHttp $ get (url ["verify", unpack token, show userId])

tryHttp :: IO b -> IO (Either Text b)
tryHttp = fmap (either (Left . int) Right) . try where
    int (StatusCodeException _ m _) = fromMaybe "Unknown error" $
            M.fromList m ^? ix "X-Response-Body-Start" . key "message" . _String
    int _ = "Unknown error"
