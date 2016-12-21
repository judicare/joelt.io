{ lib, haskell, buildBowerComponents, callPackage, writeTextDir, nodePackages, sass
, compiler ? "ghc801", password ? "fake secret" }:

let
  bowerPkgs = buildBowerComponents {
    name = "jude.bio";
    src = writeTextDir "bower.json" (builtins.readFile ./bower.json);
    generated = ./generated/bower.nix;
  };

  nodePkgs = callPackage ./generated/node-composition.nix {};

  packages = haskell.packages."${compiler}";

  pkg = packages.callPackage ./pkg.nix {};

  inShell = lib.inNixShell;

  releasePkg = haskell.lib.overrideCabal pkg (drv: rec {
    buildTools = (drv.buildTools or [])
      ++ [ sass nodePkgs.cssnano-cli ]
      ++ lib.optionals inShell [ nodePackages.bower packages.cabal-install packages.haddocset ];
    doHaddock = false;
    configureFlags = [ "-fproduction" ];
    enableSharedExecutables = false;
    enableSharedLibraries = false;
    isLibrary = false;
    preBuild = ''
      export PASSWORD=${builtins.toJSON password}
      ln -sfv ${bowerPkgs}/bower_components .
    '';
    version = "${drv.version}-${lib.substring 0 7 (lib.commitIdFromGitRepo ./.git)}";
    shellHook = preBuild;
  });

in if inShell then releasePkg.env else releasePkg
