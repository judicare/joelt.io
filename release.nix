{ supportedPlatforms ? [ "x86_64-linux" "x86_64-darwin" ]
, supportedCompilers ? ["ghc6104" "ghc6123" "ghc704" "ghc722" "ghc742" "ghc763" "ghc784" "ghcHEAD"]
}:

let
  pkgs = import <nixpkgs> {};
  genAttrs = pkgs.lib.genAttrs;
in rec {
  build = genAttrs supportedCompilers (ghcVer: genAttrs supportedPlatforms (system:
    let
      pkgs = import <nixpkgs> { inherit system; };
      haskellPackages = pkgs.haskell-ng.packages.${ghcVer};
    in haskellPackages.callPackage ./default.nix {
      inherit (pkgs) stdenv bowerPreBuilder nodePackages postgresql darwin;
    }
  ));
}
