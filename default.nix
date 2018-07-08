{ runCommand, lib, sass, optipng, callPackage }:

let
  cleanedSource = lib.cleanSourceWith {
    filter = name: type: !(lib.elem (baseNameOf (toString name)) ["dist" "node_modules"]);
    src = lib.sourceFilesBySuffices ./. [ "Makefile" ".png" ".ico" ".html" "robots.txt" ".scss" ];
  };
  foundation = (callPackage ./generated/node-composition.nix {}).foundation-sites;
in

runCommand "jude-web" {
  buildInputs = [ sass optipng ];
} ''
  echo cd ${cleanedSource}
  cd ${cleanedSource}
  make OUT=$out FOUNDATION_SRC=${foundation}/lib
''
