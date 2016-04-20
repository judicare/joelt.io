{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms   #-}

module SessionData where

import           Data.ByteString    (ByteString)
import           Data.Proxy
import           Data.Serialize     hiding (get, put)
import qualified Data.Serialize     as S
import           Data.Text          (Text)
import           Data.Text.Encoding

class Serialize a => SessionData a where
    sessionKey :: proxy a -> ByteString

data User = User Text deriving Show
data Message = Message Text

pattern KUser :: Proxy User
pattern KUser = Proxy

pattern KMessage :: Proxy Message
pattern KMessage = Proxy

instance Serialize User where
    put (User t) = S.put (encodeUtf8 t)
    get = User . decodeUtf8 <$> S.get

instance Serialize Message where
    put (Message t) = S.put (encodeUtf8 t)
    get = Message . decodeUtf8 <$> S.get

instance SessionData User where sessionKey _ = "user"
instance SessionData Message where sessionKey _ = "message"

get :: (SessionData a, Functor f)
    => (ByteString -> f (Maybe ByteString), t) -> proxy a -> f (Maybe a)
get (getter, _) k = fmap (>>= em . decode) (getter $ sessionKey k)

put :: SessionData a => (t, ByteString -> ByteString -> t1) -> proxy a -> a -> t1
put (_, putter) k s = putter (sessionKey k) (encode s)

clear :: SessionData a => (t, ByteString -> ByteString -> t1) -> proxy a -> t1
clear (_, putter) k = putter (sessionKey k) (encode ())

em :: Either a b -> Maybe b
em (Left _) = Nothing
em (Right x) = Just x
