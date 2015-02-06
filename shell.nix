{ profiling ? true
, ghc ? "ghc784"
}:

let
  release = import ./release.nix {};
  lib = (import <nixpkgs> {}).lib;
in (lib.mapAttrs (_: attrs:
  lib.mapAttrs (ghcVer: byCompiler:
    lib.mapAttrs (system: bySystem:
      let
        pkgs = import <nixpkgs> { inherit system; };
        h = pkgs.haskell-ng.packages.${ghcVer};
      in lib.overrideDerivation bySystem.env
        (attrs: {
          buildInputs = with pkgs; [
            h.cabal-install h.ghc-mod h.hlint h.scan # h.yesod-bin dotenv
          ] ++ attrs.buildInputs;
          NODE_PATH = "${pkgs.nodePackages.by-version.es5-ext."0.10.4"}/lib/node_modules";
          shellHook = pkgs.bowerPreBuilder ./nix/bower.nix;
        }))
      byCompiler)
  attrs) release).build.${ghc}.${builtins.currentSystem}
