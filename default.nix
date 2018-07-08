{ runCommand }:

runCommand "jude-web" {} ''
  mkdir -p $out
  cp -R ${./.}/* $out
  rm $out/*.nix
''
