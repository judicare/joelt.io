{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghcjsHEAD" }:

let

  inherit (nixpkgs) pkgs;

  haskellPackages = pkgs.haskellPackages.override { overrides = self: super:
    with pkgs.haskell.lib; {
      mkDerivation = args: super.mkDerivation (args // {
        enableSeparateDocOutput = false;
      });
      hlint = overrideCabal super.hlint (drv: { enableSeparateDataOutput = false; });
      halive = dontCheck super.halive;
    };
  };

  ghcjsPackages = pkgs.haskell.packages.ghcjsHEAD.override { overrides = self: super:
    let callGit = name: src: callGit_ name (x: x) src;
        callGit_ = name: f: src: self.callCabal2nix name (f (builtins.fetchgit src));
    in with pkgs.haskell.lib; {
      mkDerivation = args: super.mkDerivation (args // { enableSeparateDocOutput = false; });
      # Cabal = self.Cabal_1_24_2_0;
      hscolour = pkgs.haskellPackages.hscolour;
      jsaddle = addBuildDepend
        (callGit_ "jsaddle" (x: "${x}/jsaddle") "https://github.com/ghcjs/jsaddle.git" {})
        self.ghcjs-base;
      reflex = callGit "reflex" {
        url = "https://github.com/reflex-frp/reflex.git";
        rev = "develop";
      } {};
      reflex-dom-core = callGit_ "reflex-dom-core" (x: "${x}/reflex-dom-core") {
        url = "https://github.com/reflex-frp/reflex-dom.git";
        rev = "develop";
      } {};
      reflex-dom = callGit_ "reflex-dom" (x: "${x}/reflex-dom") {
        url = "https://github.com/reflex-frp/reflex-dom.git";
        rev = "develop";
      } {};
      reflex-dom-contrib = callGit "reflex-dom-contrib" {
        url = "https://github.com/reflex-frp/reflex-dom-contrib.git";
      } {};
    };
  };
in

pkgs.stdenv.mkDerivation rec {
  name = "shell";
  buildInputs = pkgs.lib.concatMap (x: x.nativeBuildInputs) [
    passthru.backend.env passthru.frontend.env
  ] ++ pkgs.lib.optional pkgs.lib.inNixShell [
    haskellPackages.cabal-install
    haskellPackages.halive
    (pkgs.writeScriptBin "frebuild" ''
      #!${pkgs.stdenv.shell}
      if [ ! -d distjs ]; then
        runhaskell Setup.hs configure --builddir=distjs --ghcjs
      fi
      runhaskell Setup.hs build --builddir=distjs
    '')
    pkgs.nodePackages.bower
    pkgs.sass
  ];
  passthru = {
    frontend = ghcjsPackages.callCabal2nix "jude-web" ./. {};
    backend = haskellPackages.callCabal2nix "jude-web" ./. {};
  };
}
