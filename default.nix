# wrapper around generated.nix to add some build specific stuff
{ stdenv, callPackage, postgresql, pkgs }:

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
  src = lib.filterPaths {
    exact = [ "static" "webapp2.cabal" ];
    glob  = [ "app"
              "config"
              "messages"
              "src"
              "static/css"
              "static/images"
              "static/img"
              "static/js"
              "templates"
              "tests"
            ];
  } ./.;

  buildTools = (drv.buildTools or []) ++ (with nodePackages; [
    coffee-script uglify-js
  ]);

  postInstall = ''
    cp -RL static config $out
    rm -rf $out/static/tmp
  '';

  preBuild = lib.linkBowerComponents ./nixfiles/bower.nix;
})
