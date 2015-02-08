{ profiling ? true
, ghc ? "ghc784"
}:

let
  release = import ./release.nix {};
  lib = (import <nixpkgs> {}).lib;
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
      in lib.overrideDerivation (bySystem.flag "-fdev")
        (attrs: {
          enableLibraryProfiling = profiling;
          buildInputs = with pkgs; [
            h.cabal-install h.ghc-mod h.hlint h.scan h.yesod-bin # dotenv
          ] ++ attrs.buildInputs;
          NODE_PATH = "${pkgs.nodePackages.by-version.es5-ext."0.10.4"}/lib/node_modules";
          shellHook = ''
            ${pkgs.bowerPreBuilder ./nix/bower.nix}
            eval "$setupCompilerEnvironmentPhase"
            eval "$compileBuildDriverPhase"
            eval "$configurePhase"
            ./Setup repl
          '';
        }))
      byCompiler)
  attrs) release).build.${ghc}.${builtins.currentSystem}
