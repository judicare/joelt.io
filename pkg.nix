{ mkDerivation, aeson, base, base64-bytestring, bytestring
, cryptonite, file-embed, http-types, lens, markdown, mime-types
, monad-logger, mtl, persistent, persistent-postgresql
, persistent-template, process-extras, servant, servant-server
, stdenv, text, time, unordered-containers, wai, wai-app-static
, wai-websockets, warp, websockets
}:
mkDerivation {
  pname = "jude-web";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base base64-bytestring bytestring cryptonite file-embed
    http-types lens markdown mime-types monad-logger mtl persistent
    persistent-postgresql persistent-template process-extras servant
    servant-server text time unordered-containers wai wai-app-static
    wai-websockets warp websockets
  ];
  license = stdenv.lib.licenses.mit;
}
