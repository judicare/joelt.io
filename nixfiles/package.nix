{ mkDerivation, aeson, asn1-types, attoparsec, base, bifunctors
, blaze-builder, blaze-html, bytestring, classy-prelude
, classy-prelude-conduit, classy-prelude-yesod, conduit
, conduit-extra, containers, data-default, directory
, email-validate, esqueleto, exceptions, fast-logger, file-embed
, filepath, foreign-store, highlighter, hjsmin, hspec, http-client
, http-conduit, http-types, lens, lens-aeson, lifted-base, markdown
, monad-control, monad-logger, MonadRandom, mtl, network
, network-uri, old-locale, path-pieces, pcre-light, persistent
, persistent-postgresql, persistent-template, process-extras
, resourcet, semigroups, shakespeare, stdenv, system-fileio
, system-filepath, template-haskell, text, transformers, wai
, wai-extra, wai-logger, warp, wreq, yaml, yesod, yesod-auth
, yesod-core, yesod-form, yesod-newsfeed, yesod-static, yesod-test
}:
mkDerivation {
  pname = "webapp2";
  version = "0.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    aeson asn1-types attoparsec base bifunctors blaze-builder
    blaze-html bytestring classy-prelude classy-prelude-conduit
    classy-prelude-yesod conduit conduit-extra containers data-default
    directory email-validate esqueleto exceptions fast-logger
    file-embed filepath foreign-store highlighter hjsmin http-client
    http-conduit http-types lens lens-aeson markdown monad-control
    monad-logger MonadRandom mtl network network-uri old-locale
    path-pieces pcre-light persistent persistent-postgresql
    persistent-template process-extras resourcet semigroups shakespeare
    system-fileio system-filepath template-haskell text transformers
    wai wai-extra wai-logger warp wreq yaml yesod yesod-auth yesod-core
    yesod-form yesod-newsfeed yesod-static
  ];
  testDepends = [
    base classy-prelude hspec lifted-base monad-logger persistent
    persistent-postgresql resourcet text transformers yesod yesod-core
    yesod-test
  ];
  license = stdenv.lib.licenses.bsd3;
}
