{ compiler ? "ghc802" }: (import <nixpkgs> {}).callPackage ./. { inherit compiler; }
