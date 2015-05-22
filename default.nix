# wrapper around generated.nix to add some build specific stuff
{ stdenv, callPackage, pkgs }:

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
  perlPackages = import <nixpkgs/pkgs/top-level/perl-packages.nix> {
    inherit pkgs;
    overrides = import ./nixfiles/perl-packages.nix pkgs;
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

  buildTools = (drv.buildTools or []) ++ [
    nodePackages.coffee-script nodePackages.uglify-js
    perlPackages.AppSqitch
  ];

  postInstall = ''
    cp -RL static config $out
    rm -rf $out/static/tmp
  '';

  preBuild = let webp = pkgs.imagemagick_light.override {
    inherit (pkgs) libpng libwebp;
  }; in
  lib.linkBowerComponents ./nixfiles/bower.nix + ''
    if [ -z "$IN_NIX_SHELL" ]; then
      for file in $(find static -name "*.png"); do
        if test ! -f "$file".webp; then
          echo converting $file to webp
          ${webp}/bin/convert $file -define webp:lossless=true $file.webp
        fi
      done
    fi
  '';
})
