{ self, fetchurl, fetchgit ? null, lib }:

{
  by-spec."abbrev"."1" =
    self.by-version."abbrev"."1.0.5";
  by-version."abbrev"."1.0.5" = self.buildNodePackage {
    name = "abbrev-1.0.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/abbrev/-/abbrev-1.0.5.tgz";
      name = "abbrev-1.0.5.tgz";
      sha1 = "5d8257bd9ebe435e698b2fa431afde4fe7b10b03";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."abbrev"."~1.0.4" =
    self.by-version."abbrev"."1.0.5";
  by-spec."amdefine".">=0.0.4" =
    self.by-version."amdefine"."0.1.0";
  by-version."amdefine"."0.1.0" = self.buildNodePackage {
    name = "amdefine-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/amdefine/-/amdefine-0.1.0.tgz";
      name = "amdefine-0.1.0.tgz";
      sha1 = "3ca9735cf1dde0edf7a4bf6641709c8024f9b227";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."ansi"."^0.3.0" =
    self.by-version."ansi"."0.3.0";
  by-version."ansi"."0.3.0" = self.buildNodePackage {
    name = "ansi-0.3.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ansi/-/ansi-0.3.0.tgz";
      name = "ansi-0.3.0.tgz";
      sha1 = "74b2f1f187c8553c7f95015bcb76009fb43d38e0";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."ansi"."~0.3.0" =
    self.by-version."ansi"."0.3.0";
  by-spec."ansi-regex"."^0.1.0" =
    self.by-version."ansi-regex"."0.1.0";
  by-version."ansi-regex"."0.1.0" = self.buildNodePackage {
    name = "ansi-regex-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ansi-regex/-/ansi-regex-0.1.0.tgz";
      name = "ansi-regex-0.1.0.tgz";
      sha1 = "55ca60db6900857c423ae9297980026f941ed903";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."ansi-regex"."^0.2.0" =
    self.by-version."ansi-regex"."0.2.1";
  by-version."ansi-regex"."0.2.1" = self.buildNodePackage {
    name = "ansi-regex-0.2.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ansi-regex/-/ansi-regex-0.2.1.tgz";
      name = "ansi-regex-0.2.1.tgz";
      sha1 = "0d8e946967a3d8143f93e24e298525fc1b2235f9";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."ansi-regex"."^0.2.1" =
    self.by-version."ansi-regex"."0.2.1";
  by-spec."ansi-regex"."^1.0.0" =
    self.by-version."ansi-regex"."1.1.0";
  by-version."ansi-regex"."1.1.0" = self.buildNodePackage {
    name = "ansi-regex-1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ansi-regex/-/ansi-regex-1.1.0.tgz";
      name = "ansi-regex-1.1.0.tgz";
      sha1 = "67792c5d6ad05c792d6cd6057ac8f5e69ebf4357";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."ansi-styles"."^1.1.0" =
    self.by-version."ansi-styles"."1.1.0";
  by-version."ansi-styles"."1.1.0" = self.buildNodePackage {
    name = "ansi-styles-1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ansi-styles/-/ansi-styles-1.1.0.tgz";
      name = "ansi-styles-1.1.0.tgz";
      sha1 = "eaecbf66cd706882760b2f4691582b8f55d7a7de";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."archy"."0.0.2" =
    self.by-version."archy"."0.0.2";
  by-version."archy"."0.0.2" = self.buildNodePackage {
    name = "archy-0.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/archy/-/archy-0.0.2.tgz";
      name = "archy-0.0.2.tgz";
      sha1 = "910f43bf66141fc335564597abc189df44b3d35e";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."are-we-there-yet"."~1.0.0" =
    self.by-version."are-we-there-yet"."1.0.2";
  by-version."are-we-there-yet"."1.0.2" = self.buildNodePackage {
    name = "are-we-there-yet-1.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/are-we-there-yet/-/are-we-there-yet-1.0.2.tgz";
      name = "are-we-there-yet-1.0.2.tgz";
      sha1 = "b518f4a6ec85862b57ce82df495bbabc76cb5246";
    };
    deps = {
      "delegates-0.1.0" = self.by-version."delegates"."0.1.0";
    };
    peerDependencies = [];
  };
  by-spec."argparse"."0.1.15" =
    self.by-version."argparse"."0.1.15";
  by-version."argparse"."0.1.15" = self.buildNodePackage {
    name = "argparse-0.1.15";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/argparse/-/argparse-0.1.15.tgz";
      name = "argparse-0.1.15.tgz";
      sha1 = "28a1f72c43113e763220e5708414301c8840f0a1";
    };
    deps = {
      "underscore-1.4.4" = self.by-version."underscore"."1.4.4";
      "underscore.string-2.3.3" = self.by-version."underscore.string"."2.3.3";
    };
    peerDependencies = [];
  };
  by-spec."argparse"."~ 0.1.11" =
    self.by-version."argparse"."0.1.16";
  by-version."argparse"."0.1.16" = self.buildNodePackage {
    name = "argparse-0.1.16";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/argparse/-/argparse-0.1.16.tgz";
      name = "argparse-0.1.16.tgz";
      sha1 = "cfd01e0fbba3d6caed049fbd758d40f65196f57c";
    };
    deps = {
      "underscore-1.7.0" = self.by-version."underscore"."1.7.0";
      "underscore.string-2.4.0" = self.by-version."underscore.string"."2.4.0";
    };
    peerDependencies = [];
  };
  by-spec."array-filter"."~0.0.0" =
    self.by-version."array-filter"."0.0.1";
  by-version."array-filter"."0.0.1" = self.buildNodePackage {
    name = "array-filter-0.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/array-filter/-/array-filter-0.0.1.tgz";
      name = "array-filter-0.0.1.tgz";
      sha1 = "7da8cf2e26628ed732803581fd21f67cacd2eeec";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."array-map"."~0.0.0" =
    self.by-version."array-map"."0.0.0";
  by-version."array-map"."0.0.0" = self.buildNodePackage {
    name = "array-map-0.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/array-map/-/array-map-0.0.0.tgz";
      name = "array-map-0.0.0.tgz";
      sha1 = "88a2bab73d1cf7bcd5c1b118a003f66f665fa662";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."array-reduce"."~0.0.0" =
    self.by-version."array-reduce"."0.0.0";
  by-version."array-reduce"."0.0.0" = self.buildNodePackage {
    name = "array-reduce-0.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/array-reduce/-/array-reduce-0.0.0.tgz";
      name = "array-reduce-0.0.0.tgz";
      sha1 = "173899d3ffd1c7d9383e4479525dbe278cab5f2b";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."asn1"."0.1.11" =
    self.by-version."asn1"."0.1.11";
  by-version."asn1"."0.1.11" = self.buildNodePackage {
    name = "asn1-0.1.11";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/asn1/-/asn1-0.1.11.tgz";
      name = "asn1-0.1.11.tgz";
      sha1 = "559be18376d08a4ec4dbe80877d27818639b2df7";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."assert-plus"."^0.1.5" =
    self.by-version."assert-plus"."0.1.5";
  by-version."assert-plus"."0.1.5" = self.buildNodePackage {
    name = "assert-plus-0.1.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/assert-plus/-/assert-plus-0.1.5.tgz";
      name = "assert-plus-0.1.5.tgz";
      sha1 = "ee74009413002d84cec7219c6ac811812e723160";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."async"."^0.9.0" =
    self.by-version."async"."0.9.0";
  by-version."async"."0.9.0" = self.buildNodePackage {
    name = "async-0.9.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/async/-/async-0.9.0.tgz";
      name = "async-0.9.0.tgz";
      sha1 = "ac3613b1da9bed1b47510bb4651b8931e47146c7";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."async"."~0.2.6" =
    self.by-version."async"."0.2.10";
  by-version."async"."0.2.10" = self.buildNodePackage {
    name = "async-0.2.10";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/async/-/async-0.2.10.tgz";
      name = "async-0.2.10.tgz";
      sha1 = "b6bbe0b0674b9d719708ca38de8c237cb526c3d1";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."async"."~0.2.8" =
    self.by-version."async"."0.2.10";
  by-spec."async"."~0.9.0" =
    self.by-version."async"."0.9.0";
  by-spec."aws-sign2"."~0.5.0" =
    self.by-version."aws-sign2"."0.5.0";
  by-version."aws-sign2"."0.5.0" = self.buildNodePackage {
    name = "aws-sign2-0.5.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/aws-sign2/-/aws-sign2-0.5.0.tgz";
      name = "aws-sign2-0.5.0.tgz";
      sha1 = "c57103f7a17fc037f02d7c2e64b602ea223f7d63";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."balanced-match"."^0.2.0" =
    self.by-version."balanced-match"."0.2.0";
  by-version."balanced-match"."0.2.0" = self.buildNodePackage {
    name = "balanced-match-0.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/balanced-match/-/balanced-match-0.2.0.tgz";
      name = "balanced-match-0.2.0.tgz";
      sha1 = "38f6730c03aab6d5edbb52bd934885e756d71674";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."binary"."~0.3.0" =
    self.by-version."binary"."0.3.0";
  by-version."binary"."0.3.0" = self.buildNodePackage {
    name = "binary-0.3.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/binary/-/binary-0.3.0.tgz";
      name = "binary-0.3.0.tgz";
      sha1 = "9f60553bc5ce8c3386f3b553cff47462adecaa79";
    };
    deps = {
      "chainsaw-0.1.0" = self.by-version."chainsaw"."0.1.0";
      "buffers-0.1.1" = self.by-version."buffers"."0.1.1";
    };
    peerDependencies = [];
  };
  by-spec."bl"."^0.9.0" =
    self.by-version."bl"."0.9.4";
  by-version."bl"."0.9.4" = self.buildNodePackage {
    name = "bl-0.9.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/bl/-/bl-0.9.4.tgz";
      name = "bl-0.9.4.tgz";
      sha1 = "4702ddf72fbe0ecd82787c00c113aea1935ad0e7";
    };
    deps = {
      "readable-stream-1.0.33" = self.by-version."readable-stream"."1.0.33";
    };
    peerDependencies = [];
  };
  by-spec."bl"."~0.9.0" =
    self.by-version."bl"."0.9.4";
  by-spec."block-stream"."*" =
    self.by-version."block-stream"."0.0.7";
  by-version."block-stream"."0.0.7" = self.buildNodePackage {
    name = "block-stream-0.0.7";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/block-stream/-/block-stream-0.0.7.tgz";
      name = "block-stream-0.0.7.tgz";
      sha1 = "9088ab5ae1e861f4d81b176b4a8046080703deed";
    };
    deps = {
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    peerDependencies = [];
  };
  by-spec."boom"."0.4.x" =
    self.by-version."boom"."0.4.2";
  by-version."boom"."0.4.2" = self.buildNodePackage {
    name = "boom-0.4.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/boom/-/boom-0.4.2.tgz";
      name = "boom-0.4.2.tgz";
      sha1 = "7a636e9ded4efcefb19cef4947a3c67dfaee911b";
    };
    deps = {
      "hoek-0.9.1" = self.by-version."hoek"."0.9.1";
    };
    peerDependencies = [];
  };
  by-spec."boom"."2.x.x" =
    self.by-version."boom"."2.6.1";
  by-version."boom"."2.6.1" = self.buildNodePackage {
    name = "boom-2.6.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/boom/-/boom-2.6.1.tgz";
      name = "boom-2.6.1.tgz";
      sha1 = "4dc8ef9b6dfad9c43bbbfbe71fa4c21419f22753";
    };
    deps = {
      "hoek-2.11.0" = self.by-version."hoek"."2.11.0";
    };
    peerDependencies = [];
  };
  by-spec."bower".">=1.2.8 <2" =
    self.by-version."bower"."1.3.12";
  by-version."bower"."1.3.12" = self.buildNodePackage {
    name = "bower-1.3.12";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/bower/-/bower-1.3.12.tgz";
      name = "bower-1.3.12.tgz";
      sha1 = "37de0edb3904baf90aee13384a1a379a05ee214c";
    };
    deps = {
      "abbrev-1.0.5" = self.by-version."abbrev"."1.0.5";
      "archy-0.0.2" = self.by-version."archy"."0.0.2";
      "bower-config-0.5.2" = self.by-version."bower-config"."0.5.2";
      "bower-endpoint-parser-0.2.2" = self.by-version."bower-endpoint-parser"."0.2.2";
      "bower-json-0.4.0" = self.by-version."bower-json"."0.4.0";
      "bower-logger-0.2.2" = self.by-version."bower-logger"."0.2.2";
      "bower-registry-client-0.2.3" = self.by-version."bower-registry-client"."0.2.3";
      "cardinal-0.4.0" = self.by-version."cardinal"."0.4.0";
      "chalk-0.5.0" = self.by-version."chalk"."0.5.0";
      "chmodr-0.1.0" = self.by-version."chmodr"."0.1.0";
      "decompress-zip-0.0.8" = self.by-version."decompress-zip"."0.0.8";
      "fstream-1.0.4" = self.by-version."fstream"."1.0.4";
      "fstream-ignore-1.0.2" = self.by-version."fstream-ignore"."1.0.2";
      "glob-4.0.6" = self.by-version."glob"."4.0.6";
      "graceful-fs-3.0.5" = self.by-version."graceful-fs"."3.0.5";
      "handlebars-2.0.0" = self.by-version."handlebars"."2.0.0";
      "inquirer-0.7.1" = self.by-version."inquirer"."0.7.1";
      "insight-0.4.3" = self.by-version."insight"."0.4.3";
      "is-root-1.0.0" = self.by-version."is-root"."1.0.0";
      "junk-1.0.0" = self.by-version."junk"."1.0.0";
      "lockfile-1.0.0" = self.by-version."lockfile"."1.0.0";
      "lru-cache-2.5.0" = self.by-version."lru-cache"."2.5.0";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "mout-0.9.1" = self.by-version."mout"."0.9.1";
      "nopt-3.0.1" = self.by-version."nopt"."3.0.1";
      "opn-1.0.1" = self.by-version."opn"."1.0.1";
      "osenv-0.1.0" = self.by-version."osenv"."0.1.0";
      "p-throttler-0.1.0" = self.by-version."p-throttler"."0.1.0";
      "promptly-0.2.0" = self.by-version."promptly"."0.2.0";
      "q-1.0.1" = self.by-version."q"."1.0.1";
      "request-2.42.0" = self.by-version."request"."2.42.0";
      "request-progress-0.3.0" = self.by-version."request-progress"."0.3.0";
      "retry-0.6.0" = self.by-version."retry"."0.6.0";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
      "semver-2.3.2" = self.by-version."semver"."2.3.2";
      "shell-quote-1.4.2" = self.by-version."shell-quote"."1.4.2";
      "stringify-object-1.0.0" = self.by-version."stringify-object"."1.0.0";
      "tar-fs-0.5.2" = self.by-version."tar-fs"."0.5.2";
      "tmp-0.0.23" = self.by-version."tmp"."0.0.23";
      "update-notifier-0.2.0" = self.by-version."update-notifier"."0.2.0";
      "which-1.0.8" = self.by-version."which"."1.0.8";
    };
    peerDependencies = [];
  };
  by-spec."bower-config"."~0.5.0" =
    self.by-version."bower-config"."0.5.2";
  by-version."bower-config"."0.5.2" = self.buildNodePackage {
    name = "bower-config-0.5.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/bower-config/-/bower-config-0.5.2.tgz";
      name = "bower-config-0.5.2.tgz";
      sha1 = "1f7d2e899e99b70c29a613e70d4c64590414b22e";
    };
    deps = {
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "mout-0.9.1" = self.by-version."mout"."0.9.1";
      "optimist-0.6.1" = self.by-version."optimist"."0.6.1";
      "osenv-0.0.3" = self.by-version."osenv"."0.0.3";
    };
    peerDependencies = [];
  };
  by-spec."bower-config"."~0.5.2" =
    self.by-version."bower-config"."0.5.2";
  by-spec."bower-endpoint-parser"."0.2.1" =
    self.by-version."bower-endpoint-parser"."0.2.1";
  by-version."bower-endpoint-parser"."0.2.1" = self.buildNodePackage {
    name = "bower-endpoint-parser-0.2.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/bower-endpoint-parser/-/bower-endpoint-parser-0.2.1.tgz";
      name = "bower-endpoint-parser-0.2.1.tgz";
      sha1 = "8c4010a2900cdab07ea5d38f0bd03e9bbccef90f";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."bower-endpoint-parser"."~0.2.2" =
    self.by-version."bower-endpoint-parser"."0.2.2";
  by-version."bower-endpoint-parser"."0.2.2" = self.buildNodePackage {
    name = "bower-endpoint-parser-0.2.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/bower-endpoint-parser/-/bower-endpoint-parser-0.2.2.tgz";
      name = "bower-endpoint-parser-0.2.2.tgz";
      sha1 = "00b565adbfab6f2d35addde977e97962acbcb3f6";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."bower-json"."0.4.0" =
    self.by-version."bower-json"."0.4.0";
  by-version."bower-json"."0.4.0" = self.buildNodePackage {
    name = "bower-json-0.4.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/bower-json/-/bower-json-0.4.0.tgz";
      name = "bower-json-0.4.0.tgz";
      sha1 = "a99c3ccf416ef0590ed0ded252c760f1c6d93766";
    };
    deps = {
      "deep-extend-0.2.11" = self.by-version."deep-extend"."0.2.11";
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "intersect-0.0.3" = self.by-version."intersect"."0.0.3";
    };
    peerDependencies = [];
  };
  by-spec."bower-json"."~0.4.0" =
    self.by-version."bower-json"."0.4.0";
  by-spec."bower-logger"."0.2.1" =
    self.by-version."bower-logger"."0.2.1";
  by-version."bower-logger"."0.2.1" = self.buildNodePackage {
    name = "bower-logger-0.2.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/bower-logger/-/bower-logger-0.2.1.tgz";
      name = "bower-logger-0.2.1.tgz";
      sha1 = "0c1817c48063a88d96cc3d516c55e57fff5d9ecb";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."bower-logger"."~0.2.2" =
    self.by-version."bower-logger"."0.2.2";
  by-version."bower-logger"."0.2.2" = self.buildNodePackage {
    name = "bower-logger-0.2.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/bower-logger/-/bower-logger-0.2.2.tgz";
      name = "bower-logger-0.2.2.tgz";
      sha1 = "39be07e979b2fc8e03a94634205ed9422373d381";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."bower-registry-client"."~0.2.0" =
    self.by-version."bower-registry-client"."0.2.3";
  by-version."bower-registry-client"."0.2.3" = self.buildNodePackage {
    name = "bower-registry-client-0.2.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/bower-registry-client/-/bower-registry-client-0.2.3.tgz";
      name = "bower-registry-client-0.2.3.tgz";
      sha1 = "876e669d4b3eae5fc7e00f7b3da58a4b630b6603";
    };
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "bower-config-0.5.2" = self.by-version."bower-config"."0.5.2";
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "lru-cache-2.3.1" = self.by-version."lru-cache"."2.3.1";
      "request-2.51.0" = self.by-version."request"."2.51.0";
      "request-replay-0.2.0" = self.by-version."request-replay"."0.2.0";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
    };
    peerDependencies = [];
  };
  by-spec."bower2nix"."*" =
    self.by-version."bower2nix"."2.1.0";
  by-version."bower2nix"."2.1.0" = self.buildNodePackage {
    name = "bower2nix-2.1.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/bower2nix/-/bower2nix-2.1.0.tgz";
      name = "bower2nix-2.1.0.tgz";
      sha1 = "213f507a729b20a1c3cb48f995a034f9c05f53e6";
    };
    deps = {
      "temp-0.6.0" = self.by-version."temp"."0.6.0";
      "fs.extra-1.3.2" = self.by-version."fs.extra"."1.3.2";
      "bower-json-0.4.0" = self.by-version."bower-json"."0.4.0";
      "bower-endpoint-parser-0.2.1" = self.by-version."bower-endpoint-parser"."0.2.1";
      "bower-logger-0.2.1" = self.by-version."bower-logger"."0.2.1";
      "bower-1.3.12" = self.by-version."bower"."1.3.12";
      "argparse-0.1.15" = self.by-version."argparse"."0.1.15";
      "clone-0.1.11" = self.by-version."clone"."0.1.11";
      "semver-2.3.2" = self.by-version."semver"."2.3.2";
      "fetch-bower-2.0.0" = self.by-version."fetch-bower"."2.0.0";
    };
    peerDependencies = [];
  };
  "bower2nix" = self.by-version."bower2nix"."2.1.0";
  by-spec."brace-expansion"."^1.0.0" =
    self.by-version."brace-expansion"."1.1.0";
  by-version."brace-expansion"."1.1.0" = self.buildNodePackage {
    name = "brace-expansion-1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.0.tgz";
      name = "brace-expansion-1.1.0.tgz";
      sha1 = "c9b7d03c03f37bc704be100e522b40db8f6cfcd9";
    };
    deps = {
      "balanced-match-0.2.0" = self.by-version."balanced-match"."0.2.0";
      "concat-map-0.0.1" = self.by-version."concat-map"."0.0.1";
    };
    peerDependencies = [];
  };
  by-spec."buffers"."~0.1.1" =
    self.by-version."buffers"."0.1.1";
  by-version."buffers"."0.1.1" = self.buildNodePackage {
    name = "buffers-0.1.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/buffers/-/buffers-0.1.1.tgz";
      name = "buffers-0.1.1.tgz";
      sha1 = "b24579c3bed4d6d396aeee6d9a8ae7f5482ab7bb";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."cardinal"."0.4.0" =
    self.by-version."cardinal"."0.4.0";
  by-version."cardinal"."0.4.0" = self.buildNodePackage {
    name = "cardinal-0.4.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/cardinal/-/cardinal-0.4.0.tgz";
      name = "cardinal-0.4.0.tgz";
      sha1 = "7d10aafb20837bde043c45e43a0c8c28cdaae45e";
    };
    deps = {
      "redeyed-0.4.4" = self.by-version."redeyed"."0.4.4";
    };
    peerDependencies = [];
  };
  by-spec."caseless"."~0.6.0" =
    self.by-version."caseless"."0.6.0";
  by-version."caseless"."0.6.0" = self.buildNodePackage {
    name = "caseless-0.6.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/caseless/-/caseless-0.6.0.tgz";
      name = "caseless-0.6.0.tgz";
      sha1 = "8167c1ab8397fb5bb95f96d28e5a81c50f247ac4";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."caseless"."~0.8.0" =
    self.by-version."caseless"."0.8.0";
  by-version."caseless"."0.8.0" = self.buildNodePackage {
    name = "caseless-0.8.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/caseless/-/caseless-0.8.0.tgz";
      name = "caseless-0.8.0.tgz";
      sha1 = "5bca2881d41437f54b2407ebe34888c7b9ad4f7d";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."caseless"."~0.9.0" =
    self.by-version."caseless"."0.9.0";
  by-version."caseless"."0.9.0" = self.buildNodePackage {
    name = "caseless-0.9.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/caseless/-/caseless-0.9.0.tgz";
      name = "caseless-0.9.0.tgz";
      sha1 = "b7b65ce6bf1413886539cfd533f0b30effa9cf88";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."chainsaw"."~0.1.0" =
    self.by-version."chainsaw"."0.1.0";
  by-version."chainsaw"."0.1.0" = self.buildNodePackage {
    name = "chainsaw-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/chainsaw/-/chainsaw-0.1.0.tgz";
      name = "chainsaw-0.1.0.tgz";
      sha1 = "5eab50b28afe58074d0d58291388828b5e5fbc98";
    };
    deps = {
      "traverse-0.3.9" = self.by-version."traverse"."0.3.9";
    };
    peerDependencies = [];
  };
  by-spec."chalk"."0.5.0" =
    self.by-version."chalk"."0.5.0";
  by-version."chalk"."0.5.0" = self.buildNodePackage {
    name = "chalk-0.5.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/chalk/-/chalk-0.5.0.tgz";
      name = "chalk-0.5.0.tgz";
      sha1 = "375dfccbc21c0a60a8b61bc5b78f3dc2a55c212f";
    };
    deps = {
      "ansi-styles-1.1.0" = self.by-version."ansi-styles"."1.1.0";
      "escape-string-regexp-1.0.2" = self.by-version."escape-string-regexp"."1.0.2";
      "has-ansi-0.1.0" = self.by-version."has-ansi"."0.1.0";
      "strip-ansi-0.3.0" = self.by-version."strip-ansi"."0.3.0";
      "supports-color-0.2.0" = self.by-version."supports-color"."0.2.0";
    };
    peerDependencies = [];
  };
  by-spec."chalk"."^0.5.0" =
    self.by-version."chalk"."0.5.1";
  by-version."chalk"."0.5.1" = self.buildNodePackage {
    name = "chalk-0.5.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/chalk/-/chalk-0.5.1.tgz";
      name = "chalk-0.5.1.tgz";
      sha1 = "663b3a648b68b55d04690d49167aa837858f2174";
    };
    deps = {
      "ansi-styles-1.1.0" = self.by-version."ansi-styles"."1.1.0";
      "escape-string-regexp-1.0.2" = self.by-version."escape-string-regexp"."1.0.2";
      "has-ansi-0.1.0" = self.by-version."has-ansi"."0.1.0";
      "strip-ansi-0.3.0" = self.by-version."strip-ansi"."0.3.0";
      "supports-color-0.2.0" = self.by-version."supports-color"."0.2.0";
    };
    peerDependencies = [];
  };
  by-spec."chalk"."^0.5.1" =
    self.by-version."chalk"."0.5.1";
  by-spec."chmodr"."0.1.0" =
    self.by-version."chmodr"."0.1.0";
  by-version."chmodr"."0.1.0" = self.buildNodePackage {
    name = "chmodr-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/chmodr/-/chmodr-0.1.0.tgz";
      name = "chmodr-0.1.0.tgz";
      sha1 = "e09215a1d51542db2a2576969765bcf6125583eb";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."chownr"."0" =
    self.by-version."chownr"."0.0.1";
  by-version."chownr"."0.0.1" = self.buildNodePackage {
    name = "chownr-0.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/chownr/-/chownr-0.0.1.tgz";
      name = "chownr-0.0.1.tgz";
      sha1 = "51d18189d9092d5f8afd623f3288bfd1c6bf1a62";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."cli-color"."~0.3.2" =
    self.by-version."cli-color"."0.3.2";
  by-version."cli-color"."0.3.2" = self.buildNodePackage {
    name = "cli-color-0.3.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/cli-color/-/cli-color-0.3.2.tgz";
      name = "cli-color-0.3.2.tgz";
      sha1 = "75fa5f728c308cc4ac594b05e06cc5d80daccd86";
    };
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.6" = self.by-version."es5-ext"."0.10.6";
      "memoizee-0.3.8" = self.by-version."memoizee"."0.3.8";
      "timers-ext-0.1.0" = self.by-version."timers-ext"."0.1.0";
    };
    peerDependencies = [];
  };
  by-spec."clone"."0.1.11" =
    self.by-version."clone"."0.1.11";
  by-version."clone"."0.1.11" = self.buildNodePackage {
    name = "clone-0.1.11";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/clone/-/clone-0.1.11.tgz";
      name = "clone-0.1.11.tgz";
      sha1 = "408b7d1773eb0dfbf2ddb156c1c47170c17e3a96";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."coffee-script"."*" =
    self.by-version."coffee-script"."1.9.0";
  by-version."coffee-script"."1.9.0" = self.buildNodePackage {
    name = "coffee-script-1.9.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/coffee-script/-/coffee-script-1.9.0.tgz";
      name = "coffee-script-1.9.0.tgz";
      sha1 = "7492cbbc3f0361cc5d8865aff7237552ff33e1f7";
    };
    deps = {
    };
    peerDependencies = [];
  };
  "coffee-script" = self.by-version."coffee-script"."1.9.0";
  by-spec."combined-stream"."~0.0.4" =
    self.by-version."combined-stream"."0.0.7";
  by-version."combined-stream"."0.0.7" = self.buildNodePackage {
    name = "combined-stream-0.0.7";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/combined-stream/-/combined-stream-0.0.7.tgz";
      name = "combined-stream-0.0.7.tgz";
      sha1 = "0137e657baa5a7541c57ac37ac5fc07d73b4dc1f";
    };
    deps = {
      "delayed-stream-0.0.5" = self.by-version."delayed-stream"."0.0.5";
    };
    peerDependencies = [];
  };
  by-spec."combined-stream"."~0.0.5" =
    self.by-version."combined-stream"."0.0.7";
  by-spec."concat-map"."0.0.1" =
    self.by-version."concat-map"."0.0.1";
  by-version."concat-map"."0.0.1" = self.buildNodePackage {
    name = "concat-map-0.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
      name = "concat-map-0.0.1.tgz";
      sha1 = "d8a96bd77fd68df7793a73036a3ba0d5405d477b";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."config-chain"."~1.1.1" =
    self.by-version."config-chain"."1.1.8";
  by-version."config-chain"."1.1.8" = self.buildNodePackage {
    name = "config-chain-1.1.8";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/config-chain/-/config-chain-1.1.8.tgz";
      name = "config-chain-1.1.8.tgz";
      sha1 = "0943d0b7227213a20d4eaff4434f4a1c0a052cad";
    };
    deps = {
      "proto-list-1.2.3" = self.by-version."proto-list"."1.2.3";
      "ini-1.3.3" = self.by-version."ini"."1.3.3";
    };
    peerDependencies = [];
  };
  by-spec."config-chain"."~1.1.8" =
    self.by-version."config-chain"."1.1.8";
  by-spec."configstore"."^0.3.0" =
    self.by-version."configstore"."0.3.2";
  by-version."configstore"."0.3.2" = self.buildNodePackage {
    name = "configstore-0.3.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/configstore/-/configstore-0.3.2.tgz";
      name = "configstore-0.3.2.tgz";
      sha1 = "25e4c16c3768abf75c5a65bc61761f495055b459";
    };
    deps = {
      "graceful-fs-3.0.5" = self.by-version."graceful-fs"."3.0.5";
      "js-yaml-3.2.6" = self.by-version."js-yaml"."3.2.6";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "object-assign-2.0.0" = self.by-version."object-assign"."2.0.0";
      "osenv-0.1.0" = self.by-version."osenv"."0.1.0";
      "user-home-1.1.1" = self.by-version."user-home"."1.1.1";
      "uuid-2.0.1" = self.by-version."uuid"."2.0.1";
      "xdg-basedir-1.0.1" = self.by-version."xdg-basedir"."1.0.1";
    };
    peerDependencies = [];
  };
  by-spec."configstore"."^0.3.1" =
    self.by-version."configstore"."0.3.2";
  by-spec."core-util-is"."~1.0.0" =
    self.by-version."core-util-is"."1.0.1";
  by-version."core-util-is"."1.0.1" = self.buildNodePackage {
    name = "core-util-is-1.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/core-util-is/-/core-util-is-1.0.1.tgz";
      name = "core-util-is-1.0.1.tgz";
      sha1 = "6b07085aef9a3ccac6ee53bf9d3df0c1521a5538";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."couch-login"."~0.1.15" =
    self.by-version."couch-login"."0.1.20";
  by-version."couch-login"."0.1.20" = self.buildNodePackage {
    name = "couch-login-0.1.20";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/couch-login/-/couch-login-0.1.20.tgz";
      name = "couch-login-0.1.20.tgz";
      sha1 = "007c70ef80089dbae6f59eeeec37480799b39595";
    };
    deps = {
      "request-2.53.0" = self.by-version."request"."2.53.0";
    };
    peerDependencies = [];
  };
  by-spec."cryptiles"."0.2.x" =
    self.by-version."cryptiles"."0.2.2";
  by-version."cryptiles"."0.2.2" = self.buildNodePackage {
    name = "cryptiles-0.2.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/cryptiles/-/cryptiles-0.2.2.tgz";
      name = "cryptiles-0.2.2.tgz";
      sha1 = "ed91ff1f17ad13d3748288594f8a48a0d26f325c";
    };
    deps = {
      "boom-0.4.2" = self.by-version."boom"."0.4.2";
    };
    peerDependencies = [];
  };
  by-spec."cryptiles"."2.x.x" =
    self.by-version."cryptiles"."2.0.4";
  by-version."cryptiles"."2.0.4" = self.buildNodePackage {
    name = "cryptiles-2.0.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/cryptiles/-/cryptiles-2.0.4.tgz";
      name = "cryptiles-2.0.4.tgz";
      sha1 = "09ea1775b9e1c7de7e60a99d42ab6f08ce1a1285";
    };
    deps = {
      "boom-2.6.1" = self.by-version."boom"."2.6.1";
    };
    peerDependencies = [];
  };
  by-spec."ctype"."0.5.3" =
    self.by-version."ctype"."0.5.3";
  by-version."ctype"."0.5.3" = self.buildNodePackage {
    name = "ctype-0.5.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ctype/-/ctype-0.5.3.tgz";
      name = "ctype-0.5.3.tgz";
      sha1 = "82c18c2461f74114ef16c135224ad0b9144ca12f";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."d"."~0.1.1" =
    self.by-version."d"."0.1.1";
  by-version."d"."0.1.1" = self.buildNodePackage {
    name = "d-0.1.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/d/-/d-0.1.1.tgz";
      name = "d-0.1.1.tgz";
      sha1 = "da184c535d18d8ee7ba2aa229b914009fae11309";
    };
    deps = {
      "es5-ext-0.10.6" = self.by-version."es5-ext"."0.10.6";
    };
    peerDependencies = [];
  };
  by-spec."decompress-zip"."0.0.8" =
    self.by-version."decompress-zip"."0.0.8";
  by-version."decompress-zip"."0.0.8" = self.buildNodePackage {
    name = "decompress-zip-0.0.8";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/decompress-zip/-/decompress-zip-0.0.8.tgz";
      name = "decompress-zip-0.0.8.tgz";
      sha1 = "4a265b22c7b209d7b24fa66f2b2dfbced59044f3";
    };
    deps = {
      "q-1.0.1" = self.by-version."q"."1.0.1";
      "mkpath-0.1.0" = self.by-version."mkpath"."0.1.0";
      "binary-0.3.0" = self.by-version."binary"."0.3.0";
      "touch-0.0.2" = self.by-version."touch"."0.0.2";
      "readable-stream-1.1.13" = self.by-version."readable-stream"."1.1.13";
      "nopt-2.2.1" = self.by-version."nopt"."2.2.1";
      "graceful-fs-3.0.5" = self.by-version."graceful-fs"."3.0.5";
    };
    peerDependencies = [];
  };
  by-spec."deep-extend"."~0.2.5" =
    self.by-version."deep-extend"."0.2.11";
  by-version."deep-extend"."0.2.11" = self.buildNodePackage {
    name = "deep-extend-0.2.11";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/deep-extend/-/deep-extend-0.2.11.tgz";
      name = "deep-extend-0.2.11.tgz";
      sha1 = "7a16ba69729132340506170494bc83f7076fe08f";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."delayed-stream"."0.0.5" =
    self.by-version."delayed-stream"."0.0.5";
  by-version."delayed-stream"."0.0.5" = self.buildNodePackage {
    name = "delayed-stream-0.0.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/delayed-stream/-/delayed-stream-0.0.5.tgz";
      name = "delayed-stream-0.0.5.tgz";
      sha1 = "d4b1f43a93e8296dfe02694f4680bc37a313c73f";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."delegates"."^0.1.0" =
    self.by-version."delegates"."0.1.0";
  by-version."delegates"."0.1.0" = self.buildNodePackage {
    name = "delegates-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/delegates/-/delegates-0.1.0.tgz";
      name = "delegates-0.1.0.tgz";
      sha1 = "b4b57be11a1653517a04b27f0949bdc327dfe390";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."end-of-stream"."^1.0.0" =
    self.by-version."end-of-stream"."1.1.0";
  by-version."end-of-stream"."1.1.0" = self.buildNodePackage {
    name = "end-of-stream-1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/end-of-stream/-/end-of-stream-1.1.0.tgz";
      name = "end-of-stream-1.1.0.tgz";
      sha1 = "e9353258baa9108965efc41cb0ef8ade2f3cfb07";
    };
    deps = {
      "once-1.3.1" = self.by-version."once"."1.3.1";
    };
    peerDependencies = [];
  };
  by-spec."end-of-stream"."~1.0.0" =
    self.by-version."end-of-stream"."1.0.0";
  by-version."end-of-stream"."1.0.0" = self.buildNodePackage {
    name = "end-of-stream-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/end-of-stream/-/end-of-stream-1.0.0.tgz";
      name = "end-of-stream-1.0.0.tgz";
      sha1 = "d4596e702734a93e40e9af864319eabd99ff2f0e";
    };
    deps = {
      "once-1.3.1" = self.by-version."once"."1.3.1";
    };
    peerDependencies = [];
  };
  by-spec."es5-ext"."~0.10.2" =
    self.by-version."es5-ext"."0.10.6";
  by-version."es5-ext"."0.10.6" = self.buildNodePackage {
    name = "es5-ext-0.10.6";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/es5-ext/-/es5-ext-0.10.6.tgz";
      name = "es5-ext-0.10.6.tgz";
      sha1 = "e27d5750401a11c08259e3b9b5d3bdd3281df00a";
    };
    deps = {
      "es6-iterator-0.1.3" = self.by-version."es6-iterator"."0.1.3";
      "es6-symbol-2.0.1" = self.by-version."es6-symbol"."2.0.1";
    };
    peerDependencies = [];
  };
  by-spec."es5-ext"."~0.10.4" =
    self.by-version."es5-ext"."0.10.6";
  by-spec."es5-ext"."~0.10.5" =
    self.by-version."es5-ext"."0.10.6";
  by-spec."es6-iterator"."~0.1.1" =
    self.by-version."es6-iterator"."0.1.3";
  by-version."es6-iterator"."0.1.3" = self.buildNodePackage {
    name = "es6-iterator-0.1.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/es6-iterator/-/es6-iterator-0.1.3.tgz";
      name = "es6-iterator-0.1.3.tgz";
      sha1 = "d6f58b8c4fc413c249b4baa19768f8e4d7c8944e";
    };
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.6" = self.by-version."es5-ext"."0.10.6";
      "es6-symbol-2.0.1" = self.by-version."es6-symbol"."2.0.1";
    };
    peerDependencies = [];
  };
  by-spec."es6-iterator"."~0.1.3" =
    self.by-version."es6-iterator"."0.1.3";
  by-spec."es6-symbol"."0.1.x" =
    self.by-version."es6-symbol"."0.1.1";
  by-version."es6-symbol"."0.1.1" = self.buildNodePackage {
    name = "es6-symbol-0.1.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/es6-symbol/-/es6-symbol-0.1.1.tgz";
      name = "es6-symbol-0.1.1.tgz";
      sha1 = "9cf7fab2edaff1b1da8fe8e68bfe3f5aca6ca218";
    };
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.6" = self.by-version."es5-ext"."0.10.6";
    };
    peerDependencies = [];
  };
  by-spec."es6-symbol"."~2.0.1" =
    self.by-version."es6-symbol"."2.0.1";
  by-version."es6-symbol"."2.0.1" = self.buildNodePackage {
    name = "es6-symbol-2.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/es6-symbol/-/es6-symbol-2.0.1.tgz";
      name = "es6-symbol-2.0.1.tgz";
      sha1 = "761b5c67cfd4f1d18afb234f691d678682cb3bf3";
    };
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.6" = self.by-version."es5-ext"."0.10.6";
    };
    peerDependencies = [];
  };
  by-spec."es6-weak-map"."~0.1.2" =
    self.by-version."es6-weak-map"."0.1.2";
  by-version."es6-weak-map"."0.1.2" = self.buildNodePackage {
    name = "es6-weak-map-0.1.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/es6-weak-map/-/es6-weak-map-0.1.2.tgz";
      name = "es6-weak-map-0.1.2.tgz";
      sha1 = "bc5b5fab73f68f6f77a6b39c481fce3d7856d385";
    };
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.6" = self.by-version."es5-ext"."0.10.6";
      "es6-iterator-0.1.3" = self.by-version."es6-iterator"."0.1.3";
      "es6-symbol-0.1.1" = self.by-version."es6-symbol"."0.1.1";
    };
    peerDependencies = [];
  };
  by-spec."escape-string-regexp"."^1.0.0" =
    self.by-version."escape-string-regexp"."1.0.2";
  by-version."escape-string-regexp"."1.0.2" = self.buildNodePackage {
    name = "escape-string-regexp-1.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.2.tgz";
      name = "escape-string-regexp-1.0.2.tgz";
      sha1 = "4dbc2fe674e71949caf3fb2695ce7f2dc1d9a8d1";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."esprima"."~ 1.0.2" =
    self.by-version."esprima"."1.0.4";
  by-version."esprima"."1.0.4" = self.buildNodePackage {
    name = "esprima-1.0.4";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/esprima/-/esprima-1.0.4.tgz";
      name = "esprima-1.0.4.tgz";
      sha1 = "9f557e08fc3b4d26ece9dd34f8fbf476b62585ad";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."esprima"."~1.0.4" =
    self.by-version."esprima"."1.0.4";
  by-spec."event-emitter"."~0.3.1" =
    self.by-version."event-emitter"."0.3.3";
  by-version."event-emitter"."0.3.3" = self.buildNodePackage {
    name = "event-emitter-0.3.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/event-emitter/-/event-emitter-0.3.3.tgz";
      name = "event-emitter-0.3.3.tgz";
      sha1 = "df8e806541c68ab8ff20a79a1841b91abaa1bee4";
    };
    deps = {
      "es5-ext-0.10.6" = self.by-version."es5-ext"."0.10.6";
      "d-0.1.1" = self.by-version."d"."0.1.1";
    };
    peerDependencies = [];
  };
  by-spec."fetch-bower"."*" =
    self.by-version."fetch-bower"."2.0.0";
  by-version."fetch-bower"."2.0.0" = self.buildNodePackage {
    name = "fetch-bower-2.0.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/fetch-bower/-/fetch-bower-2.0.0.tgz";
      name = "fetch-bower-2.0.0.tgz";
      sha1 = "c027feb75a512001d1287bbfb3ffaafba67eb92f";
    };
    deps = {
      "bower-endpoint-parser-0.2.1" = self.by-version."bower-endpoint-parser"."0.2.1";
      "bower-logger-0.2.1" = self.by-version."bower-logger"."0.2.1";
      "bower-1.3.12" = self.by-version."bower"."1.3.12";
      "glob-3.2.11" = self.by-version."glob"."3.2.11";
    };
    peerDependencies = [];
  };
  "fetch-bower" = self.by-version."fetch-bower"."2.0.0";
  by-spec."fetch-bower".">=2 <3" =
    self.by-version."fetch-bower"."2.0.0";
  by-spec."figures"."^1.3.2" =
    self.by-version."figures"."1.3.5";
  by-version."figures"."1.3.5" = self.buildNodePackage {
    name = "figures-1.3.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/figures/-/figures-1.3.5.tgz";
      name = "figures-1.3.5.tgz";
      sha1 = "d1a31f4e1d2c2938ecde5c06aa16134cf29f4771";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."findit".">=1.1.0 <2.0.0" =
    self.by-version."findit"."1.2.0";
  by-version."findit"."1.2.0" = self.buildNodePackage {
    name = "findit-1.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/findit/-/findit-1.2.0.tgz";
      name = "findit-1.2.0.tgz";
      sha1 = "f571a3a840749ae8b0cbf4bf43ced7659eec3ce8";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."foreachasync"."^3.0.0" =
    self.by-version."foreachasync"."3.0.0";
  by-version."foreachasync"."3.0.0" = self.buildNodePackage {
    name = "foreachasync-3.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/foreachasync/-/foreachasync-3.0.0.tgz";
      name = "foreachasync-3.0.0.tgz";
      sha1 = "5502987dc8714be3392097f32e0071c9dee07cf6";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."forever-agent"."~0.5.0" =
    self.by-version."forever-agent"."0.5.2";
  by-version."forever-agent"."0.5.2" = self.buildNodePackage {
    name = "forever-agent-0.5.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/forever-agent/-/forever-agent-0.5.2.tgz";
      name = "forever-agent-0.5.2.tgz";
      sha1 = "6d0e09c4921f94a27f63d3b49c5feff1ea4c5130";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."form-data"."~0.1.0" =
    self.by-version."form-data"."0.1.4";
  by-version."form-data"."0.1.4" = self.buildNodePackage {
    name = "form-data-0.1.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/form-data/-/form-data-0.1.4.tgz";
      name = "form-data-0.1.4.tgz";
      sha1 = "91abd788aba9702b1aabfa8bc01031a2ac9e3b12";
    };
    deps = {
      "combined-stream-0.0.7" = self.by-version."combined-stream"."0.0.7";
      "mime-1.2.11" = self.by-version."mime"."1.2.11";
      "async-0.9.0" = self.by-version."async"."0.9.0";
    };
    peerDependencies = [];
  };
  by-spec."form-data"."~0.2.0" =
    self.by-version."form-data"."0.2.0";
  by-version."form-data"."0.2.0" = self.buildNodePackage {
    name = "form-data-0.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/form-data/-/form-data-0.2.0.tgz";
      name = "form-data-0.2.0.tgz";
      sha1 = "26f8bc26da6440e299cbdcfb69035c4f77a6e466";
    };
    deps = {
      "async-0.9.0" = self.by-version."async"."0.9.0";
      "combined-stream-0.0.7" = self.by-version."combined-stream"."0.0.7";
      "mime-types-2.0.9" = self.by-version."mime-types"."2.0.9";
    };
    peerDependencies = [];
  };
  by-spec."fs-extra"."~0.6.1" =
    self.by-version."fs-extra"."0.6.4";
  by-version."fs-extra"."0.6.4" = self.buildNodePackage {
    name = "fs-extra-0.6.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/fs-extra/-/fs-extra-0.6.4.tgz";
      name = "fs-extra-0.6.4.tgz";
      sha1 = "f46f0c75b7841f8d200b3348cd4d691d5a099d15";
    };
    deps = {
      "ncp-0.4.2" = self.by-version."ncp"."0.4.2";
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
      "jsonfile-1.0.1" = self.by-version."jsonfile"."1.0.1";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
    };
    peerDependencies = [];
  };
  by-spec."fs.extra".">=1.2.0 <2.0.0" =
    self.by-version."fs.extra"."1.3.2";
  by-version."fs.extra"."1.3.2" = self.buildNodePackage {
    name = "fs.extra-1.3.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/fs.extra/-/fs.extra-1.3.2.tgz";
      name = "fs.extra-1.3.2.tgz";
      sha1 = "dd023f93013bee24531f1b33514c37b20fd93349";
    };
    deps = {
      "fs-extra-0.6.4" = self.by-version."fs-extra"."0.6.4";
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
      "walk-2.3.9" = self.by-version."walk"."2.3.9";
    };
    peerDependencies = [];
  };
  by-spec."fs.extra".">=1.2.1 <2" =
    self.by-version."fs.extra"."1.3.2";
  by-spec."fstream"."^1.0.0" =
    self.by-version."fstream"."1.0.4";
  by-version."fstream"."1.0.4" = self.buildNodePackage {
    name = "fstream-1.0.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/fstream/-/fstream-1.0.4.tgz";
      name = "fstream-1.0.4.tgz";
      sha1 = "6c52298473fd6351fd22fc4bf9254fcfebe80f2b";
    };
    deps = {
      "graceful-fs-3.0.5" = self.by-version."graceful-fs"."3.0.5";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
    };
    peerDependencies = [];
  };
  by-spec."fstream"."~0.1.8" =
    self.by-version."fstream"."0.1.31";
  by-version."fstream"."0.1.31" = self.buildNodePackage {
    name = "fstream-0.1.31";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/fstream/-/fstream-0.1.31.tgz";
      name = "fstream-0.1.31.tgz";
      sha1 = "7337f058fbbbbefa8c9f561a28cab0849202c988";
    };
    deps = {
      "graceful-fs-3.0.5" = self.by-version."graceful-fs"."3.0.5";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
    };
    peerDependencies = [];
  };
  by-spec."fstream"."~1.0.2" =
    self.by-version."fstream"."1.0.4";
  by-spec."fstream-ignore"."~1.0.1" =
    self.by-version."fstream-ignore"."1.0.2";
  by-version."fstream-ignore"."1.0.2" = self.buildNodePackage {
    name = "fstream-ignore-1.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/fstream-ignore/-/fstream-ignore-1.0.2.tgz";
      name = "fstream-ignore-1.0.2.tgz";
      sha1 = "18c891db01b782a74a7bff936a0f24997741c7ab";
    };
    deps = {
      "fstream-1.0.4" = self.by-version."fstream"."1.0.4";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "minimatch-2.0.1" = self.by-version."minimatch"."2.0.1";
    };
    peerDependencies = [];
  };
  by-spec."gauge"."~1.1.0" =
    self.by-version."gauge"."1.1.0";
  by-version."gauge"."1.1.0" = self.buildNodePackage {
    name = "gauge-1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/gauge/-/gauge-1.1.0.tgz";
      name = "gauge-1.1.0.tgz";
      sha1 = "4f1c13cb6232469f65de92357b34f8ff53c5ca41";
    };
    deps = {
      "ansi-0.3.0" = self.by-version."ansi"."0.3.0";
      "has-unicode-1.0.0" = self.by-version."has-unicode"."1.0.0";
      "lodash.pad-3.0.0" = self.by-version."lodash.pad"."3.0.0";
      "lodash.padleft-3.0.0" = self.by-version."lodash.padleft"."3.0.0";
      "lodash.padright-3.0.0" = self.by-version."lodash.padright"."3.0.0";
    };
    peerDependencies = [];
  };
  by-spec."glob".">=3.2.7 <4" =
    self.by-version."glob"."3.2.11";
  by-version."glob"."3.2.11" = self.buildNodePackage {
    name = "glob-3.2.11";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/glob/-/glob-3.2.11.tgz";
      name = "glob-3.2.11.tgz";
      sha1 = "4a973f635b9190f715d10987d5c00fd2815ebe3d";
    };
    deps = {
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "minimatch-0.3.0" = self.by-version."minimatch"."0.3.0";
    };
    peerDependencies = [];
  };
  by-spec."glob"."~4.0.2" =
    self.by-version."glob"."4.0.6";
  by-version."glob"."4.0.6" = self.buildNodePackage {
    name = "glob-4.0.6";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/glob/-/glob-4.0.6.tgz";
      name = "glob-4.0.6.tgz";
      sha1 = "695c50bdd4e2fb5c5d370b091f388d3707e291a7";
    };
    deps = {
      "graceful-fs-3.0.5" = self.by-version."graceful-fs"."3.0.5";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "minimatch-1.0.0" = self.by-version."minimatch"."1.0.0";
      "once-1.3.1" = self.by-version."once"."1.3.1";
    };
    peerDependencies = [];
  };
  by-spec."got"."^0.3.0" =
    self.by-version."got"."0.3.0";
  by-version."got"."0.3.0" = self.buildNodePackage {
    name = "got-0.3.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/got/-/got-0.3.0.tgz";
      name = "got-0.3.0.tgz";
      sha1 = "888ec66ca4bc735ab089dbe959496d0f79485493";
    };
    deps = {
      "object-assign-0.3.1" = self.by-version."object-assign"."0.3.1";
    };
    peerDependencies = [];
  };
  by-spec."graceful-fs"."3" =
    self.by-version."graceful-fs"."3.0.5";
  by-version."graceful-fs"."3.0.5" = self.buildNodePackage {
    name = "graceful-fs-3.0.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/graceful-fs/-/graceful-fs-3.0.5.tgz";
      name = "graceful-fs-3.0.5.tgz";
      sha1 = "4a880474bdeb716fe3278cf29792dec38dfac418";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."graceful-fs"."^3.0.1" =
    self.by-version."graceful-fs"."3.0.5";
  by-spec."graceful-fs"."^3.0.2" =
    self.by-version."graceful-fs"."3.0.5";
  by-spec."graceful-fs"."~1" =
    self.by-version."graceful-fs"."1.2.3";
  by-version."graceful-fs"."1.2.3" = self.buildNodePackage {
    name = "graceful-fs-1.2.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/graceful-fs/-/graceful-fs-1.2.3.tgz";
      name = "graceful-fs-1.2.3.tgz";
      sha1 = "15a4806a57547cb2d2dbf27f42e89a8c3451b364";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."graceful-fs"."~2.0.0" =
    self.by-version."graceful-fs"."2.0.3";
  by-version."graceful-fs"."2.0.3" = self.buildNodePackage {
    name = "graceful-fs-2.0.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/graceful-fs/-/graceful-fs-2.0.3.tgz";
      name = "graceful-fs-2.0.3.tgz";
      sha1 = "7cd2cdb228a4a3f36e95efa6cc142de7d1a136d0";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."graceful-fs"."~3.0.0" =
    self.by-version."graceful-fs"."3.0.5";
  by-spec."graceful-fs"."~3.0.1" =
    self.by-version."graceful-fs"."3.0.5";
  by-spec."graceful-fs"."~3.0.2" =
    self.by-version."graceful-fs"."3.0.5";
  by-spec."handlebars"."~2.0.0" =
    self.by-version."handlebars"."2.0.0";
  by-version."handlebars"."2.0.0" = self.buildNodePackage {
    name = "handlebars-2.0.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/handlebars/-/handlebars-2.0.0.tgz";
      name = "handlebars-2.0.0.tgz";
      sha1 = "6e9d7f8514a3467fa5e9f82cc158ecfc1d5ac76f";
    };
    deps = {
      "optimist-0.3.7" = self.by-version."optimist"."0.3.7";
      "uglify-js-2.3.6" = self.by-version."uglify-js"."2.3.6";
    };
    peerDependencies = [];
  };
  by-spec."has-ansi"."^0.1.0" =
    self.by-version."has-ansi"."0.1.0";
  by-version."has-ansi"."0.1.0" = self.buildNodePackage {
    name = "has-ansi-0.1.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/has-ansi/-/has-ansi-0.1.0.tgz";
      name = "has-ansi-0.1.0.tgz";
      sha1 = "84f265aae8c0e6a88a12d7022894b7568894c62e";
    };
    deps = {
      "ansi-regex-0.2.1" = self.by-version."ansi-regex"."0.2.1";
    };
    peerDependencies = [];
  };
  by-spec."has-unicode"."^1.0.0" =
    self.by-version."has-unicode"."1.0.0";
  by-version."has-unicode"."1.0.0" = self.buildNodePackage {
    name = "has-unicode-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/has-unicode/-/has-unicode-1.0.0.tgz";
      name = "has-unicode-1.0.0.tgz";
      sha1 = "bac5c44e064c2ffc3b8fcbd8c71afe08f9afc8cc";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."hawk"."1.1.1" =
    self.by-version."hawk"."1.1.1";
  by-version."hawk"."1.1.1" = self.buildNodePackage {
    name = "hawk-1.1.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/hawk/-/hawk-1.1.1.tgz";
      name = "hawk-1.1.1.tgz";
      sha1 = "87cd491f9b46e4e2aeaca335416766885d2d1ed9";
    };
    deps = {
      "hoek-0.9.1" = self.by-version."hoek"."0.9.1";
      "boom-0.4.2" = self.by-version."boom"."0.4.2";
      "cryptiles-0.2.2" = self.by-version."cryptiles"."0.2.2";
      "sntp-0.2.4" = self.by-version."sntp"."0.2.4";
    };
    peerDependencies = [];
  };
  by-spec."hawk"."~2.3.0" =
    self.by-version."hawk"."2.3.1";
  by-version."hawk"."2.3.1" = self.buildNodePackage {
    name = "hawk-2.3.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/hawk/-/hawk-2.3.1.tgz";
      name = "hawk-2.3.1.tgz";
      sha1 = "1e731ce39447fa1d0f6d707f7bceebec0fd1ec1f";
    };
    deps = {
      "hoek-2.11.0" = self.by-version."hoek"."2.11.0";
      "boom-2.6.1" = self.by-version."boom"."2.6.1";
      "cryptiles-2.0.4" = self.by-version."cryptiles"."2.0.4";
      "sntp-1.0.9" = self.by-version."sntp"."1.0.9";
    };
    peerDependencies = [];
  };
  by-spec."hoek"."0.9.x" =
    self.by-version."hoek"."0.9.1";
  by-version."hoek"."0.9.1" = self.buildNodePackage {
    name = "hoek-0.9.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/hoek/-/hoek-0.9.1.tgz";
      name = "hoek-0.9.1.tgz";
      sha1 = "3d322462badf07716ea7eb85baf88079cddce505";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."hoek"."2.x.x" =
    self.by-version."hoek"."2.11.0";
  by-version."hoek"."2.11.0" = self.buildNodePackage {
    name = "hoek-2.11.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/hoek/-/hoek-2.11.0.tgz";
      name = "hoek-2.11.0.tgz";
      sha1 = "e588ec66a6b405b0e7140308720e1e1cd4f035b7";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."http-signature"."~0.10.0" =
    self.by-version."http-signature"."0.10.1";
  by-version."http-signature"."0.10.1" = self.buildNodePackage {
    name = "http-signature-0.10.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/http-signature/-/http-signature-0.10.1.tgz";
      name = "http-signature-0.10.1.tgz";
      sha1 = "4fbdac132559aa8323121e540779c0a012b27e66";
    };
    deps = {
      "assert-plus-0.1.5" = self.by-version."assert-plus"."0.1.5";
      "asn1-0.1.11" = self.by-version."asn1"."0.1.11";
      "ctype-0.5.3" = self.by-version."ctype"."0.5.3";
    };
    peerDependencies = [];
  };
  by-spec."inherits"."1.x" =
    self.by-version."inherits"."1.0.0";
  by-version."inherits"."1.0.0" = self.buildNodePackage {
    name = "inherits-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/inherits/-/inherits-1.0.0.tgz";
      name = "inherits-1.0.0.tgz";
      sha1 = "38e1975285bf1f7ba9c84da102bb12771322ac48";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."inherits"."2" =
    self.by-version."inherits"."2.0.1";
  by-version."inherits"."2.0.1" = self.buildNodePackage {
    name = "inherits-2.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/inherits/-/inherits-2.0.1.tgz";
      name = "inherits-2.0.1.tgz";
      sha1 = "b17d08d326b4423e568eff719f91b0b1cbdf69f1";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."inherits"."~1.0.0" =
    self.by-version."inherits"."1.0.0";
  by-spec."inherits"."~2.0.0" =
    self.by-version."inherits"."2.0.1";
  by-spec."inherits"."~2.0.1" =
    self.by-version."inherits"."2.0.1";
  by-spec."ini"."1" =
    self.by-version."ini"."1.3.3";
  by-version."ini"."1.3.3" = self.buildNodePackage {
    name = "ini-1.3.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ini/-/ini-1.3.3.tgz";
      name = "ini-1.3.3.tgz";
      sha1 = "c07e34aef1de06aff21d413b458e52b21533a11e";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."ini"."^1.2.0" =
    self.by-version."ini"."1.3.3";
  by-spec."ini"."~1.1.0" =
    self.by-version."ini"."1.1.0";
  by-version."ini"."1.1.0" = self.buildNodePackage {
    name = "ini-1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ini/-/ini-1.1.0.tgz";
      name = "ini-1.1.0.tgz";
      sha1 = "4e808c2ce144c6c1788918e034d6797bc6cf6281";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."inquirer"."0.7.1" =
    self.by-version."inquirer"."0.7.1";
  by-version."inquirer"."0.7.1" = self.buildNodePackage {
    name = "inquirer-0.7.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/inquirer/-/inquirer-0.7.1.tgz";
      name = "inquirer-0.7.1.tgz";
      sha1 = "b8acf140165bd581862ed1198fb6d26430091fac";
    };
    deps = {
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "cli-color-0.3.2" = self.by-version."cli-color"."0.3.2";
      "figures-1.3.5" = self.by-version."figures"."1.3.5";
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
      "readline2-0.1.1" = self.by-version."readline2"."0.1.1";
      "rx-2.3.25" = self.by-version."rx"."2.3.25";
      "through-2.3.6" = self.by-version."through"."2.3.6";
    };
    peerDependencies = [];
  };
  by-spec."inquirer"."^0.6.0" =
    self.by-version."inquirer"."0.6.0";
  by-version."inquirer"."0.6.0" = self.buildNodePackage {
    name = "inquirer-0.6.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/inquirer/-/inquirer-0.6.0.tgz";
      name = "inquirer-0.6.0.tgz";
      sha1 = "614d7bb3e48f9e6a8028e94a0c38f23ef29823d3";
    };
    deps = {
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "cli-color-0.3.2" = self.by-version."cli-color"."0.3.2";
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
      "readline2-0.1.1" = self.by-version."readline2"."0.1.1";
      "rx-2.3.25" = self.by-version."rx"."2.3.25";
      "through-2.3.6" = self.by-version."through"."2.3.6";
    };
    peerDependencies = [];
  };
  by-spec."insight"."0.4.3" =
    self.by-version."insight"."0.4.3";
  by-version."insight"."0.4.3" = self.buildNodePackage {
    name = "insight-0.4.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/insight/-/insight-0.4.3.tgz";
      name = "insight-0.4.3.tgz";
      sha1 = "76d653c5c0d8048b03cdba6385a6948f74614af0";
    };
    deps = {
      "async-0.9.0" = self.by-version."async"."0.9.0";
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "configstore-0.3.2" = self.by-version."configstore"."0.3.2";
      "inquirer-0.6.0" = self.by-version."inquirer"."0.6.0";
      "lodash.debounce-2.4.1" = self.by-version."lodash.debounce"."2.4.1";
      "object-assign-1.0.0" = self.by-version."object-assign"."1.0.0";
      "os-name-1.0.3" = self.by-version."os-name"."1.0.3";
      "request-2.53.0" = self.by-version."request"."2.53.0";
      "tough-cookie-0.12.1" = self.by-version."tough-cookie"."0.12.1";
    };
    peerDependencies = [];
  };
  by-spec."intersect"."~0.0.3" =
    self.by-version."intersect"."0.0.3";
  by-version."intersect"."0.0.3" = self.buildNodePackage {
    name = "intersect-0.0.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/intersect/-/intersect-0.0.3.tgz";
      name = "intersect-0.0.3.tgz";
      sha1 = "c1a4a5e5eac6ede4af7504cc07e0ada7bc9f4920";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."is-root"."~1.0.0" =
    self.by-version."is-root"."1.0.0";
  by-version."is-root"."1.0.0" = self.buildNodePackage {
    name = "is-root-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/is-root/-/is-root-1.0.0.tgz";
      name = "is-root-1.0.0.tgz";
      sha1 = "07b6c233bc394cd9d02ba15c966bd6660d6342d5";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."isarray"."0.0.1" =
    self.by-version."isarray"."0.0.1";
  by-version."isarray"."0.0.1" = self.buildNodePackage {
    name = "isarray-0.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz";
      name = "isarray-0.0.1.tgz";
      sha1 = "8a18acfca9a8f4177e09abfc6038939b05d1eedf";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."isstream"."~0.1.1" =
    self.by-version."isstream"."0.1.1";
  by-version."isstream"."0.1.1" = self.buildNodePackage {
    name = "isstream-0.1.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/isstream/-/isstream-0.1.1.tgz";
      name = "isstream-0.1.1.tgz";
      sha1 = "48332c5999893996ba253c81c7bd6e7ae0905c4f";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."js-yaml"."^3.1.0" =
    self.by-version."js-yaml"."3.2.6";
  by-version."js-yaml"."3.2.6" = self.buildNodePackage {
    name = "js-yaml-3.2.6";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/js-yaml/-/js-yaml-3.2.6.tgz";
      name = "js-yaml-3.2.6.tgz";
      sha1 = "dde1ffbe2726e3fff97efb65fd02dbd6647b8309";
    };
    deps = {
      "argparse-0.1.16" = self.by-version."argparse"."0.1.16";
      "esprima-1.0.4" = self.by-version."esprima"."1.0.4";
    };
    peerDependencies = [];
  };
  by-spec."json-stringify-safe"."~5.0.0" =
    self.by-version."json-stringify-safe"."5.0.0";
  by-version."json-stringify-safe"."5.0.0" = self.buildNodePackage {
    name = "json-stringify-safe-5.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.0.tgz";
      name = "json-stringify-safe-5.0.0.tgz";
      sha1 = "4c1f228b5050837eba9d21f50c2e6e320624566e";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."jsonfile"."~1.0.1" =
    self.by-version."jsonfile"."1.0.1";
  by-version."jsonfile"."1.0.1" = self.buildNodePackage {
    name = "jsonfile-1.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/jsonfile/-/jsonfile-1.0.1.tgz";
      name = "jsonfile-1.0.1.tgz";
      sha1 = "ea5efe40b83690b98667614a7392fc60e842c0dd";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."jsonify"."~0.0.0" =
    self.by-version."jsonify"."0.0.0";
  by-version."jsonify"."0.0.0" = self.buildNodePackage {
    name = "jsonify-0.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/jsonify/-/jsonify-0.0.0.tgz";
      name = "jsonify-0.0.0.tgz";
      sha1 = "2c74b6ee41d93ca51b7b5aaee8f503631d252a73";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."junk"."~1.0.0" =
    self.by-version."junk"."1.0.0";
  by-version."junk"."1.0.0" = self.buildNodePackage {
    name = "junk-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/junk/-/junk-1.0.0.tgz";
      name = "junk-1.0.0.tgz";
      sha1 = "22b05ee710f40c44f82fb260602ffecd489223b8";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."latest-version"."^0.2.0" =
    self.by-version."latest-version"."0.2.0";
  by-version."latest-version"."0.2.0" = self.buildNodePackage {
    name = "latest-version-0.2.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/latest-version/-/latest-version-0.2.0.tgz";
      name = "latest-version-0.2.0.tgz";
      sha1 = "adaf898d5f22380d3f9c45386efdff0a1b5b7501";
    };
    deps = {
      "package-json-0.2.0" = self.by-version."package-json"."0.2.0";
    };
    peerDependencies = [];
  };
  by-spec."lockfile"."~1.0.0" =
    self.by-version."lockfile"."1.0.0";
  by-version."lockfile"."1.0.0" = self.buildNodePackage {
    name = "lockfile-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lockfile/-/lockfile-1.0.0.tgz";
      name = "lockfile-1.0.0.tgz";
      sha1 = "b3a7609dda6012060083bacb0ab0ecbca58e9203";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."lodash"."~2.4.1" =
    self.by-version."lodash"."2.4.1";
  by-version."lodash"."2.4.1" = self.buildNodePackage {
    name = "lodash-2.4.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash/-/lodash-2.4.1.tgz";
      name = "lodash-2.4.1.tgz";
      sha1 = "5b7723034dda4d262e5a46fb2c58d7cc22f71420";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."lodash._basetostring"."^3.0.0" =
    self.by-version."lodash._basetostring"."3.0.0";
  by-version."lodash._basetostring"."3.0.0" = self.buildNodePackage {
    name = "lodash._basetostring-3.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash._basetostring/-/lodash._basetostring-3.0.0.tgz";
      name = "lodash._basetostring-3.0.0.tgz";
      sha1 = "75a9a4aaaa2b2a8761111ff5431e7d83c1daf0e2";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."lodash._createpad"."^3.0.0" =
    self.by-version."lodash._createpad"."3.0.1";
  by-version."lodash._createpad"."3.0.1" = self.buildNodePackage {
    name = "lodash._createpad-3.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash._createpad/-/lodash._createpad-3.0.1.tgz";
      name = "lodash._createpad-3.0.1.tgz";
      sha1 = "90c6bdbc84c48edfa026896e31856b1a0ec50842";
    };
    deps = {
      "lodash.repeat-3.0.0" = self.by-version."lodash.repeat"."3.0.0";
    };
    peerDependencies = [];
  };
  by-spec."lodash._isnative"."~2.4.1" =
    self.by-version."lodash._isnative"."2.4.1";
  by-version."lodash._isnative"."2.4.1" = self.buildNodePackage {
    name = "lodash._isnative-2.4.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash._isnative/-/lodash._isnative-2.4.1.tgz";
      name = "lodash._isnative-2.4.1.tgz";
      sha1 = "3ea6404b784a7be836c7b57580e1cdf79b14832c";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."lodash._objecttypes"."~2.4.1" =
    self.by-version."lodash._objecttypes"."2.4.1";
  by-version."lodash._objecttypes"."2.4.1" = self.buildNodePackage {
    name = "lodash._objecttypes-2.4.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash._objecttypes/-/lodash._objecttypes-2.4.1.tgz";
      name = "lodash._objecttypes-2.4.1.tgz";
      sha1 = "7c0b7f69d98a1f76529f890b0cdb1b4dfec11c11";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."lodash.debounce"."^2.4.1" =
    self.by-version."lodash.debounce"."2.4.1";
  by-version."lodash.debounce"."2.4.1" = self.buildNodePackage {
    name = "lodash.debounce-2.4.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash.debounce/-/lodash.debounce-2.4.1.tgz";
      name = "lodash.debounce-2.4.1.tgz";
      sha1 = "d8cead246ec4b926e8b85678fc396bfeba8cc6fc";
    };
    deps = {
      "lodash.isfunction-2.4.1" = self.by-version."lodash.isfunction"."2.4.1";
      "lodash.isobject-2.4.1" = self.by-version."lodash.isobject"."2.4.1";
      "lodash.now-2.4.1" = self.by-version."lodash.now"."2.4.1";
    };
    peerDependencies = [];
  };
  by-spec."lodash.isfunction"."~2.4.1" =
    self.by-version."lodash.isfunction"."2.4.1";
  by-version."lodash.isfunction"."2.4.1" = self.buildNodePackage {
    name = "lodash.isfunction-2.4.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash.isfunction/-/lodash.isfunction-2.4.1.tgz";
      name = "lodash.isfunction-2.4.1.tgz";
      sha1 = "2cfd575c73e498ab57e319b77fa02adef13a94d1";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."lodash.isobject"."~2.4.1" =
    self.by-version."lodash.isobject"."2.4.1";
  by-version."lodash.isobject"."2.4.1" = self.buildNodePackage {
    name = "lodash.isobject-2.4.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash.isobject/-/lodash.isobject-2.4.1.tgz";
      name = "lodash.isobject-2.4.1.tgz";
      sha1 = "5a2e47fe69953f1ee631a7eba1fe64d2d06558f5";
    };
    deps = {
      "lodash._objecttypes-2.4.1" = self.by-version."lodash._objecttypes"."2.4.1";
    };
    peerDependencies = [];
  };
  by-spec."lodash.now"."~2.4.1" =
    self.by-version."lodash.now"."2.4.1";
  by-version."lodash.now"."2.4.1" = self.buildNodePackage {
    name = "lodash.now-2.4.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash.now/-/lodash.now-2.4.1.tgz";
      name = "lodash.now-2.4.1.tgz";
      sha1 = "6872156500525185faf96785bb7fe7fe15b562c6";
    };
    deps = {
      "lodash._isnative-2.4.1" = self.by-version."lodash._isnative"."2.4.1";
    };
    peerDependencies = [];
  };
  by-spec."lodash.pad"."^3.0.0" =
    self.by-version."lodash.pad"."3.0.0";
  by-version."lodash.pad"."3.0.0" = self.buildNodePackage {
    name = "lodash.pad-3.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash.pad/-/lodash.pad-3.0.0.tgz";
      name = "lodash.pad-3.0.0.tgz";
      sha1 = "1824e4756a3504b3af7b7a5b9d1f7501b43b2c25";
    };
    deps = {
      "lodash._basetostring-3.0.0" = self.by-version."lodash._basetostring"."3.0.0";
      "lodash._createpad-3.0.1" = self.by-version."lodash._createpad"."3.0.1";
    };
    peerDependencies = [];
  };
  by-spec."lodash.padleft"."^3.0.0" =
    self.by-version."lodash.padleft"."3.0.0";
  by-version."lodash.padleft"."3.0.0" = self.buildNodePackage {
    name = "lodash.padleft-3.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash.padleft/-/lodash.padleft-3.0.0.tgz";
      name = "lodash.padleft-3.0.0.tgz";
      sha1 = "448ac9e28ceb15d0ce9ae8e59dc9311ad17b4390";
    };
    deps = {
      "lodash._basetostring-3.0.0" = self.by-version."lodash._basetostring"."3.0.0";
      "lodash._createpad-3.0.1" = self.by-version."lodash._createpad"."3.0.1";
    };
    peerDependencies = [];
  };
  by-spec."lodash.padright"."^3.0.0" =
    self.by-version."lodash.padright"."3.0.0";
  by-version."lodash.padright"."3.0.0" = self.buildNodePackage {
    name = "lodash.padright-3.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash.padright/-/lodash.padright-3.0.0.tgz";
      name = "lodash.padright-3.0.0.tgz";
      sha1 = "caf2c8222c36d448fe0407b028630e6c5d1b06c6";
    };
    deps = {
      "lodash._basetostring-3.0.0" = self.by-version."lodash._basetostring"."3.0.0";
      "lodash._createpad-3.0.1" = self.by-version."lodash._createpad"."3.0.1";
    };
    peerDependencies = [];
  };
  by-spec."lodash.repeat"."^3.0.0" =
    self.by-version."lodash.repeat"."3.0.0";
  by-version."lodash.repeat"."3.0.0" = self.buildNodePackage {
    name = "lodash.repeat-3.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash.repeat/-/lodash.repeat-3.0.0.tgz";
      name = "lodash.repeat-3.0.0.tgz";
      sha1 = "c340f4136c99dc5b2e397b3fd50cffbd172a94b0";
    };
    deps = {
      "lodash._basetostring-3.0.0" = self.by-version."lodash._basetostring"."3.0.0";
    };
    peerDependencies = [];
  };
  by-spec."lru-cache"."2" =
    self.by-version."lru-cache"."2.5.0";
  by-version."lru-cache"."2.5.0" = self.buildNodePackage {
    name = "lru-cache-2.5.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lru-cache/-/lru-cache-2.5.0.tgz";
      name = "lru-cache-2.5.0.tgz";
      sha1 = "d82388ae9c960becbea0c73bb9eb79b6c6ce9aeb";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."lru-cache"."~2.3.0" =
    self.by-version."lru-cache"."2.3.1";
  by-version."lru-cache"."2.3.1" = self.buildNodePackage {
    name = "lru-cache-2.3.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lru-cache/-/lru-cache-2.3.1.tgz";
      name = "lru-cache-2.3.1.tgz";
      sha1 = "b3adf6b3d856e954e2c390e6cef22081245a53d6";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."lru-cache"."~2.5.0" =
    self.by-version."lru-cache"."2.5.0";
  by-spec."lru-queue"."0.1" =
    self.by-version."lru-queue"."0.1.0";
  by-version."lru-queue"."0.1.0" = self.buildNodePackage {
    name = "lru-queue-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lru-queue/-/lru-queue-0.1.0.tgz";
      name = "lru-queue-0.1.0.tgz";
      sha1 = "2738bd9f0d3cf4f84490c5736c48699ac632cda3";
    };
    deps = {
      "es5-ext-0.10.6" = self.by-version."es5-ext"."0.10.6";
    };
    peerDependencies = [];
  };
  by-spec."memoizee"."0.3.x" =
    self.by-version."memoizee"."0.3.8";
  by-version."memoizee"."0.3.8" = self.buildNodePackage {
    name = "memoizee-0.3.8";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/memoizee/-/memoizee-0.3.8.tgz";
      name = "memoizee-0.3.8.tgz";
      sha1 = "b5faf419f02fafe3c2cc1cf5d3907c210fc7efdc";
    };
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.6" = self.by-version."es5-ext"."0.10.6";
      "es6-weak-map-0.1.2" = self.by-version."es6-weak-map"."0.1.2";
      "event-emitter-0.3.3" = self.by-version."event-emitter"."0.3.3";
      "lru-queue-0.1.0" = self.by-version."lru-queue"."0.1.0";
      "next-tick-0.2.2" = self.by-version."next-tick"."0.2.2";
      "timers-ext-0.1.0" = self.by-version."timers-ext"."0.1.0";
    };
    peerDependencies = [];
  };
  by-spec."mime"."~1.2.11" =
    self.by-version."mime"."1.2.11";
  by-version."mime"."1.2.11" = self.buildNodePackage {
    name = "mime-1.2.11";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mime/-/mime-1.2.11.tgz";
      name = "mime-1.2.11.tgz";
      sha1 = "58203eed86e3a5ef17aed2b7d9ebd47f0a60dd10";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."mime-db"."~1.7.0" =
    self.by-version."mime-db"."1.7.0";
  by-version."mime-db"."1.7.0" = self.buildNodePackage {
    name = "mime-db-1.7.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mime-db/-/mime-db-1.7.0.tgz";
      name = "mime-db-1.7.0.tgz";
      sha1 = "36cf66a6c52ea71827bde287f77c254f5ef1b8d3";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."mime-types"."~1.0.1" =
    self.by-version."mime-types"."1.0.2";
  by-version."mime-types"."1.0.2" = self.buildNodePackage {
    name = "mime-types-1.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mime-types/-/mime-types-1.0.2.tgz";
      name = "mime-types-1.0.2.tgz";
      sha1 = "995ae1392ab8affcbfcb2641dd054e943c0d5dce";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."mime-types"."~2.0.1" =
    self.by-version."mime-types"."2.0.9";
  by-version."mime-types"."2.0.9" = self.buildNodePackage {
    name = "mime-types-2.0.9";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mime-types/-/mime-types-2.0.9.tgz";
      name = "mime-types-2.0.9.tgz";
      sha1 = "e8449aff27b1245ddc6641b524439ae80c4b78a6";
    };
    deps = {
      "mime-db-1.7.0" = self.by-version."mime-db"."1.7.0";
    };
    peerDependencies = [];
  };
  by-spec."mime-types"."~2.0.3" =
    self.by-version."mime-types"."2.0.9";
  by-spec."minimatch"."0.3" =
    self.by-version."minimatch"."0.3.0";
  by-version."minimatch"."0.3.0" = self.buildNodePackage {
    name = "minimatch-0.3.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/minimatch/-/minimatch-0.3.0.tgz";
      name = "minimatch-0.3.0.tgz";
      sha1 = "275d8edaac4f1bb3326472089e7949c8394699dd";
    };
    deps = {
      "lru-cache-2.5.0" = self.by-version."lru-cache"."2.5.0";
      "sigmund-1.0.0" = self.by-version."sigmund"."1.0.0";
    };
    peerDependencies = [];
  };
  by-spec."minimatch"."^1.0.0" =
    self.by-version."minimatch"."1.0.0";
  by-version."minimatch"."1.0.0" = self.buildNodePackage {
    name = "minimatch-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/minimatch/-/minimatch-1.0.0.tgz";
      name = "minimatch-1.0.0.tgz";
      sha1 = "e0dd2120b49e1b724ce8d714c520822a9438576d";
    };
    deps = {
      "lru-cache-2.5.0" = self.by-version."lru-cache"."2.5.0";
      "sigmund-1.0.0" = self.by-version."sigmund"."1.0.0";
    };
    peerDependencies = [];
  };
  by-spec."minimatch"."^2.0.1" =
    self.by-version."minimatch"."2.0.1";
  by-version."minimatch"."2.0.1" = self.buildNodePackage {
    name = "minimatch-2.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/minimatch/-/minimatch-2.0.1.tgz";
      name = "minimatch-2.0.1.tgz";
      sha1 = "6c3760b45f66ed1cd5803143ee8d372488f02c37";
    };
    deps = {
      "brace-expansion-1.1.0" = self.by-version."brace-expansion"."1.1.0";
    };
    peerDependencies = [];
  };
  by-spec."minimist"."0.0.8" =
    self.by-version."minimist"."0.0.8";
  by-version."minimist"."0.0.8" = self.buildNodePackage {
    name = "minimist-0.0.8";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/minimist/-/minimist-0.0.8.tgz";
      name = "minimist-0.0.8.tgz";
      sha1 = "857fcabfc3397d2625b8228262e86aa7a011b05d";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."minimist"."^1.1.0" =
    self.by-version."minimist"."1.1.0";
  by-version."minimist"."1.1.0" = self.buildNodePackage {
    name = "minimist-1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/minimist/-/minimist-1.1.0.tgz";
      name = "minimist-1.1.0.tgz";
      sha1 = "cdf225e8898f840a258ded44fc91776770afdc93";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."minimist"."~0.0.1" =
    self.by-version."minimist"."0.0.10";
  by-version."minimist"."0.0.10" = self.buildNodePackage {
    name = "minimist-0.0.10";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/minimist/-/minimist-0.0.10.tgz";
      name = "minimist-0.0.10.tgz";
      sha1 = "de3f98543dbf96082be48ad1a0c7cda836301dcf";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."mkdirp"."0.3.x" =
    self.by-version."mkdirp"."0.3.5";
  by-version."mkdirp"."0.3.5" = self.buildNodePackage {
    name = "mkdirp-0.3.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mkdirp/-/mkdirp-0.3.5.tgz";
      name = "mkdirp-0.3.5.tgz";
      sha1 = "de3e5f8961c88c787ee1368df849ac4413eca8d7";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."mkdirp"."0.5" =
    self.by-version."mkdirp"."0.5.0";
  by-version."mkdirp"."0.5.0" = self.buildNodePackage {
    name = "mkdirp-0.5.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/mkdirp/-/mkdirp-0.5.0.tgz";
      name = "mkdirp-0.5.0.tgz";
      sha1 = "1d73076a6df986cd9344e15e71fcc05a4c9abf12";
    };
    deps = {
      "minimist-0.0.8" = self.by-version."minimist"."0.0.8";
    };
    peerDependencies = [];
  };
  by-spec."mkdirp"."0.5.0" =
    self.by-version."mkdirp"."0.5.0";
  by-spec."mkdirp".">=0.5 0" =
    self.by-version."mkdirp"."0.5.0";
  by-spec."mkdirp"."^0.5.0" =
    self.by-version."mkdirp"."0.5.0";
  by-spec."mkdirp"."~0.3.3" =
    self.by-version."mkdirp"."0.3.5";
  by-spec."mkdirp"."~0.3.5" =
    self.by-version."mkdirp"."0.3.5";
  by-spec."mkpath"."~0.1.0" =
    self.by-version."mkpath"."0.1.0";
  by-version."mkpath"."0.1.0" = self.buildNodePackage {
    name = "mkpath-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mkpath/-/mkpath-0.1.0.tgz";
      name = "mkpath-0.1.0.tgz";
      sha1 = "7554a6f8d871834cc97b5462b122c4c124d6de91";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."mout"."~0.9.0" =
    self.by-version."mout"."0.9.1";
  by-version."mout"."0.9.1" = self.buildNodePackage {
    name = "mout-0.9.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mout/-/mout-0.9.1.tgz";
      name = "mout-0.9.1.tgz";
      sha1 = "84f0f3fd6acc7317f63de2affdcc0cee009b0477";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."mute-stream"."0.0.4" =
    self.by-version."mute-stream"."0.0.4";
  by-version."mute-stream"."0.0.4" = self.buildNodePackage {
    name = "mute-stream-0.0.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mute-stream/-/mute-stream-0.0.4.tgz";
      name = "mute-stream-0.0.4.tgz";
      sha1 = "a9219960a6d5d5d046597aee51252c6655f7177e";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."mute-stream"."~0.0.4" =
    self.by-version."mute-stream"."0.0.4";
  by-spec."ncp"."~0.4.2" =
    self.by-version."ncp"."0.4.2";
  by-version."ncp"."0.4.2" = self.buildNodePackage {
    name = "ncp-0.4.2";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/ncp/-/ncp-0.4.2.tgz";
      name = "ncp-0.4.2.tgz";
      sha1 = "abcc6cbd3ec2ed2a729ff6e7c1fa8f01784a8574";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."next-tick"."~0.2.2" =
    self.by-version."next-tick"."0.2.2";
  by-version."next-tick"."0.2.2" = self.buildNodePackage {
    name = "next-tick-0.2.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/next-tick/-/next-tick-0.2.2.tgz";
      name = "next-tick-0.2.2.tgz";
      sha1 = "75da4a927ee5887e39065880065b7336413b310d";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."node-uuid"."~1.4.0" =
    self.by-version."node-uuid"."1.4.2";
  by-version."node-uuid"."1.4.2" = self.buildNodePackage {
    name = "node-uuid-1.4.2";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/node-uuid/-/node-uuid-1.4.2.tgz";
      name = "node-uuid-1.4.2.tgz";
      sha1 = "907db3d11b7b6a2cf4f905fb7199f14ae7379ba0";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."nopt"."2" =
    self.by-version."nopt"."2.2.1";
  by-version."nopt"."2.2.1" = self.buildNodePackage {
    name = "nopt-2.2.1";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/nopt/-/nopt-2.2.1.tgz";
      name = "nopt-2.2.1.tgz";
      sha1 = "2aa09b7d1768487b3b89a9c5aa52335bff0baea7";
    };
    deps = {
      "abbrev-1.0.5" = self.by-version."abbrev"."1.0.5";
    };
    peerDependencies = [];
  };
  by-spec."nopt"."~1.0.10" =
    self.by-version."nopt"."1.0.10";
  by-version."nopt"."1.0.10" = self.buildNodePackage {
    name = "nopt-1.0.10";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/nopt/-/nopt-1.0.10.tgz";
      name = "nopt-1.0.10.tgz";
      sha1 = "6ddd21bd2a31417b92727dd585f8a6f37608ebee";
    };
    deps = {
      "abbrev-1.0.5" = self.by-version."abbrev"."1.0.5";
    };
    peerDependencies = [];
  };
  by-spec."nopt"."~2.2.0" =
    self.by-version."nopt"."2.2.1";
  by-spec."nopt"."~3.0.0" =
    self.by-version."nopt"."3.0.1";
  by-version."nopt"."3.0.1" = self.buildNodePackage {
    name = "nopt-3.0.1";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/nopt/-/nopt-3.0.1.tgz";
      name = "nopt-3.0.1.tgz";
      sha1 = "bce5c42446a3291f47622a370abbf158fbbacbfd";
    };
    deps = {
      "abbrev-1.0.5" = self.by-version."abbrev"."1.0.5";
    };
    peerDependencies = [];
  };
  by-spec."nopt"."~3.0.1" =
    self.by-version."nopt"."3.0.1";
  by-spec."npm-registry-client"."0.2.27" =
    self.by-version."npm-registry-client"."0.2.27";
  by-version."npm-registry-client"."0.2.27" = self.buildNodePackage {
    name = "npm-registry-client-0.2.27";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/npm-registry-client/-/npm-registry-client-0.2.27.tgz";
      name = "npm-registry-client-0.2.27.tgz";
      sha1 = "8f338189d32769267886a07ad7b7fd2267446adf";
    };
    deps = {
      "request-2.53.0" = self.by-version."request"."2.53.0";
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "semver-2.0.11" = self.by-version."semver"."2.0.11";
      "slide-1.1.6" = self.by-version."slide"."1.1.6";
      "chownr-0.0.1" = self.by-version."chownr"."0.0.1";
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
      "retry-0.6.0" = self.by-version."retry"."0.6.0";
      "couch-login-0.1.20" = self.by-version."couch-login"."0.1.20";
      "npmlog-1.1.0" = self.by-version."npmlog"."1.1.0";
    };
    peerDependencies = [];
  };
  by-spec."npm2nix"."*" =
    self.by-version."npm2nix"."5.8.1";
  by-version."npm2nix"."5.8.1" = self.buildNodePackage {
    name = "npm2nix-5.8.1";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/npm2nix/-/npm2nix-5.8.1.tgz";
      name = "npm2nix-5.8.1.tgz";
      sha1 = "0d8356b458caaa677b4a1225fea4900f2995982f";
    };
    deps = {
      "semver-2.3.2" = self.by-version."semver"."2.3.2";
      "argparse-0.1.15" = self.by-version."argparse"."0.1.15";
      "npm-registry-client-0.2.27" = self.by-version."npm-registry-client"."0.2.27";
      "npmconf-0.1.1" = self.by-version."npmconf"."0.1.1";
      "tar-0.1.17" = self.by-version."tar"."0.1.17";
      "temp-0.6.0" = self.by-version."temp"."0.6.0";
      "fs.extra-1.3.2" = self.by-version."fs.extra"."1.3.2";
      "findit-1.2.0" = self.by-version."findit"."1.2.0";
    };
    peerDependencies = [];
  };
  "npm2nix" = self.by-version."npm2nix"."5.8.1";
  by-spec."npmconf"."0.1.1" =
    self.by-version."npmconf"."0.1.1";
  by-version."npmconf"."0.1.1" = self.buildNodePackage {
    name = "npmconf-0.1.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/npmconf/-/npmconf-0.1.1.tgz";
      name = "npmconf-0.1.1.tgz";
      sha1 = "7a254182591ca22d77b2faecc0d17e0f9bdf25a1";
    };
    deps = {
      "config-chain-1.1.8" = self.by-version."config-chain"."1.1.8";
      "inherits-1.0.0" = self.by-version."inherits"."1.0.0";
      "once-1.1.1" = self.by-version."once"."1.1.1";
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
      "osenv-0.0.3" = self.by-version."osenv"."0.0.3";
      "nopt-2.2.1" = self.by-version."nopt"."2.2.1";
      "semver-2.3.2" = self.by-version."semver"."2.3.2";
      "ini-1.1.0" = self.by-version."ini"."1.1.0";
    };
    peerDependencies = [];
  };
  by-spec."npmconf"."^2.0.1" =
    self.by-version."npmconf"."2.1.1";
  by-version."npmconf"."2.1.1" = self.buildNodePackage {
    name = "npmconf-2.1.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/npmconf/-/npmconf-2.1.1.tgz";
      name = "npmconf-2.1.1.tgz";
      sha1 = "a266c7e5c56695eb7f55caf3a5a7328f24510dae";
    };
    deps = {
      "config-chain-1.1.8" = self.by-version."config-chain"."1.1.8";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "ini-1.3.3" = self.by-version."ini"."1.3.3";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "nopt-3.0.1" = self.by-version."nopt"."3.0.1";
      "once-1.3.1" = self.by-version."once"."1.3.1";
      "osenv-0.1.0" = self.by-version."osenv"."0.1.0";
      "semver-4.3.0" = self.by-version."semver"."4.3.0";
      "uid-number-0.0.5" = self.by-version."uid-number"."0.0.5";
    };
    peerDependencies = [];
  };
  by-spec."npmlog"."*" =
    self.by-version."npmlog"."1.1.0";
  by-version."npmlog"."1.1.0" = self.buildNodePackage {
    name = "npmlog-1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/npmlog/-/npmlog-1.1.0.tgz";
      name = "npmlog-1.1.0.tgz";
      sha1 = "8744168148df1ce3f3387c0bc38154883b4af5f4";
    };
    deps = {
      "ansi-0.3.0" = self.by-version."ansi"."0.3.0";
      "are-we-there-yet-1.0.2" = self.by-version."are-we-there-yet"."1.0.2";
      "gauge-1.1.0" = self.by-version."gauge"."1.1.0";
    };
    peerDependencies = [];
  };
  by-spec."oauth-sign"."~0.4.0" =
    self.by-version."oauth-sign"."0.4.0";
  by-version."oauth-sign"."0.4.0" = self.buildNodePackage {
    name = "oauth-sign-0.4.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/oauth-sign/-/oauth-sign-0.4.0.tgz";
      name = "oauth-sign-0.4.0.tgz";
      sha1 = "f22956f31ea7151a821e5f2fb32c113cad8b9f69";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."oauth-sign"."~0.5.0" =
    self.by-version."oauth-sign"."0.5.0";
  by-version."oauth-sign"."0.5.0" = self.buildNodePackage {
    name = "oauth-sign-0.5.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/oauth-sign/-/oauth-sign-0.5.0.tgz";
      name = "oauth-sign-0.5.0.tgz";
      sha1 = "d767f5169325620eab2e087ef0c472e773db6461";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."oauth-sign"."~0.6.0" =
    self.by-version."oauth-sign"."0.6.0";
  by-version."oauth-sign"."0.6.0" = self.buildNodePackage {
    name = "oauth-sign-0.6.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/oauth-sign/-/oauth-sign-0.6.0.tgz";
      name = "oauth-sign-0.6.0.tgz";
      sha1 = "7dbeae44f6ca454e1f168451d630746735813ce3";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."object-assign"."^0.3.0" =
    self.by-version."object-assign"."0.3.1";
  by-version."object-assign"."0.3.1" = self.buildNodePackage {
    name = "object-assign-0.3.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/object-assign/-/object-assign-0.3.1.tgz";
      name = "object-assign-0.3.1.tgz";
      sha1 = "060e2a2a27d7c0d77ec77b78f11aa47fd88008d2";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."object-assign"."^1.0.0" =
    self.by-version."object-assign"."1.0.0";
  by-version."object-assign"."1.0.0" = self.buildNodePackage {
    name = "object-assign-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/object-assign/-/object-assign-1.0.0.tgz";
      name = "object-assign-1.0.0.tgz";
      sha1 = "e65dc8766d3b47b4b8307465c8311da030b070a6";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."object-assign"."^2.0.0" =
    self.by-version."object-assign"."2.0.0";
  by-version."object-assign"."2.0.0" = self.buildNodePackage {
    name = "object-assign-2.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/object-assign/-/object-assign-2.0.0.tgz";
      name = "object-assign-2.0.0.tgz";
      sha1 = "f8309b09083b01261ece3ef7373f2b57b8dd7042";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."once"."^1.3.0" =
    self.by-version."once"."1.3.1";
  by-version."once"."1.3.1" = self.buildNodePackage {
    name = "once-1.3.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/once/-/once-1.3.1.tgz";
      name = "once-1.3.1.tgz";
      sha1 = "f3f3e4da5b7d27b5c732969ee3e67e729457b31f";
    };
    deps = {
      "wrappy-1.0.1" = self.by-version."wrappy"."1.0.1";
    };
    peerDependencies = [];
  };
  by-spec."once"."~1.1.1" =
    self.by-version."once"."1.1.1";
  by-version."once"."1.1.1" = self.buildNodePackage {
    name = "once-1.1.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/once/-/once-1.1.1.tgz";
      name = "once-1.1.1.tgz";
      sha1 = "9db574933ccb08c3a7614d154032c09ea6f339e7";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."once"."~1.2.0" =
    self.by-version."once"."1.2.0";
  by-version."once"."1.2.0" = self.buildNodePackage {
    name = "once-1.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/once/-/once-1.2.0.tgz";
      name = "once-1.2.0.tgz";
      sha1 = "de1905c636af874a8fba862d9aabddd1f920461c";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."once"."~1.3.0" =
    self.by-version."once"."1.3.1";
  by-spec."opn"."~1.0.0" =
    self.by-version."opn"."1.0.1";
  by-version."opn"."1.0.1" = self.buildNodePackage {
    name = "opn-1.0.1";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/opn/-/opn-1.0.1.tgz";
      name = "opn-1.0.1.tgz";
      sha1 = "c2dce2a5c41ab9589a7486aaff4d8de002d041ca";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."optimist"."~0.3" =
    self.by-version."optimist"."0.3.7";
  by-version."optimist"."0.3.7" = self.buildNodePackage {
    name = "optimist-0.3.7";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/optimist/-/optimist-0.3.7.tgz";
      name = "optimist-0.3.7.tgz";
      sha1 = "c90941ad59e4273328923074d2cf2e7cbc6ec0d9";
    };
    deps = {
      "wordwrap-0.0.2" = self.by-version."wordwrap"."0.0.2";
    };
    peerDependencies = [];
  };
  by-spec."optimist"."~0.3.5" =
    self.by-version."optimist"."0.3.7";
  by-spec."optimist"."~0.6.0" =
    self.by-version."optimist"."0.6.1";
  by-version."optimist"."0.6.1" = self.buildNodePackage {
    name = "optimist-0.6.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/optimist/-/optimist-0.6.1.tgz";
      name = "optimist-0.6.1.tgz";
      sha1 = "da3ea74686fa21a19a111c326e90eb15a0196686";
    };
    deps = {
      "wordwrap-0.0.2" = self.by-version."wordwrap"."0.0.2";
      "minimist-0.0.10" = self.by-version."minimist"."0.0.10";
    };
    peerDependencies = [];
  };
  by-spec."os-name"."^1.0.0" =
    self.by-version."os-name"."1.0.3";
  by-version."os-name"."1.0.3" = self.buildNodePackage {
    name = "os-name-1.0.3";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/os-name/-/os-name-1.0.3.tgz";
      name = "os-name-1.0.3.tgz";
      sha1 = "1b379f64835af7c5a7f498b357cb95215c159edf";
    };
    deps = {
      "osx-release-1.0.0" = self.by-version."osx-release"."1.0.0";
      "win-release-1.0.0" = self.by-version."win-release"."1.0.0";
    };
    peerDependencies = [];
  };
  by-spec."osenv"."0.0.3" =
    self.by-version."osenv"."0.0.3";
  by-version."osenv"."0.0.3" = self.buildNodePackage {
    name = "osenv-0.0.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/osenv/-/osenv-0.0.3.tgz";
      name = "osenv-0.0.3.tgz";
      sha1 = "cd6ad8ddb290915ad9e22765576025d411f29cb6";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."osenv"."0.1.0" =
    self.by-version."osenv"."0.1.0";
  by-version."osenv"."0.1.0" = self.buildNodePackage {
    name = "osenv-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/osenv/-/osenv-0.1.0.tgz";
      name = "osenv-0.1.0.tgz";
      sha1 = "61668121eec584955030b9f470b1d2309504bfcb";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."osenv"."^0.1.0" =
    self.by-version."osenv"."0.1.0";
  by-spec."osx-release"."^1.0.0" =
    self.by-version."osx-release"."1.0.0";
  by-version."osx-release"."1.0.0" = self.buildNodePackage {
    name = "osx-release-1.0.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/osx-release/-/osx-release-1.0.0.tgz";
      name = "osx-release-1.0.0.tgz";
      sha1 = "02bee80f3b898aaa88922d2f86e178605974beac";
    };
    deps = {
      "minimist-1.1.0" = self.by-version."minimist"."1.1.0";
    };
    peerDependencies = [];
  };
  by-spec."p-throttler"."0.1.0" =
    self.by-version."p-throttler"."0.1.0";
  by-version."p-throttler"."0.1.0" = self.buildNodePackage {
    name = "p-throttler-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/p-throttler/-/p-throttler-0.1.0.tgz";
      name = "p-throttler-0.1.0.tgz";
      sha1 = "1b16907942c333e6f1ddeabcb3479204b8c417c4";
    };
    deps = {
      "q-0.9.7" = self.by-version."q"."0.9.7";
    };
    peerDependencies = [];
  };
  by-spec."package-json"."^0.2.0" =
    self.by-version."package-json"."0.2.0";
  by-version."package-json"."0.2.0" = self.buildNodePackage {
    name = "package-json-0.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/package-json/-/package-json-0.2.0.tgz";
      name = "package-json-0.2.0.tgz";
      sha1 = "0316e177b8eb149985d34f706b4a5543b274bec5";
    };
    deps = {
      "got-0.3.0" = self.by-version."got"."0.3.0";
      "registry-url-0.1.1" = self.by-version."registry-url"."0.1.1";
    };
    peerDependencies = [];
  };
  by-spec."promptly"."0.2.0" =
    self.by-version."promptly"."0.2.0";
  by-version."promptly"."0.2.0" = self.buildNodePackage {
    name = "promptly-0.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/promptly/-/promptly-0.2.0.tgz";
      name = "promptly-0.2.0.tgz";
      sha1 = "73ef200fa8329d5d3a8df41798950b8646ca46d9";
    };
    deps = {
      "read-1.0.5" = self.by-version."read"."1.0.5";
    };
    peerDependencies = [];
  };
  by-spec."proto-list"."~1.2.1" =
    self.by-version."proto-list"."1.2.3";
  by-version."proto-list"."1.2.3" = self.buildNodePackage {
    name = "proto-list-1.2.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/proto-list/-/proto-list-1.2.3.tgz";
      name = "proto-list-1.2.3.tgz";
      sha1 = "6235554a1bca1f0d15e3ca12ca7329d5def42bd9";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."pump"."^0.3.5" =
    self.by-version."pump"."0.3.5";
  by-version."pump"."0.3.5" = self.buildNodePackage {
    name = "pump-0.3.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/pump/-/pump-0.3.5.tgz";
      name = "pump-0.3.5.tgz";
      sha1 = "ae5ff8c1f93ed87adc6530a97565b126f585454b";
    };
    deps = {
      "once-1.2.0" = self.by-version."once"."1.2.0";
      "end-of-stream-1.0.0" = self.by-version."end-of-stream"."1.0.0";
    };
    peerDependencies = [];
  };
  by-spec."punycode".">=0.2.0" =
    self.by-version."punycode"."1.3.2";
  by-version."punycode"."1.3.2" = self.buildNodePackage {
    name = "punycode-1.3.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/punycode/-/punycode-1.3.2.tgz";
      name = "punycode-1.3.2.tgz";
      sha1 = "9653a036fb7c1ee42342f2325cceefea3926c48d";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."q"."~0.9.2" =
    self.by-version."q"."0.9.7";
  by-version."q"."0.9.7" = self.buildNodePackage {
    name = "q-0.9.7";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/q/-/q-0.9.7.tgz";
      name = "q-0.9.7.tgz";
      sha1 = "4de2e6cb3b29088c9e4cbc03bf9d42fb96ce2f75";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."q"."~1.0.0" =
    self.by-version."q"."1.0.1";
  by-version."q"."1.0.1" = self.buildNodePackage {
    name = "q-1.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/q/-/q-1.0.1.tgz";
      name = "q-1.0.1.tgz";
      sha1 = "11872aeedee89268110b10a718448ffb10112a14";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."q"."~1.0.1" =
    self.by-version."q"."1.0.1";
  by-spec."qs"."~1.2.0" =
    self.by-version."qs"."1.2.2";
  by-version."qs"."1.2.2" = self.buildNodePackage {
    name = "qs-1.2.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/qs/-/qs-1.2.2.tgz";
      name = "qs-1.2.2.tgz";
      sha1 = "19b57ff24dc2a99ce1f8bdf6afcda59f8ef61f88";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."qs"."~2.3.1" =
    self.by-version."qs"."2.3.3";
  by-version."qs"."2.3.3" = self.buildNodePackage {
    name = "qs-2.3.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/qs/-/qs-2.3.3.tgz";
      name = "qs-2.3.3.tgz";
      sha1 = "e9e85adbe75da0bbe4c8e0476a086290f863b404";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."read"."~1.0.4" =
    self.by-version."read"."1.0.5";
  by-version."read"."1.0.5" = self.buildNodePackage {
    name = "read-1.0.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/read/-/read-1.0.5.tgz";
      name = "read-1.0.5.tgz";
      sha1 = "007a3d169478aa710a491727e453effb92e76203";
    };
    deps = {
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
    };
    peerDependencies = [];
  };
  by-spec."readable-stream"."^1.0.27-1" =
    self.by-version."readable-stream"."1.1.13";
  by-version."readable-stream"."1.1.13" = self.buildNodePackage {
    name = "readable-stream-1.1.13";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/readable-stream/-/readable-stream-1.1.13.tgz";
      name = "readable-stream-1.1.13.tgz";
      sha1 = "f6eef764f514c89e2b9e23146a75ba106756d23e";
    };
    deps = {
      "core-util-is-1.0.1" = self.by-version."core-util-is"."1.0.1";
      "isarray-0.0.1" = self.by-version."isarray"."0.0.1";
      "string_decoder-0.10.31" = self.by-version."string_decoder"."0.10.31";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    peerDependencies = [];
  };
  by-spec."readable-stream"."~1.0.26" =
    self.by-version."readable-stream"."1.0.33";
  by-version."readable-stream"."1.0.33" = self.buildNodePackage {
    name = "readable-stream-1.0.33";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/readable-stream/-/readable-stream-1.0.33.tgz";
      name = "readable-stream-1.0.33.tgz";
      sha1 = "3a360dd66c1b1d7fd4705389860eda1d0f61126c";
    };
    deps = {
      "core-util-is-1.0.1" = self.by-version."core-util-is"."1.0.1";
      "isarray-0.0.1" = self.by-version."isarray"."0.0.1";
      "string_decoder-0.10.31" = self.by-version."string_decoder"."0.10.31";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    peerDependencies = [];
  };
  by-spec."readable-stream"."~1.1.8" =
    self.by-version."readable-stream"."1.1.13";
  by-spec."readline2"."~0.1.0" =
    self.by-version."readline2"."0.1.1";
  by-version."readline2"."0.1.1" = self.buildNodePackage {
    name = "readline2-0.1.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/readline2/-/readline2-0.1.1.tgz";
      name = "readline2-0.1.1.tgz";
      sha1 = "99443ba6e83b830ef3051bfd7dc241a82728d568";
    };
    deps = {
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
      "strip-ansi-2.0.1" = self.by-version."strip-ansi"."2.0.1";
    };
    peerDependencies = [];
  };
  by-spec."redeyed"."~0.4.0" =
    self.by-version."redeyed"."0.4.4";
  by-version."redeyed"."0.4.4" = self.buildNodePackage {
    name = "redeyed-0.4.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/redeyed/-/redeyed-0.4.4.tgz";
      name = "redeyed-0.4.4.tgz";
      sha1 = "37e990a6f2b21b2a11c2e6a48fd4135698cba97f";
    };
    deps = {
      "esprima-1.0.4" = self.by-version."esprima"."1.0.4";
    };
    peerDependencies = [];
  };
  by-spec."registry-url"."^0.1.0" =
    self.by-version."registry-url"."0.1.1";
  by-version."registry-url"."0.1.1" = self.buildNodePackage {
    name = "registry-url-0.1.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/registry-url/-/registry-url-0.1.1.tgz";
      name = "registry-url-0.1.1.tgz";
      sha1 = "1739427b81b110b302482a1c7cd727ffcc82d5be";
    };
    deps = {
      "npmconf-2.1.1" = self.by-version."npmconf"."2.1.1";
    };
    peerDependencies = [];
  };
  by-spec."request"."2 >=2.20.0" =
    self.by-version."request"."2.53.0";
  by-version."request"."2.53.0" = self.buildNodePackage {
    name = "request-2.53.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/request/-/request-2.53.0.tgz";
      name = "request-2.53.0.tgz";
      sha1 = "180a3ae92b7b639802e4f9545dd8fcdeb71d760c";
    };
    deps = {
      "bl-0.9.4" = self.by-version."bl"."0.9.4";
      "caseless-0.9.0" = self.by-version."caseless"."0.9.0";
      "forever-agent-0.5.2" = self.by-version."forever-agent"."0.5.2";
      "form-data-0.2.0" = self.by-version."form-data"."0.2.0";
      "json-stringify-safe-5.0.0" = self.by-version."json-stringify-safe"."5.0.0";
      "mime-types-2.0.9" = self.by-version."mime-types"."2.0.9";
      "node-uuid-1.4.2" = self.by-version."node-uuid"."1.4.2";
      "qs-2.3.3" = self.by-version."qs"."2.3.3";
      "tunnel-agent-0.4.0" = self.by-version."tunnel-agent"."0.4.0";
      "tough-cookie-0.12.1" = self.by-version."tough-cookie"."0.12.1";
      "http-signature-0.10.1" = self.by-version."http-signature"."0.10.1";
      "oauth-sign-0.6.0" = self.by-version."oauth-sign"."0.6.0";
      "hawk-2.3.1" = self.by-version."hawk"."2.3.1";
      "aws-sign2-0.5.0" = self.by-version."aws-sign2"."0.5.0";
      "stringstream-0.0.4" = self.by-version."stringstream"."0.0.4";
      "combined-stream-0.0.7" = self.by-version."combined-stream"."0.0.7";
      "isstream-0.1.1" = self.by-version."isstream"."0.1.1";
    };
    peerDependencies = [];
  };
  by-spec."request"."2 >=2.25.0" =
    self.by-version."request"."2.53.0";
  by-spec."request"."^2.40.0" =
    self.by-version."request"."2.53.0";
  by-spec."request"."~2.42.0" =
    self.by-version."request"."2.42.0";
  by-version."request"."2.42.0" = self.buildNodePackage {
    name = "request-2.42.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/request/-/request-2.42.0.tgz";
      name = "request-2.42.0.tgz";
      sha1 = "572bd0148938564040ac7ab148b96423a063304a";
    };
    deps = {
      "bl-0.9.4" = self.by-version."bl"."0.9.4";
      "caseless-0.6.0" = self.by-version."caseless"."0.6.0";
      "forever-agent-0.5.2" = self.by-version."forever-agent"."0.5.2";
      "qs-1.2.2" = self.by-version."qs"."1.2.2";
      "json-stringify-safe-5.0.0" = self.by-version."json-stringify-safe"."5.0.0";
      "mime-types-1.0.2" = self.by-version."mime-types"."1.0.2";
      "node-uuid-1.4.2" = self.by-version."node-uuid"."1.4.2";
      "tunnel-agent-0.4.0" = self.by-version."tunnel-agent"."0.4.0";
      "tough-cookie-0.12.1" = self.by-version."tough-cookie"."0.12.1";
      "form-data-0.1.4" = self.by-version."form-data"."0.1.4";
      "http-signature-0.10.1" = self.by-version."http-signature"."0.10.1";
      "oauth-sign-0.4.0" = self.by-version."oauth-sign"."0.4.0";
      "hawk-1.1.1" = self.by-version."hawk"."1.1.1";
      "aws-sign2-0.5.0" = self.by-version."aws-sign2"."0.5.0";
      "stringstream-0.0.4" = self.by-version."stringstream"."0.0.4";
    };
    peerDependencies = [];
  };
  by-spec."request"."~2.51.0" =
    self.by-version."request"."2.51.0";
  by-version."request"."2.51.0" = self.buildNodePackage {
    name = "request-2.51.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/request/-/request-2.51.0.tgz";
      name = "request-2.51.0.tgz";
      sha1 = "35d00bbecc012e55f907b1bd9e0dbd577bfef26e";
    };
    deps = {
      "bl-0.9.4" = self.by-version."bl"."0.9.4";
      "caseless-0.8.0" = self.by-version."caseless"."0.8.0";
      "forever-agent-0.5.2" = self.by-version."forever-agent"."0.5.2";
      "form-data-0.2.0" = self.by-version."form-data"."0.2.0";
      "json-stringify-safe-5.0.0" = self.by-version."json-stringify-safe"."5.0.0";
      "mime-types-1.0.2" = self.by-version."mime-types"."1.0.2";
      "node-uuid-1.4.2" = self.by-version."node-uuid"."1.4.2";
      "qs-2.3.3" = self.by-version."qs"."2.3.3";
      "tunnel-agent-0.4.0" = self.by-version."tunnel-agent"."0.4.0";
      "tough-cookie-0.12.1" = self.by-version."tough-cookie"."0.12.1";
      "http-signature-0.10.1" = self.by-version."http-signature"."0.10.1";
      "oauth-sign-0.5.0" = self.by-version."oauth-sign"."0.5.0";
      "hawk-1.1.1" = self.by-version."hawk"."1.1.1";
      "aws-sign2-0.5.0" = self.by-version."aws-sign2"."0.5.0";
      "stringstream-0.0.4" = self.by-version."stringstream"."0.0.4";
      "combined-stream-0.0.7" = self.by-version."combined-stream"."0.0.7";
    };
    peerDependencies = [];
  };
  by-spec."request-progress"."0.3.0" =
    self.by-version."request-progress"."0.3.0";
  by-version."request-progress"."0.3.0" = self.buildNodePackage {
    name = "request-progress-0.3.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/request-progress/-/request-progress-0.3.0.tgz";
      name = "request-progress-0.3.0.tgz";
      sha1 = "bdf2062bfc197c5d492500d44cb3aff7865b492e";
    };
    deps = {
      "throttleit-0.0.2" = self.by-version."throttleit"."0.0.2";
    };
    peerDependencies = [];
  };
  by-spec."request-replay"."~0.2.0" =
    self.by-version."request-replay"."0.2.0";
  by-version."request-replay"."0.2.0" = self.buildNodePackage {
    name = "request-replay-0.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/request-replay/-/request-replay-0.2.0.tgz";
      name = "request-replay-0.2.0.tgz";
      sha1 = "9b693a5d118b39f5c596ead5ed91a26444057f60";
    };
    deps = {
      "retry-0.6.1" = self.by-version."retry"."0.6.1";
    };
    peerDependencies = [];
  };
  by-spec."retry"."0.6.0" =
    self.by-version."retry"."0.6.0";
  by-version."retry"."0.6.0" = self.buildNodePackage {
    name = "retry-0.6.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/retry/-/retry-0.6.0.tgz";
      name = "retry-0.6.0.tgz";
      sha1 = "1c010713279a6fd1e8def28af0c3ff1871caa537";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."retry"."~0.6.0" =
    self.by-version."retry"."0.6.1";
  by-version."retry"."0.6.1" = self.buildNodePackage {
    name = "retry-0.6.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/retry/-/retry-0.6.1.tgz";
      name = "retry-0.6.1.tgz";
      sha1 = "fdc90eed943fde11b893554b8cc63d0e899ba918";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."rimraf"."2" =
    self.by-version."rimraf"."2.2.8";
  by-version."rimraf"."2.2.8" = self.buildNodePackage {
    name = "rimraf-2.2.8";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/rimraf/-/rimraf-2.2.8.tgz";
      name = "rimraf-2.2.8.tgz";
      sha1 = "e439be2aaee327321952730f99a8929e4fc50582";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."rimraf"."~2" =
    self.by-version."rimraf"."2.2.8";
  by-spec."rimraf"."~2.1.4" =
    self.by-version."rimraf"."2.1.4";
  by-version."rimraf"."2.1.4" = self.buildNodePackage {
    name = "rimraf-2.1.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/rimraf/-/rimraf-2.1.4.tgz";
      name = "rimraf-2.1.4.tgz";
      sha1 = "5a6eb62eeda068f51ede50f29b3e5cd22f3d9bb2";
    };
    deps = {
      "graceful-fs-1.2.3" = self.by-version."graceful-fs"."1.2.3";
    };
    peerDependencies = [];
  };
  by-spec."rimraf"."~2.2.0" =
    self.by-version."rimraf"."2.2.8";
  by-spec."rx"."^2.2.27" =
    self.by-version."rx"."2.3.25";
  by-version."rx"."2.3.25" = self.buildNodePackage {
    name = "rx-2.3.25";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/rx/-/rx-2.3.25.tgz";
      name = "rx-2.3.25.tgz";
      sha1 = "2f7c0550532777b41fa692bb790a7886eaff9731";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."semver"."2" =
    self.by-version."semver"."2.3.2";
  by-version."semver"."2.3.2" = self.buildNodePackage {
    name = "semver-2.3.2";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/semver/-/semver-2.3.2.tgz";
      name = "semver-2.3.2.tgz";
      sha1 = "b9848f25d6cf36333073ec9ef8856d42f1233e52";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."semver"."2 || 3 || 4" =
    self.by-version."semver"."4.3.0";
  by-version."semver"."4.3.0" = self.buildNodePackage {
    name = "semver-4.3.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/semver/-/semver-4.3.0.tgz";
      name = "semver-4.3.0.tgz";
      sha1 = "3757ceed2b91afefe0ba2c3b6bda49c688b0257a";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."semver".">=2.0.10 <3.0.0" =
    self.by-version."semver"."2.3.2";
  by-spec."semver".">=2.2.1 <3" =
    self.by-version."semver"."2.3.2";
  by-spec."semver"."^2.2.1" =
    self.by-version."semver"."2.3.2";
  by-spec."semver"."~2.0.5" =
    self.by-version."semver"."2.0.11";
  by-version."semver"."2.0.11" = self.buildNodePackage {
    name = "semver-2.0.11";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/semver/-/semver-2.0.11.tgz";
      name = "semver-2.0.11.tgz";
      sha1 = "f51f07d03fa5af79beb537fc067a7e141786cced";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."semver"."~2.3.0" =
    self.by-version."semver"."2.3.2";
  by-spec."semver-diff"."^0.1.0" =
    self.by-version."semver-diff"."0.1.0";
  by-version."semver-diff"."0.1.0" = self.buildNodePackage {
    name = "semver-diff-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/semver-diff/-/semver-diff-0.1.0.tgz";
      name = "semver-diff-0.1.0.tgz";
      sha1 = "4f6057ca3eba23cc484b51f64aaf88b131a3855d";
    };
    deps = {
      "semver-2.3.2" = self.by-version."semver"."2.3.2";
    };
    peerDependencies = [];
  };
  by-spec."shell-quote"."~1.4.1" =
    self.by-version."shell-quote"."1.4.2";
  by-version."shell-quote"."1.4.2" = self.buildNodePackage {
    name = "shell-quote-1.4.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/shell-quote/-/shell-quote-1.4.2.tgz";
      name = "shell-quote-1.4.2.tgz";
      sha1 = "f132a54f2030d69280d370d4974155f85f62f67b";
    };
    deps = {
      "jsonify-0.0.0" = self.by-version."jsonify"."0.0.0";
      "array-filter-0.0.1" = self.by-version."array-filter"."0.0.1";
      "array-reduce-0.0.0" = self.by-version."array-reduce"."0.0.0";
      "array-map-0.0.0" = self.by-version."array-map"."0.0.0";
    };
    peerDependencies = [];
  };
  by-spec."sigmund"."~1.0.0" =
    self.by-version."sigmund"."1.0.0";
  by-version."sigmund"."1.0.0" = self.buildNodePackage {
    name = "sigmund-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/sigmund/-/sigmund-1.0.0.tgz";
      name = "sigmund-1.0.0.tgz";
      sha1 = "66a2b3a749ae8b5fb89efd4fcc01dc94fbe02296";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."slide"."~1.1.3" =
    self.by-version."slide"."1.1.6";
  by-version."slide"."1.1.6" = self.buildNodePackage {
    name = "slide-1.1.6";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/slide/-/slide-1.1.6.tgz";
      name = "slide-1.1.6.tgz";
      sha1 = "56eb027d65b4d2dce6cb2e2d32c4d4afc9e1d707";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."sntp"."0.2.x" =
    self.by-version."sntp"."0.2.4";
  by-version."sntp"."0.2.4" = self.buildNodePackage {
    name = "sntp-0.2.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/sntp/-/sntp-0.2.4.tgz";
      name = "sntp-0.2.4.tgz";
      sha1 = "fb885f18b0f3aad189f824862536bceeec750900";
    };
    deps = {
      "hoek-0.9.1" = self.by-version."hoek"."0.9.1";
    };
    peerDependencies = [];
  };
  by-spec."sntp"."1.x.x" =
    self.by-version."sntp"."1.0.9";
  by-version."sntp"."1.0.9" = self.buildNodePackage {
    name = "sntp-1.0.9";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/sntp/-/sntp-1.0.9.tgz";
      name = "sntp-1.0.9.tgz";
      sha1 = "6541184cc90aeea6c6e7b35e2659082443c66198";
    };
    deps = {
      "hoek-2.11.0" = self.by-version."hoek"."2.11.0";
    };
    peerDependencies = [];
  };
  by-spec."source-map"."0.1.34" =
    self.by-version."source-map"."0.1.34";
  by-version."source-map"."0.1.34" = self.buildNodePackage {
    name = "source-map-0.1.34";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/source-map/-/source-map-0.1.34.tgz";
      name = "source-map-0.1.34.tgz";
      sha1 = "a7cfe89aec7b1682c3b198d0acfb47d7d090566b";
    };
    deps = {
      "amdefine-0.1.0" = self.by-version."amdefine"."0.1.0";
    };
    peerDependencies = [];
  };
  by-spec."source-map"."~0.1.7" =
    self.by-version."source-map"."0.1.43";
  by-version."source-map"."0.1.43" = self.buildNodePackage {
    name = "source-map-0.1.43";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/source-map/-/source-map-0.1.43.tgz";
      name = "source-map-0.1.43.tgz";
      sha1 = "c24bc146ca517c1471f5dacbe2571b2b7f9e3346";
    };
    deps = {
      "amdefine-0.1.0" = self.by-version."amdefine"."0.1.0";
    };
    peerDependencies = [];
  };
  by-spec."string-length"."^0.1.2" =
    self.by-version."string-length"."0.1.2";
  by-version."string-length"."0.1.2" = self.buildNodePackage {
    name = "string-length-0.1.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/string-length/-/string-length-0.1.2.tgz";
      name = "string-length-0.1.2.tgz";
      sha1 = "ab04bb33867ee74beed7fb89bb7f089d392780f2";
    };
    deps = {
      "strip-ansi-0.2.2" = self.by-version."strip-ansi"."0.2.2";
    };
    peerDependencies = [];
  };
  by-spec."string_decoder"."~0.10.x" =
    self.by-version."string_decoder"."0.10.31";
  by-version."string_decoder"."0.10.31" = self.buildNodePackage {
    name = "string_decoder-0.10.31";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz";
      name = "string_decoder-0.10.31.tgz";
      sha1 = "62e203bc41766c6c28c9fc84301dab1c5310fa94";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."stringify-object"."~1.0.0" =
    self.by-version."stringify-object"."1.0.0";
  by-version."stringify-object"."1.0.0" = self.buildNodePackage {
    name = "stringify-object-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/stringify-object/-/stringify-object-1.0.0.tgz";
      name = "stringify-object-1.0.0.tgz";
      sha1 = "333875ef8fd210f696d70b374146be84646bc346";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."stringstream"."~0.0.4" =
    self.by-version."stringstream"."0.0.4";
  by-version."stringstream"."0.0.4" = self.buildNodePackage {
    name = "stringstream-0.0.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/stringstream/-/stringstream-0.0.4.tgz";
      name = "stringstream-0.0.4.tgz";
      sha1 = "0f0e3423f942960b5692ac324a57dd093bc41a92";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."strip-ansi"."^0.2.1" =
    self.by-version."strip-ansi"."0.2.2";
  by-version."strip-ansi"."0.2.2" = self.buildNodePackage {
    name = "strip-ansi-0.2.2";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/strip-ansi/-/strip-ansi-0.2.2.tgz";
      name = "strip-ansi-0.2.2.tgz";
      sha1 = "854d290c981525fc8c397a910b025ae2d54ffc08";
    };
    deps = {
      "ansi-regex-0.1.0" = self.by-version."ansi-regex"."0.1.0";
    };
    peerDependencies = [];
  };
  by-spec."strip-ansi"."^0.3.0" =
    self.by-version."strip-ansi"."0.3.0";
  by-version."strip-ansi"."0.3.0" = self.buildNodePackage {
    name = "strip-ansi-0.3.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/strip-ansi/-/strip-ansi-0.3.0.tgz";
      name = "strip-ansi-0.3.0.tgz";
      sha1 = "25f48ea22ca79187f3174a4db8759347bb126220";
    };
    deps = {
      "ansi-regex-0.2.1" = self.by-version."ansi-regex"."0.2.1";
    };
    peerDependencies = [];
  };
  by-spec."strip-ansi"."^2.0.1" =
    self.by-version."strip-ansi"."2.0.1";
  by-version."strip-ansi"."2.0.1" = self.buildNodePackage {
    name = "strip-ansi-2.0.1";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/strip-ansi/-/strip-ansi-2.0.1.tgz";
      name = "strip-ansi-2.0.1.tgz";
      sha1 = "df62c1aa94ed2f114e1d0f21fd1d50482b79a60e";
    };
    deps = {
      "ansi-regex-1.1.0" = self.by-version."ansi-regex"."1.1.0";
    };
    peerDependencies = [];
  };
  by-spec."supports-color"."^0.2.0" =
    self.by-version."supports-color"."0.2.0";
  by-version."supports-color"."0.2.0" = self.buildNodePackage {
    name = "supports-color-0.2.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/supports-color/-/supports-color-0.2.0.tgz";
      name = "supports-color-0.2.0.tgz";
      sha1 = "d92de2694eb3f67323973d7ae3d8b55b4c22190a";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."tar"."0.1.17" =
    self.by-version."tar"."0.1.17";
  by-version."tar"."0.1.17" = self.buildNodePackage {
    name = "tar-0.1.17";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/tar/-/tar-0.1.17.tgz";
      name = "tar-0.1.17.tgz";
      sha1 = "408c8a95deb8e78a65b59b1a51a333183a32badc";
    };
    deps = {
      "inherits-1.0.0" = self.by-version."inherits"."1.0.0";
      "block-stream-0.0.7" = self.by-version."block-stream"."0.0.7";
      "fstream-0.1.31" = self.by-version."fstream"."0.1.31";
    };
    peerDependencies = [];
  };
  by-spec."tar-fs"."0.5.2" =
    self.by-version."tar-fs"."0.5.2";
  by-version."tar-fs"."0.5.2" = self.buildNodePackage {
    name = "tar-fs-0.5.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/tar-fs/-/tar-fs-0.5.2.tgz";
      name = "tar-fs-0.5.2.tgz";
      sha1 = "0f59424be7eeee45232316e302f66d3f6ea6db3e";
    };
    deps = {
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "pump-0.3.5" = self.by-version."pump"."0.3.5";
      "tar-stream-0.4.7" = self.by-version."tar-stream"."0.4.7";
    };
    peerDependencies = [];
  };
  by-spec."tar-stream"."^0.4.6" =
    self.by-version."tar-stream"."0.4.7";
  by-version."tar-stream"."0.4.7" = self.buildNodePackage {
    name = "tar-stream-0.4.7";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/tar-stream/-/tar-stream-0.4.7.tgz";
      name = "tar-stream-0.4.7.tgz";
      sha1 = "1f1d2ce9ebc7b42765243ca0e8f1b7bfda0aadcd";
    };
    deps = {
      "bl-0.9.4" = self.by-version."bl"."0.9.4";
      "end-of-stream-1.1.0" = self.by-version."end-of-stream"."1.1.0";
      "readable-stream-1.1.13" = self.by-version."readable-stream"."1.1.13";
      "xtend-4.0.0" = self.by-version."xtend"."4.0.0";
    };
    peerDependencies = [];
  };
  by-spec."temp"."0.6.0" =
    self.by-version."temp"."0.6.0";
  by-version."temp"."0.6.0" = self.buildNodePackage {
    name = "temp-0.6.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/temp/-/temp-0.6.0.tgz";
      name = "temp-0.6.0.tgz";
      sha1 = "6b13df5cddf370f2e3a606ca40f202c419173f07";
    };
    deps = {
      "rimraf-2.1.4" = self.by-version."rimraf"."2.1.4";
      "osenv-0.0.3" = self.by-version."osenv"."0.0.3";
    };
    peerDependencies = [];
  };
  by-spec."throttleit"."~0.0.2" =
    self.by-version."throttleit"."0.0.2";
  by-version."throttleit"."0.0.2" = self.buildNodePackage {
    name = "throttleit-0.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/throttleit/-/throttleit-0.0.2.tgz";
      name = "throttleit-0.0.2.tgz";
      sha1 = "cfedf88e60c00dd9697b61fdd2a8343a9b680eaf";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."through"."~2.3.4" =
    self.by-version."through"."2.3.6";
  by-version."through"."2.3.6" = self.buildNodePackage {
    name = "through-2.3.6";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/through/-/through-2.3.6.tgz";
      name = "through-2.3.6.tgz";
      sha1 = "26681c0f524671021d4e29df7c36bce2d0ecf2e8";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."timers-ext"."0.1" =
    self.by-version."timers-ext"."0.1.0";
  by-version."timers-ext"."0.1.0" = self.buildNodePackage {
    name = "timers-ext-0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/timers-ext/-/timers-ext-0.1.0.tgz";
      name = "timers-ext-0.1.0.tgz";
      sha1 = "00345a2ca93089d1251322054389d263e27b77e2";
    };
    deps = {
      "es5-ext-0.10.6" = self.by-version."es5-ext"."0.10.6";
      "next-tick-0.2.2" = self.by-version."next-tick"."0.2.2";
    };
    peerDependencies = [];
  };
  by-spec."timers-ext"."0.1.x" =
    self.by-version."timers-ext"."0.1.0";
  by-spec."tmp"."0.0.23" =
    self.by-version."tmp"."0.0.23";
  by-version."tmp"."0.0.23" = self.buildNodePackage {
    name = "tmp-0.0.23";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/tmp/-/tmp-0.0.23.tgz";
      name = "tmp-0.0.23.tgz";
      sha1 = "de874aa5e974a85f0a32cdfdbd74663cb3bd9c74";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."touch"."0.0.2" =
    self.by-version."touch"."0.0.2";
  by-version."touch"."0.0.2" = self.buildNodePackage {
    name = "touch-0.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/touch/-/touch-0.0.2.tgz";
      name = "touch-0.0.2.tgz";
      sha1 = "a65a777795e5cbbe1299499bdc42281ffb21b5f4";
    };
    deps = {
      "nopt-1.0.10" = self.by-version."nopt"."1.0.10";
    };
    peerDependencies = [];
  };
  by-spec."tough-cookie".">=0.12.0" =
    self.by-version."tough-cookie"."0.12.1";
  by-version."tough-cookie"."0.12.1" = self.buildNodePackage {
    name = "tough-cookie-0.12.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/tough-cookie/-/tough-cookie-0.12.1.tgz";
      name = "tough-cookie-0.12.1.tgz";
      sha1 = "8220c7e21abd5b13d96804254bd5a81ebf2c7d62";
    };
    deps = {
      "punycode-1.3.2" = self.by-version."punycode"."1.3.2";
    };
    peerDependencies = [];
  };
  by-spec."tough-cookie"."^0.12.1" =
    self.by-version."tough-cookie"."0.12.1";
  by-spec."traverse".">=0.3.0 <0.4" =
    self.by-version."traverse"."0.3.9";
  by-version."traverse"."0.3.9" = self.buildNodePackage {
    name = "traverse-0.3.9";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/traverse/-/traverse-0.3.9.tgz";
      name = "traverse-0.3.9.tgz";
      sha1 = "717b8f220cc0bb7b44e40514c22b2e8bbc70d8b9";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."tunnel-agent"."~0.4.0" =
    self.by-version."tunnel-agent"."0.4.0";
  by-version."tunnel-agent"."0.4.0" = self.buildNodePackage {
    name = "tunnel-agent-0.4.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.4.0.tgz";
      name = "tunnel-agent-0.4.0.tgz";
      sha1 = "b1184e312ffbcf70b3b4c78e8c219de7ebb1c550";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."uglify-js"."*" =
    self.by-version."uglify-js"."2.4.16";
  by-version."uglify-js"."2.4.16" = self.buildNodePackage {
    name = "uglify-js-2.4.16";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/uglify-js/-/uglify-js-2.4.16.tgz";
      name = "uglify-js-2.4.16.tgz";
      sha1 = "84143487eb480efd7d0789c7ecfbd48a695839f9";
    };
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "source-map-0.1.34" = self.by-version."source-map"."0.1.34";
      "optimist-0.3.7" = self.by-version."optimist"."0.3.7";
      "uglify-to-browserify-1.0.2" = self.by-version."uglify-to-browserify"."1.0.2";
    };
    peerDependencies = [];
  };
  "uglify-js" = self.by-version."uglify-js"."2.4.16";
  by-spec."uglify-js"."~2.3" =
    self.by-version."uglify-js"."2.3.6";
  by-version."uglify-js"."2.3.6" = self.buildNodePackage {
    name = "uglify-js-2.3.6";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/uglify-js/-/uglify-js-2.3.6.tgz";
      name = "uglify-js-2.3.6.tgz";
      sha1 = "fa0984770b428b7a9b2a8058f46355d14fef211a";
    };
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "source-map-0.1.43" = self.by-version."source-map"."0.1.43";
      "optimist-0.3.7" = self.by-version."optimist"."0.3.7";
    };
    peerDependencies = [];
  };
  by-spec."uglify-to-browserify"."~1.0.0" =
    self.by-version."uglify-to-browserify"."1.0.2";
  by-version."uglify-to-browserify"."1.0.2" = self.buildNodePackage {
    name = "uglify-to-browserify-1.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/uglify-to-browserify/-/uglify-to-browserify-1.0.2.tgz";
      name = "uglify-to-browserify-1.0.2.tgz";
      sha1 = "6e0924d6bda6b5afe349e39a6d632850a0f882b7";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."uid-number"."0.0.5" =
    self.by-version."uid-number"."0.0.5";
  by-version."uid-number"."0.0.5" = self.buildNodePackage {
    name = "uid-number-0.0.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/uid-number/-/uid-number-0.0.5.tgz";
      name = "uid-number-0.0.5.tgz";
      sha1 = "5a3db23ef5dbd55b81fce0ec9a2ac6fccdebb81e";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."underscore"."~1.4.3" =
    self.by-version."underscore"."1.4.4";
  by-version."underscore"."1.4.4" = self.buildNodePackage {
    name = "underscore-1.4.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/underscore/-/underscore-1.4.4.tgz";
      name = "underscore-1.4.4.tgz";
      sha1 = "61a6a32010622afa07963bf325203cf12239d604";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."underscore"."~1.7.0" =
    self.by-version."underscore"."1.7.0";
  by-version."underscore"."1.7.0" = self.buildNodePackage {
    name = "underscore-1.7.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/underscore/-/underscore-1.7.0.tgz";
      name = "underscore-1.7.0.tgz";
      sha1 = "6bbaf0877500d36be34ecaa584e0db9fef035209";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."underscore.string"."~2.3.1" =
    self.by-version."underscore.string"."2.3.3";
  by-version."underscore.string"."2.3.3" = self.buildNodePackage {
    name = "underscore.string-2.3.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/underscore.string/-/underscore.string-2.3.3.tgz";
      name = "underscore.string-2.3.3.tgz";
      sha1 = "71c08bf6b428b1133f37e78fa3a21c82f7329b0d";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."underscore.string"."~2.4.0" =
    self.by-version."underscore.string"."2.4.0";
  by-version."underscore.string"."2.4.0" = self.buildNodePackage {
    name = "underscore.string-2.4.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/underscore.string/-/underscore.string-2.4.0.tgz";
      name = "underscore.string-2.4.0.tgz";
      sha1 = "8cdd8fbac4e2d2ea1e7e2e8097c42f442280f85b";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."update-notifier"."0.2.0" =
    self.by-version."update-notifier"."0.2.0";
  by-version."update-notifier"."0.2.0" = self.buildNodePackage {
    name = "update-notifier-0.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/update-notifier/-/update-notifier-0.2.0.tgz";
      name = "update-notifier-0.2.0.tgz";
      sha1 = "a010c928adcf02090b8e0ce7fef6fb0a7cacc34a";
    };
    deps = {
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "configstore-0.3.2" = self.by-version."configstore"."0.3.2";
      "latest-version-0.2.0" = self.by-version."latest-version"."0.2.0";
      "semver-diff-0.1.0" = self.by-version."semver-diff"."0.1.0";
      "string-length-0.1.2" = self.by-version."string-length"."0.1.2";
    };
    peerDependencies = [];
  };
  by-spec."user-home"."^1.0.0" =
    self.by-version."user-home"."1.1.1";
  by-version."user-home"."1.1.1" = self.buildNodePackage {
    name = "user-home-1.1.1";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/user-home/-/user-home-1.1.1.tgz";
      name = "user-home-1.1.1.tgz";
      sha1 = "2b5be23a32b63a7c9deb8d0f28d485724a3df190";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."uuid"."^2.0.1" =
    self.by-version."uuid"."2.0.1";
  by-version."uuid"."2.0.1" = self.buildNodePackage {
    name = "uuid-2.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/uuid/-/uuid-2.0.1.tgz";
      name = "uuid-2.0.1.tgz";
      sha1 = "c2a30dedb3e535d72ccf82e343941a50ba8533ac";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."walk"."^2.3.9" =
    self.by-version."walk"."2.3.9";
  by-version."walk"."2.3.9" = self.buildNodePackage {
    name = "walk-2.3.9";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/walk/-/walk-2.3.9.tgz";
      name = "walk-2.3.9.tgz";
      sha1 = "31b4db6678f2ae01c39ea9fb8725a9031e558a7b";
    };
    deps = {
      "foreachasync-3.0.0" = self.by-version."foreachasync"."3.0.0";
    };
    peerDependencies = [];
  };
  by-spec."which"."~1.0.5" =
    self.by-version."which"."1.0.8";
  by-version."which"."1.0.8" = self.buildNodePackage {
    name = "which-1.0.8";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/which/-/which-1.0.8.tgz";
      name = "which-1.0.8.tgz";
      sha1 = "c2ff319534ac4a1fa45df2221b56c36279903ded";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."win-release"."^1.0.0" =
    self.by-version."win-release"."1.0.0";
  by-version."win-release"."1.0.0" = self.buildNodePackage {
    name = "win-release-1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/win-release/-/win-release-1.0.0.tgz";
      name = "win-release-1.0.0.tgz";
      sha1 = "8993308dedbd8d30ad5594b6b7382a8c1d96ae5a";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."wordwrap"."~0.0.2" =
    self.by-version."wordwrap"."0.0.2";
  by-version."wordwrap"."0.0.2" = self.buildNodePackage {
    name = "wordwrap-0.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/wordwrap/-/wordwrap-0.0.2.tgz";
      name = "wordwrap-0.0.2.tgz";
      sha1 = "b79669bb42ecb409f83d583cad52ca17eaa1643f";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."wrappy"."1" =
    self.by-version."wrappy"."1.0.1";
  by-version."wrappy"."1.0.1" = self.buildNodePackage {
    name = "wrappy-1.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/wrappy/-/wrappy-1.0.1.tgz";
      name = "wrappy-1.0.1.tgz";
      sha1 = "1e65969965ccbc2db4548c6b84a6f2c5aedd4739";
    };
    deps = {
    };
    peerDependencies = [];
  };
  by-spec."xdg-basedir"."^1.0.0" =
    self.by-version."xdg-basedir"."1.0.1";
  by-version."xdg-basedir"."1.0.1" = self.buildNodePackage {
    name = "xdg-basedir-1.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/xdg-basedir/-/xdg-basedir-1.0.1.tgz";
      name = "xdg-basedir-1.0.1.tgz";
      sha1 = "14ff8f63a4fdbcb05d5b6eea22b36f3033b9f04e";
    };
    deps = {
      "user-home-1.1.1" = self.by-version."user-home"."1.1.1";
    };
    peerDependencies = [];
  };
  by-spec."xtend"."^4.0.0" =
    self.by-version."xtend"."4.0.0";
  by-version."xtend"."4.0.0" = self.buildNodePackage {
    name = "xtend-4.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/xtend/-/xtend-4.0.0.tgz";
      name = "xtend-4.0.0.tgz";
      sha1 = "8bc36ff87aedbe7ce9eaf0bca36b2354a743840f";
    };
    deps = {
    };
    peerDependencies = [];
  };
}
