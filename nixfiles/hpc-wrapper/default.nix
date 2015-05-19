{ stdenv, ghcWithPackages }:

let ghc = ghcWithPackages (h: []);
in stdenv.mkDerivation {
  name = "hpc-${ghc.version}-wrapper";
  inherit (ghc) version;
  buildCommand = ''
    mkdir -p $out/bin
    ${ghc}/bin/ghc ${./hpc-wrapper.hs} -hidir $TMPDIR -odir $TMPDIR -o $out/bin/.hpc-wrapper
    cat >$out/bin/hpc <<EOF
      #!${stdenv.shell}
      exec $out/bin/.hpc-wrapper ${ghc}/bin/hpc "\$@"
    EOF
    chmod +x $out/bin/hpc
  '';
}
