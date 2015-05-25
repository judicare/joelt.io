module Yesod.Auth.Authy where

import ClassyPrelude
import Control.Monad.Reader
import Data.Aeson
import Data.Default
import Network.Connection
import Network.HTTP.Client
import Network.HTTP.Client.TLS
import Settings

-- the Authy sandbox API's certificate is self-signed
ms :: ManagerSettings
ms = mkManagerSettings (def { settingDisableCertificateValidation =
#ifdef TESTING
         True
#else
         False
#endif
     }) Nothing

get :: String -> IO (Response BodyReader)
get location = do
    req <- parseUrl location
    liftIO (print req)
    withManager ms $ \ man ->
        withResponse req man return

url :: MonadReader AppSettings m => [String] -> m String
url pieces = do
    endpoint <- asks appAuthyEndpoint
    key <- asks appAuthyKey
    return $ "https://"
        ++ endpoint ++ "/protected/json"
        </> foldr (</>) "" pieces
        ++ "?api_key=" ++ key

verify :: (MonadIO m, MonadReader AppSettings m)
       => Integer -> Text -> m (Maybe Text)
verify userId token = do
    uri <- url ["verify", unpack token, show userId]
    result <- liftIO . try $ get uri
    return $ case result of
        Left e -> Just $ translateException e
        Right _ -> Nothing

translateException :: HttpException -> Text
translateException (StatusCodeException _ m _) =
    fromMaybe "Unknown error" msgText
    where
        msgText = case msg of
                      Just (String t) -> Just t
                      _ -> Nothing
        msg = lookup "X-Response-Body-Start"
                >=> decode . fromStrict
                >=> (lookup "message" :: Object -> Maybe Value)
                $ m
translateException _ = "Unknown error"
