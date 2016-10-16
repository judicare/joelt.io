{ lib, haskell, buildBowerComponents, callPackage, writeTextDir, nodePackages, sass
, compiler ? "ghc801" }:

let
  bowerPkgs = buildBowerComponents {
    name = "jude.bio";
    src = writeTextDir "bower.json" (builtins.readFile ./bower.json);
    generated = ./generated/bower.nix;
  };

  nodePkgs = callPackage ./generated/node-composition.nix {};

  pkg = haskell.packages."${compiler}".callPackage ./pkg.nix {};

  inShell = lib.inNixShell;

  releasePkg = haskell.lib.overrideCabal pkg (drv: rec {
    buildTools = (drv.buildTools or [])
      ++ [ sass nodePkgs.cssnano-cli ]
      ++ lib.optional inShell nodePackages.bower;
    doHaddock = false;
    configureFlags = [ "-fproduction" ];
    enableSharedExecutables = false;
    enableSharedLibraries = false;
    isLibrary = false;
    preBuild = ''
      ln -sfv ${bowerPkgs}/bower_components .
    '';
    shellHook = preBuild;
  });

in if inShell then releasePkg.env else releasePkg
