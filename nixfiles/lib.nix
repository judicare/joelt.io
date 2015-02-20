{ pkgs }:

{
  sourceFilesBySuffices = path: exts:
    let filter = name: type:
      let base = baseNameOf (toString name);
      in (type == "directory" &&
            (base != "bower_components" && base != "dist"))
         || pkgs.stdenv.lib.any (ext: pkgs.stdenv.lib.hasSuffix ext base) exts;
    in builtins.filterSource filter path;

  linkBowerComponents = file:
  let env = pkgs.callPackage file {}; in ''
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
}
