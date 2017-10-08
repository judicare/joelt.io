{ nixpkgs ? import <nixpkgs> {}
, secret ? "fake secret"
}:

let

  inherit (nixpkgs) pkgs;

  haskellPackages = pkgs.haskellPackages.override { overrides = self: super:
    with pkgs.haskell.lib; {
      mkDerivation = args: super.mkDerivation (args // {
        enableSeparateDocOutput = false;
      });
      aeson = self.callHackage "aeson" "1.1.2.0" {};
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
      fail = dontHaddock super.fail;
      nats = dontHaddock super.nats;
      aeson = self.callHackage "aeson" "1.1.2.0" {};
      jsaddle = addBuildDepend
        (callGit_ "jsaddle" (x: "${x}/jsaddle") "https://github.com/ghcjs/jsaddle.git" {})
        self.ghcjs-base;
      reflex = callGit "reflex" {
        url = "https://github.com/reflex-frp/reflex.git";
        ref = "develop";
      } {};
      reflex-dom-core = callGit_ "reflex-dom-core" (x: "${x}/reflex-dom-core") {
        url = "https://github.com/reflex-frp/reflex-dom.git";
        ref = "develop";
      } {};
      reflex-dom = callGit_ "reflex-dom" (x: "${x}/reflex-dom") {
        url = "https://github.com/reflex-frp/reflex-dom.git";
        ref = "develop";
      } {};
      reflex-dom-contrib = callGit "reflex-dom-contrib" {
        url = "https://github.com/reflex-frp/reflex-dom-contrib.git";
      } {};
    };
  };

  bowerPackages = pkgs.buildBowerComponents {
    name = "jude.xyz";
    src = pkgs.writeTextDir "bower.json" (builtins.readFile ./bower.json);
    generated = ./generated/bower.nix;
  };

  nodePackages = pkgs.callPackage ./generated/node-composition.nix {};
in rec {
  frontend = ghcjsPackages.callCabal2nix "jude-web" ./. {};
  backend = pkgs.haskell.lib.overrideCabal
    (haskellPackages.callCabal2nix "jude-web" ./. {})
    (drv: {
      configureFlags = [ "-fproduction" ];
      buildTools = [ pkgs.sass nodePackages.cssnano-cli ];
      preBuild = ''
        ln -sfv ${bowerPackages}/bower_components .
        export PASSWORD=${builtins.toJSON secret}
      '';
    });
  shellEnv = pkgs.stdenv.mkDerivation rec {
    name = "shell";
    buildInputs = pkgs.lib.concatMap (x: x.nativeBuildInputs) [
      backend.env frontend.env
    ] ++ pkgs.lib.optional pkgs.lib.inNixShell [
      haskellPackages.cabal-install
      haskellPackages.hscolour
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
  };
}
