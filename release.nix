{ jude-web ? { outPath = ./.; }

, supportedCompilers ? [ "default" "ghc801" ]
, supportedPlatforms ? [ "x86_64-linux" "i686-linux" ]
}:

{ build = let inherit ((import <nixpkgs> {}).lib) genAttrs; in

genAttrs supportedCompilers (compiler:
  genAttrs supportedPlatforms (system:
    with import <nixpkgs> { inherit system; };

    let
      haskellPackages = if compiler == "default"
        then pkgs.haskellPackages
        else pkgs.haskell.packages.${compiler};

      build = haskellPackages.callPackage ./default.nix {};
      bowerPkgs = pkgs.buildBowerComponents {
        name = "jude.bio";
        src = pkgs.writeTextDir "bower.json" (builtins.readFile ./bower.json);
        generated = ./generated/bower.nix;
      };

      nodePkgs = pkgs.nodePackages.override {
        generated = ./generated/node-packages.nix;
        self = nodePkgs;
      };

      tarball = with pkgs; releaseTools.sourceTarball rec {
        name = build.pname;
        version = build.version;
        src = jude-web;
        buildInputs = [ git jq ];

        postUnpack = ''
          # Clean up when building from a working tree.
          if [[ -d $sourceRoot/.git ]]; then
            git -C $sourceRoot clean -fdx -e important-secret
          fi
        '';

        preDist = ''
          cp -RL ${bowerPkgs}/bower_components bower_components

          if ! [ -f important-secret ]; then
            echo -n phony > important-secret
          fi
        '';

        distPhase = ''
          runHook preDist
          tar cfj tarball.tar.bz2 * --transform 's,^,${name}/,'
          mkdir -p $out/tarballs
          cp *.tar.* $out/tarballs
        '';
      };

    in pkgs.haskell.lib.overrideCabal build (drv: {
      configureFlags = [ "-fproduction" ];
      buildTools = (drv.buildTools or []) ++ [ pkgs.sass nodePkgs.cssnano-cli ];
      doHaddock = false;
      enableSharedExecutables = false;
      enableSharedLibraries = false;
      isLibrary = false;
      src = "${tarball}/tarballs/*.tar.bz2";
    })
  )
); }
