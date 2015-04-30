{ pkgs, nodePackages }:

let fetchbower = import <nixpkgs/pkgs/build-support/fetchbower> {
      inherit (pkgs) stdenv git;
      inherit (nodePackages) fetch-bower;
    };

in {
  sourceFilesBySuffices = path: exts:
    let filter = name: type:
      let base = baseNameOf (toString name);
      in (type == "directory" &&
            (base != "bower_components" && base != "dist" && base != "tmp" &&
            !(pkgs.stdenv.lib.hasPrefix "result" base) && base != "yesod-devel"))
         || pkgs.stdenv.lib.any (ext: pkgs.stdenv.lib.hasSuffix ext base) exts;
    in builtins.filterSource filter path;

  linkBowerComponents = file:
  let env = pkgs.callPackage file { inherit fetchbower; }; in ''
    if ! test -d bower_components; then
      mkdir -p bower_components
      ${pkgs.stdenv.lib.concatStringsSep "\n"
        (builtins.map (p:
          let drv = builtins.parseDrvName p.name;
          in "ln -sv ${p}/packages/*/* bower_components/${drv.name}")
        env.paths)
      }
    fi
  '';

  yesod-bin-wrapper = yesod-bin: pkgs.stdenv.mkDerivation {
    name = "${yesod-bin.name}-wrapper";
    version = yesod-bin.version;
    buildCommand = ''
      mkdir -p $out/bin
      ln -s ${yesod-bin}/bin/* $out/bin
      rm $out/bin/yesod
      cat >$out/bin/yesod <<EOF
        unset GHC_PACKAGE_PATH
        if [ "\$1" == "devel" ]; then
          exec ${yesod-bin}/bin/yesod "\$@" \$(for flag in \$configureFlags; do echo -n "-e \$flag "; done)
        else
          exec ${yesod-bin}/bin/yesod "\$@"
        fi
      EOF
      chmod +x $out/bin/*
    '';
  };
}
