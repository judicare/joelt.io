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
    exec ${pkgs.openjdk}/bin/java -jar ${pkgs.yuicompressor}/lib/yuicompressor.jar "$@"
  '';

  bowerPkgs = pkgs.buildBowerComponents {
    name = "jude.bio";
    src = pkgs.writeTextDir "bower.json" (builtins.readFile ./bower.json);
    generated = ./bower.nix;
  };

  drv = pkgs.haskell.lib.overrideCabal (haskellPackages.callPackage f {}) (drv: {
    buildTools = [ pkgs.nodePackages.bower yuicompressor ];
    shellHook = ''
      ln -sfv ${bowerPkgs}/bower_components .
    '';
  });

in

  if pkgs.lib.inNixShell then drv.env else drv
