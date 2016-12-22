{ nixpkgs ? (import <nixpkgs> {})
, compiler ? "default"
, password ?  "sha256|17|3VAv97pHbz8iGWg+djz22Q==|gsxt3vlsqWDNbvWXrSEGhHT64lTF3yJkVj5OgtD6WsE=" # "password"
}:

let
  reflex-unpatched = pkgs.fetchgit {
    url = "https://github.com/reflex-frp/reflex-platform";
    rev = "0398516c2d3dab9c214fc41c2ad5a2d9a940a716";
    fetchSubmodules = true;
    sha256 = "0j71p477xnv0i2b2qd7n0jggqwl8mqaq8fn7pjl9rl89p12kxi6g";
  };

  reflex = pkgs.runCommand "reflex" {} (''
    mkdir -p $out
    cp -R ${reflex-unpatched}/* $out/
    cd $out
    patch -p1 < ${./support/eval.patch}
  '');

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

  backendSrc = filterHsSource ./backend;
  frontendSrc = filterHsSource ./frontend;

  filterHsSource = builtins.filterSource (path: type: !(
    baseNameOf path == ".git" ||
    baseNameOf path == "dist" ||
    baseNameOf path == "bower_components"
  ));

  nodePkgs = pkgs.callPackage ./backend/generated/node-composition.nix {};

  bowerPkgs = pkgs.buildBowerComponents {
    name = "jude.bio";
    src = pkgs.writeTextDir "bower.json" (builtins.readFile "${backendSrc}/bower.json");
    generated = "${backendSrc}/generated/bower.nix";
  };

  backendBase = haskellPackages.callPackage (reflex-platform.cabal2nixResult backendSrc) {};
  frontendBase = reflex-platform.ghcjs.callPackage (reflex-platform.cabal2nixResult frontendSrc) {};

  versionTag = lib.substring 0 7 (lib.commitIdFromGitRepo ./.git);

  backend = pkgs.haskell.lib.overrideCabal backendBase (drv: rec {
    configureFlags = (drv.configureFlags or []) ++ [ "-fproduction" ];
    buildTools = (drv.buildTools or [])
      ++ [ pkgs.sass nodePkgs.cssnano-cli ]
      ++ lib.optional inNixShell pkgs.nodePackages.bower;
    preBuild = (drv.preBuild or "") + ''
      ln -sfv ${bowerPkgs}/bower_components .
      export PASSWORD=${builtins.toJSON password}
    '';
    version = "${drv.version}-${versionTag}";
    shellHook = preBuild;
  });

  frontend = pkgs.haskell.lib.overrideCabal frontendBase (drv: rec {
    preConfigure = (drv.preConfigure or "") + ''
      rm -f backend-src
      ln -sfv ${backendSrc}/src backend-src
    '';
    postInstall = ''
      cp ${./support/index.override.html} $out/bin/frontend.jsexe/index.override.html;
    '';
    version = "${drv.version}-${versionTag}";
  });

in {
  inherit haskellPackages;

  inherit backend frontend;
}
