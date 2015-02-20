{ profiling ? false
, ghc ? "ghc784"
}:

let
  release = import ./release.nix {};
  pkgs = import <nixpkgs> {};
  lib = pkgs.lib;
  haskellLib = import <nixpkgs/pkgs/development/haskell-modules/lib.nix> { inherit pkgs; };
in (lib.mapAttrs (_: attrs:
  lib.mapAttrs (ghcVer: byCompiler:
    lib.mapAttrs (system: bySystem_:
      let
        pkgs = import <nixpkgs> { inherit system; };
        bySystem = bySystem_.overrideScope (self: super: {
          mkDerivation = expr: super.mkDerivation (expr // {
            enableLibraryProfiling = profiling;
          });
        });
        h = pkgs.haskell-ng.packages.${ghcVer}.override {
          overrides = self: super: {
            mkDerivation = expr: super.mkDerivation (expr // {
              enableLibraryProfiling = profiling;
            });
          };
        };
      in lib.overrideDerivation
        (haskellLib.overrideCabal
          (haskellLib.appendConfigureFlag bySystem "-fdev")
          (drv: {
            extraLibraries = (drv.extraLibraries or []) ++ [ h.Cabal_1_22_0_0 ];
            buildTools = (drv.buildTools or []) ++ [
              h.cabal-install h.ghc-mod h.hlint h.scan h.yesod-bin
              pkgs.postgresql pkgs.nodePackages.bower2nix
            ];
            enableLibraryProfiling = profiling;
          })) # /overrideCabal
        (drv: {
          shellHook = ''
            export TMPDIR="$(mktemp -d -t shellXXXXX)"
            mkdir -p $TMPDIR

            ${drv.preBuild}
            eval "$setupCompilerEnvironmentPhase"
            eval "$jailbreakPhase"

            # force building with newer cabal library, see
            # https://github.com/haskell/cabal/issues/2144
            setupCompileFlags+=" -package Cabal-1.22.0.0"
            eval "$compileBuildDriverPhase"
            eval "$configurePhase"
            ./Setup repl --ghc-options="-O0 -fobject-code" DevelMain
          '';
        })) # /overrideDerivation
      byCompiler)
  attrs) release).build.${ghc}.${builtins.currentSystem}
