{ nixpkgs ? (import <nixpkgs> {})
, compiler ? "default"
, password ?  "sha256|17|3VAv97pHbz8iGWg+djz22Q==|gsxt3vlsqWDNbvWXrSEGhHT64lTF3yJkVj5OgtD6WsE=" # "password"
}:

let
  reflex-unpatched = pkgs.fetchgit {
    url = "https://github.com/reflex-frp/reflex-platform";
    rev = "cb37f01ff479306b60544a6af6f6f6e7cf3746e6";
    fetchSubmodules = true;
    sha256 = "1gkpifiywi1adad9d6v7a178zhs8slq6gq2sqryqnisc93glvww2";
  };

  reflex = pkgs.runCommand "reflex" {} ''
    mkdir -p $out
    cp -R ${reflex-unpatched}/* $out
    sed -i '/doHaddock/d' "$out/default.nix"
  '';

  inherit (nixpkgs) pkgs;

  haskellPackages = if compiler == "default"
    then pkgs.haskellPackages
    else pkgs.haskell.packages."${compiler}";

  reflex-platform = pkgs.callPackage reflex {
    nixpkgsFunc = import nixpkgs.pkgs.path;
    # inherit config;
  };

  inherit (pkgs) lib;
  inherit (lib) inNixShell;

  closureZip = pkgs.fetchzip {
    url = "http://dl.google.com/closure-compiler/compiler-20161201.tar.gz";
    sha256 = "1rnjvc7myz45gngpwxcfqksry76g63xqdj1bil23ccb4sc38zk74";
    stripRoot = false;
  };

  backendSrc = filterHsSource ./backend;
  frontendSrc = filterHsSource ./frontend;

  filterHsSource = builtins.filterSource (path: type: !(
    baseNameOf path == ".git" ||
    baseNameOf path == "dist"
  ));

  nodePkgs = pkgs.callPackage ./backend/generated/node-composition.nix {};

  backendBase = haskellPackages.callPackage (
    pkgs.stdenv.lib.overrideDerivation (reflex-platform.cabal2nixResult backendSrc) (drv: {
      ${if inNixShell then null else "buildCommand"} = ''
        cabal2nix file://"${backendSrc}" -fproduction >"$out"
      '';
    })
  ) {};
  frontendBase = with pkgs.haskell.lib; (reflex-platform.ghcjs.override {
    overrides = self: super: {
      text = overrideCabal super.text (drv: {
        prePatch = ''
          # haddock parse error
          sed -i '9d' Data/JSString/Text.hs
        '';
      });
    };
  }).callPackage (reflex-platform.cabal2nixResult frontendSrc) {};

  versionTag = lib.substring 0 7 (lib.commitIdFromGitRepo ./.git);

  backend = pkgs.haskell.lib.overrideCabal backendBase (drv: rec {
    configureFlags = (drv.configureFlags or []) ++ [ "-fproduction" ];
    buildTools = (drv.buildTools or [])
      ++ [ pkgs.sass nodePkgs.cssnano-cli ]
      ++ lib.optionals inNixShell [
        pkgs.nodePackages.bower haskellPackages.cabal-install
      ];
    preBuild = (drv.preBuild or "") + ''
      export PASSWORD=${builtins.toJSON password}
    '';
    version = "${drv.version}-${versionTag}";
    shellHook = preBuild + ''
      export SECRET=abcdefghijklmnopqrstuvwxyzabcdef
    '';
  });

  frontend = pkgs.haskell.lib.overrideCabal frontendBase (drv: rec {
    configureFlags = (drv.configureFlags or []) ++ [ "-fproduction" ];
    preConfigure = (drv.preConfigure or "") + ''
      rm -f backend-src
      ln -sfv ${backendSrc}/src backend-src
    '';
    buildTools = (drv.buildTools or []) ++ [ pkgs.openjdk ];
    postInstall = ''
      cd $out/bin/frontend.jsexe
      for file in $(find . -name '*.js'); do
        echo >&2 "Minifying $file"
        cat "$file" | java -jar ${closureZip}/closure-compiler-v20161201.jar > "$file.tmp"
        mv "$file.tmp" "$file"
      done
    '';
    version = "${drv.version}-${versionTag}";
  });

in {
  inherit haskellPackages;

  inherit backend frontend;
}
