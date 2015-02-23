{ supportedPlatforms ? [ "x86_64-linux" "x86_64-darwin" ]
, supportedCompilers ? ["ghc742" "ghc763" "ghc784" "ghc7101" "ghcHEAD"]
}:

let
  pkgs = import <nixpkgs> {};
  genAttrs = pkgs.lib.genAttrs;
in rec {
  build = genAttrs supportedCompilers (ghcVer: genAttrs supportedPlatforms (system:
    let
      pkgs = import <nixpkgs> { inherit system; };
      haskellPackages = pkgs.haskell-ng.packages.${ghcVer};
    in pkgs.callPackage ./default.nix { inherit (haskellPackages) callPackage; }
  ));
}
