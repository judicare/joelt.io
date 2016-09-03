{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;
  inherit (pkgs.lib) inNixShell;

  f = import ./default.nix;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  bowerPkgs = pkgs.buildBowerComponents {
    name = "jude.bio";
    src = pkgs.writeTextDir "bower.json" (builtins.readFile ./bower.json);
    generated = ./generated/bower.nix;
  };

  nodePkgs = pkgs.callPackage ./generated/node-composition.nix {};

  drv = pkgs.haskell.lib.overrideCabal (haskellPackages.callPackage f {}) (drv: {
    buildTools = [ pkgs.nodePackages.bower pkgs.sass nodePkgs.cssnano-cli ];
    shellHook = ''
      ln -sfv ${bowerPkgs}/bower_components .
    '';
  });

in

  if pkgs.lib.inNixShell then drv.env else drv
