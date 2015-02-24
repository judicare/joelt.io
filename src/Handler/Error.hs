module Handler.Error where

import Data.ByteString.Char8 (unpack)
import Data.Text             (Text)
import Prelude
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
                <p>Go back.
        |]
    provideRep . return $ object ["message" .= ("Not found" :: Text)]

otterHandler (PermissionDenied _) = selectRep $ do
    provideRep . defaultLayout $ do
        setTitle "Permission Denied"
        toWidget $(luciusFile "templates/posts/read.lucius")
        [whamlet|
            <article .bubble .error>
                <h2 .error-title>Permission Denied
                <p>Sorry, that's off-limits.
        |]
    provideRep . return $ object ["message" .= ("Permission denied" :: Text)]

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
    provideRep . return $ object ["message" .= ("Internal server error" :: Text), "error" .= e]

otterHandler (BadMethod m) = selectRep $ do
    provideRep . defaultLayout $ do
        setTitle "Bad Method"
        toWidget $(luciusFile "templates/posts/read.lucius")
        [whamlet|
            <article .bubble .error>
                <h2 .error-title>Bad Method
                <p><code>#{unpack m}</code> won't work on this page.
        |]
    provideRep . return $ object ["message" .= ("Bad method" :: Text), "method" .= show m]

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
    provideRep . return $ object ["message" .= ("Invalid arguments" :: Text), "method" .= show args]

otterHandler e = error (show e)

-- otterHandler _ = error "unhandled"
