{ mkDerivation, acid-state, base, blaze-html, blaze-markup
, bytestring, cereal, clientsession, containers, cookie
, digestive-functors, digestive-functors-blaze, directory
, file-embed, haskeline, highlighter, http-types, ixset, markdown
, mtl, network-uri, pcre-light, process-extras, pwstore-fast
, safecopy, shakespeare, stdenv, template-haskell, text, time
, transformers, utf8-string, vault, wai, wai-app-static, wai-extra
, wai-session, wai-session-clientsession, warp, web-routes
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
    digestive-functors-blaze directory file-embed haskeline highlighter
    http-types ixset markdown mtl network-uri pcre-light process-extras
    pwstore-fast safecopy shakespeare template-haskell text time
    transformers utf8-string vault wai wai-app-static wai-extra
    wai-session wai-session-clientsession warp web-routes
  ];
  license = stdenv.lib.licenses.mit;
}
