{ runCommand, lib, sass, optipng, callPackage, nodejs }:

let
  cleanedSource = lib.cleanSourceWith {
    filter = name: type: !(lib.elem (baseNameOf (toString name)) ["dist" "node_modules"]);
    src = lib.sourceFilesBySuffices ./. [ "Makefile" ".png" ".ico" ".html" "robots.txt" ".scss" ".js" ];
  };
  nodePkgs = callPackage ./generated/node-composition.nix {};
  inherit (nodePkgs) foundation-sites;
  jsdom = lib.overrideDerivation nodePkgs.jsdom (drv: {
    preRebuild = ''
      substituteInPlace package.json \
        --replace 'link:' 'file:'
    '';
  });
in

runCommand "jude-web" {
  buildInputs = [ sass optipng jsdom nodejs ];
  FOUNDATION_SRC = "${foundation-sites}/lib";
} ''
  echo cd ${cleanedSource}
  cd ${cleanedSource}
  make OUT=$out
  node scripts/css.js $out > $TMPDIR/style.css
  mv $TMPDIR/style.css $out
''
