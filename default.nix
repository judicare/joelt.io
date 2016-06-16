{ mkDerivation, acid-state, base, blaze-html, blaze-markup
, bytestring, cereal, clientsession, containers, cookie
, digestive-functors, digestive-functors-blaze, file-embed
, highlighter, http-types, ixset-typed, markdown, mtl, network
, network-uri, pcre-light, process-extras, pwstore-fast, safecopy
, shakespeare, stdenv, template-haskell, text, time, transformers
, vault, wai, wai-app-static, wai-extra, wai-session
, wai-session-clientsession, warp, web-routes, web-routes-th
}:
mkDerivation {
  pname = "jude-web";
  version = "0.1.0.0";
  src = ./.;
  configureFlags = [ "-fproduction" ];
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    acid-state base blaze-html blaze-markup bytestring cereal
    clientsession containers cookie digestive-functors
    digestive-functors-blaze file-embed highlighter http-types
    ixset-typed markdown mtl network network-uri pcre-light
    process-extras pwstore-fast safecopy shakespeare template-haskell
    text time transformers vault wai wai-app-static wai-extra
    wai-session wai-session-clientsession warp web-routes web-routes-th
  ];
  license = stdenv.lib.licenses.mit;
}
