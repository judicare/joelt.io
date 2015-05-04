{ profiling ? false
, ghc ? "7101"
}:

let
  ghcVer = "ghc${ghc}";
  pkgs = import <nixpkgs> {};
  lib = pkgs.lib;
  myLib = import ./nixfiles/lib.nix { inherit pkgs; nodePackages = {}; };
  haskellLib = import <nixpkgs/pkgs/development/haskell-modules/lib.nix> { inherit pkgs; };

  webapp2-vanilla = pkgs.callPackage ./default.nix {
    inherit (pkgs.haskell-ng.packages.${ghcVer}) callPackage;
  };

  webapp2-dev = webapp2-vanilla.overrideScope (self: super: {
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
  newestCabal = with pkgs.stdenv.lib; attrByPath
    [(last (builtins.filter (hasPrefix "Cabal_") (builtins.attrNames h)))]
    h.Cabal
    h;
  cabal-install = h.cabal-install.override (pkgs.stdenv.lib.optionalAttrs (!pre710) {
    Cabal = null;
  });
in lib.overrideDerivation
  (haskellLib.overrideCabal
    (haskellLib.appendConfigureFlag webapp2-dev "-fdev")
    (drv: {
      extraLibraries = (drv.extraLibraries or [])
        ++ pkgs.stdenv.lib.optional pre710 newestCabal;
      buildTools = (drv.buildTools or []) ++ [
        cabal-install /* h.ghc-mod */ h.hlint h.scan
        (myLib.yesod-bin-wrapper h.yesod-bin)
        pkgs.postgresql pkgs.nodePackages.bower2nix
      ];
      enableLibraryProfiling = profiling;
      configureFlags = [
        "--enable-coverage"
        "--hpc-option=--verbosity=0"
      ];
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

      # ./Setup repl --ghc-options="-O0 -fobject-code" DevelMain
    '';
  }) # /overrideDerivation
