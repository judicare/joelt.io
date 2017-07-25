{ pkgsFn ? import <nixpkgs>
, supportedCompilers ? ["ghc802" "ghc821"]
, supportedPlatforms ? ["x86_64-linux"]
, secret ? "fake secret" }:

let native = pkgsFn {}; in

{
  build = native.lib.genAttrs supportedCompilers (compiler:
    native.lib.genAttrs supportedPlatforms (system:
      (pkgsFn { inherit system; }).callPackage ./. {
        inherit compiler secret;
      }
    )
  );
}
