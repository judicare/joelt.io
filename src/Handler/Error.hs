module Handler.Error where

import ClassyPrelude
import Text.Lucius
import Yesod

otterHandler :: Yesod site => ErrorResponse -> HandlerT site IO TypedContent
otterHandler NotFound = selectRep $ do
    provideRep . defaultLayout $ do
        setTitle "Not Found"
        toWidget $(luciusFile "templates/posts/read.lucius")
        [whamlet|
            <article .bubble .error>
                <h2 .error-title>Not Found
                <p>
                    <a href="javascript:history.back()">Back
        |]
    provideRep . return $ object ["error" .= asText "Not found"]

otterHandler (PermissionDenied msg) = selectRep $ do
    provideRep . defaultLayout $ do
        setTitle "Permission Denied"
        toWidget $(luciusFile "templates/posts/read.lucius")
        [whamlet|
            <article .bubble .error>
                <h2 .error-title>Permission Denied
                <p>#{msg}
        |]
    provideRep . return $ object ["error" .= asText "Permission denied", "message" .= msg]

otterHandler (InternalError e) = selectRep $ do
    provideRep . defaultLayout $ do
        setTitle "Internal Server Error"
        toWidget $(luciusFile "templates/posts/read.lucius")
        [whamlet|
            <article .bubble .error>
                <h2 .error-title>Internal server error!!
                <p>
                    <code>#{e}
        |]
    provideRep . return $ object ["error" .= asText "Internal server error", "message" .= e]

otterHandler (BadMethod m) = selectRep $ do
    provideRep . defaultLayout $ do
        setTitle "Bad Method"
        toWidget $(luciusFile "templates/posts/read.lucius")
        [whamlet|
            <article .bubble .error>
                <h2 .error-title>Bad Method
                <p><code>#{decodeUtf8 m}</code> won't work on this page.
        |]
    provideRep . return $
        object ["error" .= asText "Bad method", "method" .= decodeUtf8 m]

otterHandler (InvalidArgs args) = selectRep $ do
    provideRep . defaultLayout $ do
        setTitle "Invalid Arguments"
        toWidget $(luciusFile "templates/posts/read.lucius")
        [whamlet|
            <article .bubble .error>
                <h2 .error-title>Invalid Arguments
                <ul>
                    $forall arg <- args
                        <li>#{arg}
        |]
    provideRep . return $ object
        [ "error" .= asText "Invalid arguments"
        , "arguments" .= args ]

otterHandler NotAuthenticated = selectRep $ do
    provideRep . defaultLayout $ do
        setTitle "Not Authenticated"
        toWidget $(luciusFile "templates/posts/read.lucius")
        [whamlet|
            <article .bubble .error>
                <h2 .error-title>Not Authenticated
        |]
    provideRep . return $ object ["error" .= asText "Not authenticated"]
