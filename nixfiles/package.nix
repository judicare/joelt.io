{ mkDerivation, aeson, asn1-types, attoparsec, base, bifunctors
, blaze-builder, blaze-html, bytestring, classy-prelude
, classy-prelude-conduit, classy-prelude-yesod, conduit
, conduit-extra, containers, data-default, directory
, email-validate, esqueleto, exceptions, fast-logger, file-embed
, filepath, foreign-store, highlighter, hjsmin, hlint, hspec
, http-client, http-conduit, http-types, lens, lens-aeson, markdown
, monad-control, monad-logger, MonadRandom, mtl, network
, network-uri, old-locale, path-pieces, pcre-light, persistent
, persistent-postgresql, persistent-sqlite, persistent-template
, process-extras, resourcet, semigroups, shakespeare, stdenv
, system-fileio, system-filepath, template-haskell, text
, transformers, wai, wai-extra, wai-logger, warp, wreq, yaml, yesod
, yesod-auth, yesod-core, yesod-form, yesod-newsfeed, yesod-static
, yesod-test
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
    aeson asn1-types attoparsec base bifunctors blaze-builder
    blaze-html bytestring classy-prelude classy-prelude-conduit
    classy-prelude-yesod conduit conduit-extra containers data-default
    directory email-validate esqueleto exceptions fast-logger
    file-embed filepath foreign-store highlighter hjsmin hlint hspec
    http-client http-conduit http-types lens lens-aeson markdown
    monad-control monad-logger MonadRandom mtl network network-uri
    old-locale path-pieces pcre-light persistent persistent-sqlite
    persistent-template process-extras resourcet semigroups shakespeare
    system-fileio system-filepath template-haskell text transformers
    wai wai-extra wai-logger warp wreq yaml yesod yesod-auth yesod-core
    yesod-form yesod-newsfeed yesod-static yesod-test
  ];
  license = stdenv.lib.licenses.bsd3;
}
