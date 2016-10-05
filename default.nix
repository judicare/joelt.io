{ mkDerivation, base, base64-bytestring, blaze-html, blaze-markup
, bytestring, cereal, clientsession, containers, cookie, cryptohash
, digestive-functors, digestive-functors-blaze, file-embed
, highlighter, http-types, markdown, mime-types, monad-control
, monad-logger, mtl, network, pcre-light, persistent
, persistent-postgresql, persistent-template, process-extras
, pwstore-fast, resource-pool, shakespeare, stdenv
, template-haskell, text, time, transformers, vault, wai
, wai-app-static, wai-extra, wai-session, wai-session-clientsession
, warp, web-routes, web-routes-th
}:
mkDerivation {
  pname = "jude-web";
  version = "0.1.0.0";
  src = ./.;
  configureFlags = [ "-fproduction" ];
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base base64-bytestring blaze-html blaze-markup bytestring cereal
    clientsession containers cookie cryptohash digestive-functors
    digestive-functors-blaze file-embed highlighter http-types markdown
    mime-types monad-control monad-logger mtl network pcre-light
    persistent persistent-postgresql persistent-template process-extras
    pwstore-fast resource-pool shakespeare template-haskell text time
    transformers vault wai wai-app-static wai-extra wai-session
    wai-session-clientsession warp web-routes web-routes-th
  ];
  license = stdenv.lib.licenses.mit;
}
