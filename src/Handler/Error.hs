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
    provideRep . return $ object ["message" .= asText "Not found"]

otterHandler (PermissionDenied _) = selectRep $ do
    provideRep . defaultLayout $ do
        setTitle "Permission Denied"
        toWidget $(luciusFile "templates/posts/read.lucius")
        [whamlet|
            <article .bubble .error>
                <h2 .error-title>Permission Denied
                <p>Sorry, that's off-limits.
        |]
    provideRep . return $ object ["message" .= asText "Permission denied"]

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
    provideRep . return $ object ["message" .= asText "Internal server error", "error" .= e]

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
        object ["message" .= asText "Bad method", "method" .= decodeUtf8 m]

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
        [ "message" .= asText "Invalid arguments"
        , "arguments" .= args ]

otterHandler NotAuthenticated = selectRep $ do
    provideRep . defaultLayout $ do
        setTitle "Not Authenticated"
        toWidget $(luciusFile "templates/posts/read.lucius")
        [whamlet|
            <article .bubble .error>
                <h2 .error-title>Not Authenticated
        |]
    provideRep . return $ object ["message" .= asText "Not authenticated"]
