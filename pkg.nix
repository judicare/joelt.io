{ mkDerivation, aeson, base, markdown, monad-logger, mtl
, persistent, persistent-postgresql, persistent-template, servant
, servant-server, stdenv, text, time, wai-websockets, warp
}:
mkDerivation {
  pname = "jude-web";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base markdown monad-logger mtl persistent
    persistent-postgresql persistent-template servant servant-server
    text time wai-websockets warp
  ];
  license = stdenv.lib.licenses.mit;
}
