{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;
  inherit (pkgs.lib) inNixShell;

  f = import ./default.nix;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  yuicompressor = pkgs.writeScriptBin "yuicompressor" ''
    #!${pkgs.stdenv.shell}
    exec java -jar ${pkgs.yuicompressor}/lib/yuicompressor.jar "$@"
  '';

  drv = pkgs.haskell.lib.addBuildDepends (haskellPackages.callPackage f {})
    [ haskellPackages.cabal-install pkgs.nodePackages.bower yuicompressor
      haskellPackages.ghc-mod
    ];

in

  if pkgs.lib.inNixShell then drv.env else drv
