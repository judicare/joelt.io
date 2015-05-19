module Yesod.Auth.AuthySpec (
    spec
) where

import Data.Default
import Network.HTTP.Client
import Network.HTTP.Types
import TestImport
import Yesod.Auth.Authy

spec :: Spec
spec = describe "translateException" $ do
    it "translates normal exceptions" $ do
        let exception = StatusCodeException
                            forbidden403
                            [("X-Response-Body-Start", "{\"message\":\"You idiot\"}")]
                            def
        translateException exception `shouldBe` "You idiot"

    it "handles unknown JSON" $ do
        let exception = StatusCodeException
                            forbidden403
                            [("X-Response-Body-Start", "{\"foo\":\"bar\"}")]
                            def
        translateException exception `shouldBe` "Unknown error"

    it "doesn't understand other exceptions" $
        translateException TooManyRetries `shouldBe` "Unknown error"
