module Handler.ErrorSpec (spec) where

import TestImport

spec :: Spec
spec = withApp $ do
    describe "InvalidArgs" $ do
        it "gives a 400" $ do
            get InvalidArgsR
            statusIs 400

        it "gives a 400 in JSON" $ do
            getJson InvalidArgsR
            statusIs 400
            bodyHasKey "arguments" [text "foo", "bar", "baz"]

    describe "NotAuthenticated" $ do
        it "gives a 401" $ do
            get NotAuthenticatedR
            statusIs 401

        it "gives a 401 in JSON" $ do
            getJson NotAuthenticatedR
            statusIs 401
            bodyHasKey "message" $ text "Not authenticated"

    describe "PermissionDenied" $ do
        it "gives a 403" $ do
            get PermissionDeniedR
            statusIs 403

        it "gives a 403 in JSON" $ do
            getJson PermissionDeniedR
            statusIs 403
            bodyHasKey "message" $ text "Permission denied"

    describe "NotFound" $ do
        it "gives a 404" $ do
            get NotFoundR
            statusIs 404

        it "gives a 404 in JSON" $ do
            getJson NotFoundR
            statusIs 404
            bodyHasKey "message" $ text "Not found"

    describe "BadMethod" $ do
        it "gives a 405" $ do
            get BadMethodR
            statusIs 405

        it "gives a 405 in JSON" $ do
            getJson BadMethodR
            statusIs 405
            bodyHasKey "method" $ text "GET"

    describe "InternalError" $ do
        it "gives a 500" $ do
            get InternalErrorR
            statusIs 500

        it "gives a 500 in JSON" $ do
            getJson InternalErrorR
            statusIs 500
            bodyHasKey "error" $ text "getInternalErrorR"
