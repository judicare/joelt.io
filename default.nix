# wrapper around generated.nix to add some build specific stuff
{ stdenv, callPackage, postgresql, darwin, pkgs }:

let
  gen = callPackage ./nixfiles/package.nix {
    inherit stdenv;
  };
  lib = callPackage ./nixfiles/lib.nix { inherit nodePackages; };
  haskellLib = import <nixpkgs/pkgs/development/haskell-modules/lib.nix> { inherit pkgs; };
  nodePackages = pkgs.callPackage <nixpkgs/pkgs/top-level/node-packages.nix> {
    self = nodePackages;
    generated = ./nixfiles/node-packages-generated.nix;
  };

in haskellLib.overrideCabal gen (drv: {
  src = lib.sourceFilesBySuffices ./. [
    ".cabal" ".css" ".hamlet" ".hs" ".ico" ".js" ".lucius" ".msg" ".png" ".txt" ".webp"
    ".yml" "models" "routes"
  ];

  buildTools = (drv.buildTools or []) ++ (with nodePackages; [
    coffee-script uglify-js
  ]);

  postInstall = ''
    cp -pR static $out/static
    cp -pR config $out/config
  '';

  preBuild = lib.linkBowerComponents ./nixfiles/bower.nix;
})
