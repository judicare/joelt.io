{ profiling ? false
, ghc ? "784"
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
        pre710 = pkgs.stdenv.lib.versionOlder
          pkgs.haskell-ng.compiler.${ghcVer}.version
          "7.10";
        newestCabal = h.Cabal_1_22_1_1;
        cabal-install = h.cabal-install.override (pkgs.stdenv.lib.optionalAttrs (!pre710) {
          Cabal = null;
        });
      in lib.overrideDerivation
        (haskellLib.overrideCabal
          (haskellLib.appendConfigureFlag bySystem "-fdev")
          (drv: {
            extraLibraries = (drv.extraLibraries or [])
              ++ pkgs.stdenv.lib.optional pre710 newestCabal;
            buildTools = (drv.buildTools or []) ++ [
              cabal-install /* h.ghc-mod */ h.hlint h.scan
              pkgs.postgresql pkgs.nodePackages.bower2nix
            ];
            enableLibraryProfiling = profiling;
          })) # /overrideCabal
        (drv: {
          shellHook = ''
            export TMPDIR="$(mktemp -d -t shellXXXXX)"
            export TMP="$TMPDIR"
            mkdir -p $TMPDIR

            ${drv.preBuild}
            eval "$setupCompilerEnvironmentPhase"
            eval "$jailbreakPhase"

            ${pkgs.stdenv.lib.optionalString pre710 ''
              # force building with newer cabal library, see
              # https://github.com/haskell/cabal/issues/2144
              setupCompileFlags+=" -package ${newestCabal.pname}-${newestCabal.version}"
            ''}
            eval "$compileBuildDriverPhase"
            eval "$configurePhase"
            ./Setup repl --ghc-options="-O0 -fobject-code" DevelMain
          '';
        })) # /overrideDerivation
      byCompiler)
  attrs) release).build."ghc${ghc}".${builtins.currentSystem}
