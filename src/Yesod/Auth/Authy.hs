module Yesod.Auth.Authy where

import ClassyPrelude
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
    withManager ms $ \ man ->
        withResponse req man return

url :: [String] -> String
url pieces = "https://"
    ++ appAuthyEndpoint compileTimeAppSettings ++ "/protected/json"
    </> foldr (</>) "" pieces
    ++ "?api_key=" ++ appAuthyKey compileTimeAppSettings

#if MIN_VERSION_ghc(7,10,0)
verify :: MonadIO m
#else
verify :: (Functor m, MonadIO m)
#endif
       => Int -> Text -> m (Maybe Text)
verify userId token = do
    result <- liftIO . try $ get (url ["verify", unpack token, show userId])
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
