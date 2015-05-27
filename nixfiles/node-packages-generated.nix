{ self, fetchurl, fetchgit ? null, lib }:

{
  by-spec."abbrev"."1" =
    self.by-version."abbrev"."1.0.6";
  by-version."abbrev"."1.0.6" = lib.makeOverridable self.buildNodePackage {
    name = "abbrev-1.0.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/abbrev/-/abbrev-1.0.6.tgz";
        name = "abbrev-1.0.6.tgz";
        sha1 = "b6d632b859b3fa2d6f7e4b195472461b9e32dc30";
      })
    ];
    buildInputs =
      (self.nativeDeps."abbrev" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "abbrev" ];
  };
  by-spec."abbrev"."^1.0.5" =
    self.by-version."abbrev"."1.0.6";
  by-spec."amdefine".">=0.0.4" =
    self.by-version."amdefine"."0.1.0";
  by-version."amdefine"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "amdefine-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/amdefine/-/amdefine-0.1.0.tgz";
        name = "amdefine-0.1.0.tgz";
        sha1 = "3ca9735cf1dde0edf7a4bf6641709c8024f9b227";
      })
    ];
    buildInputs =
      (self.nativeDeps."amdefine" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "amdefine" ];
  };
  by-spec."ansi"."^0.3.0" =
    self.by-version."ansi"."0.3.0";
  by-version."ansi"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "ansi-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansi/-/ansi-0.3.0.tgz";
        name = "ansi-0.3.0.tgz";
        sha1 = "74b2f1f187c8553c7f95015bcb76009fb43d38e0";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansi" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansi" ];
  };
  by-spec."ansi"."~0.3.0" =
    self.by-version."ansi"."0.3.0";
  by-spec."ansi-regex"."^0.2.0" =
    self.by-version."ansi-regex"."0.2.1";
  by-version."ansi-regex"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "ansi-regex-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansi-regex/-/ansi-regex-0.2.1.tgz";
        name = "ansi-regex-0.2.1.tgz";
        sha1 = "0d8e946967a3d8143f93e24e298525fc1b2235f9";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansi-regex" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansi-regex" ];
  };
  by-spec."ansi-regex"."^0.2.1" =
    self.by-version."ansi-regex"."0.2.1";
  by-spec."ansi-regex"."^1.0.0" =
    self.by-version."ansi-regex"."1.1.1";
  by-version."ansi-regex"."1.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "ansi-regex-1.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansi-regex/-/ansi-regex-1.1.1.tgz";
        name = "ansi-regex-1.1.1.tgz";
        sha1 = "41c847194646375e6a1a5d10c3ca054ef9fc980d";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansi-regex" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansi-regex" ];
  };
  by-spec."ansi-regex"."^1.1.0" =
    self.by-version."ansi-regex"."1.1.1";
  by-spec."ansi-regex"."^1.1.1" =
    self.by-version."ansi-regex"."1.1.1";
  by-spec."ansi-styles"."^1.1.0" =
    self.by-version."ansi-styles"."1.1.0";
  by-version."ansi-styles"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "ansi-styles-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansi-styles/-/ansi-styles-1.1.0.tgz";
        name = "ansi-styles-1.1.0.tgz";
        sha1 = "eaecbf66cd706882760b2f4691582b8f55d7a7de";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansi-styles" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansi-styles" ];
  };
  by-spec."ansi-styles"."^2.0.1" =
    self.by-version."ansi-styles"."2.0.1";
  by-version."ansi-styles"."2.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "ansi-styles-2.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansi-styles/-/ansi-styles-2.0.1.tgz";
        name = "ansi-styles-2.0.1.tgz";
        sha1 = "b033f57f93e2d28adeb8bc11138fa13da0fd20a3";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansi-styles" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansi-styles" ];
  };
  by-spec."ansicolors"."~0.2.1" =
    self.by-version."ansicolors"."0.2.1";
  by-version."ansicolors"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "ansicolors-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ansicolors/-/ansicolors-0.2.1.tgz";
        name = "ansicolors-0.2.1.tgz";
        sha1 = "be089599097b74a5c9c4a84a0cdbcdb62bd87aef";
      })
    ];
    buildInputs =
      (self.nativeDeps."ansicolors" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ansicolors" ];
  };
  by-spec."archy"."1.0.0" =
    self.by-version."archy"."1.0.0";
  by-version."archy"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "archy-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/archy/-/archy-1.0.0.tgz";
        name = "archy-1.0.0.tgz";
        sha1 = "f9c8c13757cc1dd7bc379ac77b2c62a5c2868c40";
      })
    ];
    buildInputs =
      (self.nativeDeps."archy" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "archy" ];
  };
  by-spec."are-we-there-yet"."~1.0.0" =
    self.by-version."are-we-there-yet"."1.0.4";
  by-version."are-we-there-yet"."1.0.4" = lib.makeOverridable self.buildNodePackage {
    name = "are-we-there-yet-1.0.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/are-we-there-yet/-/are-we-there-yet-1.0.4.tgz";
        name = "are-we-there-yet-1.0.4.tgz";
        sha1 = "527fe389f7bcba90806106b99244eaa07e886f85";
      })
    ];
    buildInputs =
      (self.nativeDeps."are-we-there-yet" or []);
    deps = {
      "delegates-0.1.0" = self.by-version."delegates"."0.1.0";
      "readable-stream-1.1.13" = self.by-version."readable-stream"."1.1.13";
    };
    peerDependencies = [
    ];
    passthru.names = [ "are-we-there-yet" ];
  };
  by-spec."argparse"."0.1.15" =
    self.by-version."argparse"."0.1.15";
  by-version."argparse"."0.1.15" = lib.makeOverridable self.buildNodePackage {
    name = "argparse-0.1.15";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/argparse/-/argparse-0.1.15.tgz";
        name = "argparse-0.1.15.tgz";
        sha1 = "28a1f72c43113e763220e5708414301c8840f0a1";
      })
    ];
    buildInputs =
      (self.nativeDeps."argparse" or []);
    deps = {
      "underscore-1.4.4" = self.by-version."underscore"."1.4.4";
      "underscore.string-2.3.3" = self.by-version."underscore.string"."2.3.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "argparse" ];
  };
  by-spec."argparse"."~1.0.2" =
    self.by-version."argparse"."1.0.2";
  by-version."argparse"."1.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "argparse-1.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/argparse/-/argparse-1.0.2.tgz";
        name = "argparse-1.0.2.tgz";
        sha1 = "bcfae39059656d1973d0b9e6a1a74154b5a9a136";
      })
    ];
    buildInputs =
      (self.nativeDeps."argparse" or []);
    deps = {
      "lodash-3.9.3" = self.by-version."lodash"."3.9.3";
      "sprintf-js-1.0.2" = self.by-version."sprintf-js"."1.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "argparse" ];
  };
  by-spec."array-filter"."~0.0.0" =
    self.by-version."array-filter"."0.0.1";
  by-version."array-filter"."0.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "array-filter-0.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/array-filter/-/array-filter-0.0.1.tgz";
        name = "array-filter-0.0.1.tgz";
        sha1 = "7da8cf2e26628ed732803581fd21f67cacd2eeec";
      })
    ];
    buildInputs =
      (self.nativeDeps."array-filter" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "array-filter" ];
  };
  by-spec."array-map"."~0.0.0" =
    self.by-version."array-map"."0.0.0";
  by-version."array-map"."0.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "array-map-0.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/array-map/-/array-map-0.0.0.tgz";
        name = "array-map-0.0.0.tgz";
        sha1 = "88a2bab73d1cf7bcd5c1b118a003f66f665fa662";
      })
    ];
    buildInputs =
      (self.nativeDeps."array-map" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "array-map" ];
  };
  by-spec."array-reduce"."~0.0.0" =
    self.by-version."array-reduce"."0.0.0";
  by-version."array-reduce"."0.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "array-reduce-0.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/array-reduce/-/array-reduce-0.0.0.tgz";
        name = "array-reduce-0.0.0.tgz";
        sha1 = "173899d3ffd1c7d9383e4479525dbe278cab5f2b";
      })
    ];
    buildInputs =
      (self.nativeDeps."array-reduce" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "array-reduce" ];
  };
  by-spec."asn1"."0.1.11" =
    self.by-version."asn1"."0.1.11";
  by-version."asn1"."0.1.11" = lib.makeOverridable self.buildNodePackage {
    name = "asn1-0.1.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/asn1/-/asn1-0.1.11.tgz";
        name = "asn1-0.1.11.tgz";
        sha1 = "559be18376d08a4ec4dbe80877d27818639b2df7";
      })
    ];
    buildInputs =
      (self.nativeDeps."asn1" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "asn1" ];
  };
  by-spec."assert-plus"."^0.1.5" =
    self.by-version."assert-plus"."0.1.5";
  by-version."assert-plus"."0.1.5" = lib.makeOverridable self.buildNodePackage {
    name = "assert-plus-0.1.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/assert-plus/-/assert-plus-0.1.5.tgz";
        name = "assert-plus-0.1.5.tgz";
        sha1 = "ee74009413002d84cec7219c6ac811812e723160";
      })
    ];
    buildInputs =
      (self.nativeDeps."assert-plus" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "assert-plus" ];
  };
  by-spec."async"."^0.9.0" =
    self.by-version."async"."0.9.2";
  by-version."async"."0.9.2" = lib.makeOverridable self.buildNodePackage {
    name = "async-0.9.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/async/-/async-0.9.2.tgz";
        name = "async-0.9.2.tgz";
        sha1 = "aea74d5e61c1f899613bf64bda66d4c78f2fd17d";
      })
    ];
    buildInputs =
      (self.nativeDeps."async" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "async" ];
  };
  by-spec."async"."~0.2.6" =
    self.by-version."async"."0.2.10";
  by-version."async"."0.2.10" = lib.makeOverridable self.buildNodePackage {
    name = "async-0.2.10";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/async/-/async-0.2.10.tgz";
        name = "async-0.2.10.tgz";
        sha1 = "b6bbe0b0674b9d719708ca38de8c237cb526c3d1";
      })
    ];
    buildInputs =
      (self.nativeDeps."async" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "async" ];
  };
  by-spec."async"."~0.2.8" =
    self.by-version."async"."0.2.10";
  by-spec."async"."~0.9.0" =
    self.by-version."async"."0.9.2";
  by-spec."aws-sign2"."~0.5.0" =
    self.by-version."aws-sign2"."0.5.0";
  by-version."aws-sign2"."0.5.0" = lib.makeOverridable self.buildNodePackage {
    name = "aws-sign2-0.5.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/aws-sign2/-/aws-sign2-0.5.0.tgz";
        name = "aws-sign2-0.5.0.tgz";
        sha1 = "c57103f7a17fc037f02d7c2e64b602ea223f7d63";
      })
    ];
    buildInputs =
      (self.nativeDeps."aws-sign2" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "aws-sign2" ];
  };
  by-spec."balanced-match"."^0.2.0" =
    self.by-version."balanced-match"."0.2.0";
  by-version."balanced-match"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "balanced-match-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/balanced-match/-/balanced-match-0.2.0.tgz";
        name = "balanced-match-0.2.0.tgz";
        sha1 = "38f6730c03aab6d5edbb52bd934885e756d71674";
      })
    ];
    buildInputs =
      (self.nativeDeps."balanced-match" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "balanced-match" ];
  };
  by-spec."binary"."^0.3.0" =
    self.by-version."binary"."0.3.0";
  by-version."binary"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "binary-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/binary/-/binary-0.3.0.tgz";
        name = "binary-0.3.0.tgz";
        sha1 = "9f60553bc5ce8c3386f3b553cff47462adecaa79";
      })
    ];
    buildInputs =
      (self.nativeDeps."binary" or []);
    deps = {
      "chainsaw-0.1.0" = self.by-version."chainsaw"."0.1.0";
      "buffers-0.1.1" = self.by-version."buffers"."0.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "binary" ];
  };
  by-spec."bl"."^0.9.0" =
    self.by-version."bl"."0.9.4";
  by-version."bl"."0.9.4" = lib.makeOverridable self.buildNodePackage {
    name = "bl-0.9.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bl/-/bl-0.9.4.tgz";
        name = "bl-0.9.4.tgz";
        sha1 = "4702ddf72fbe0ecd82787c00c113aea1935ad0e7";
      })
    ];
    buildInputs =
      (self.nativeDeps."bl" or []);
    deps = {
      "readable-stream-1.0.33" = self.by-version."readable-stream"."1.0.33";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bl" ];
  };
  by-spec."bl"."~0.9.0" =
    self.by-version."bl"."0.9.4";
  by-spec."block-stream"."*" =
    self.by-version."block-stream"."0.0.8";
  by-version."block-stream"."0.0.8" = lib.makeOverridable self.buildNodePackage {
    name = "block-stream-0.0.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/block-stream/-/block-stream-0.0.8.tgz";
        name = "block-stream-0.0.8.tgz";
        sha1 = "0688f46da2bbf9cff0c4f68225a0cb95cbe8a46b";
      })
    ];
    buildInputs =
      (self.nativeDeps."block-stream" or []);
    deps = {
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "block-stream" ];
  };
  by-spec."bluebird"."^2.9.25" =
    self.by-version."bluebird"."2.9.26";
  by-version."bluebird"."2.9.26" = lib.makeOverridable self.buildNodePackage {
    name = "bluebird-2.9.26";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bluebird/-/bluebird-2.9.26.tgz";
        name = "bluebird-2.9.26.tgz";
        sha1 = "362772ea4d09f556a4b9f3b64c2fd136e87e3a55";
      })
    ];
    buildInputs =
      (self.nativeDeps."bluebird" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "bluebird" ];
  };
  by-spec."boom"."0.4.x" =
    self.by-version."boom"."0.4.2";
  by-version."boom"."0.4.2" = lib.makeOverridable self.buildNodePackage {
    name = "boom-0.4.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/boom/-/boom-0.4.2.tgz";
        name = "boom-0.4.2.tgz";
        sha1 = "7a636e9ded4efcefb19cef4947a3c67dfaee911b";
      })
    ];
    buildInputs =
      (self.nativeDeps."boom" or []);
    deps = {
      "hoek-0.9.1" = self.by-version."hoek"."0.9.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "boom" ];
  };
  by-spec."boom"."2.x.x" =
    self.by-version."boom"."2.7.2";
  by-version."boom"."2.7.2" = lib.makeOverridable self.buildNodePackage {
    name = "boom-2.7.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/boom/-/boom-2.7.2.tgz";
        name = "boom-2.7.2.tgz";
        sha1 = "dad628d897f7fd2e32cc82197f13307971cf8354";
      })
    ];
    buildInputs =
      (self.nativeDeps."boom" or []);
    deps = {
      "hoek-2.14.0" = self.by-version."hoek"."2.14.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "boom" ];
  };
  by-spec."bower".">=1.2.8 <2" =
    self.by-version."bower"."1.4.1";
  by-version."bower"."1.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "bower-1.4.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower/-/bower-1.4.1.tgz";
        name = "bower-1.4.1.tgz";
        sha1 = "a18be39d030792754f30f1c5b32d37b0156ba8dd";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower" or []);
    deps = {
      "abbrev-1.0.6" = self.by-version."abbrev"."1.0.6";
      "archy-1.0.0" = self.by-version."archy"."1.0.0";
      "bower-config-0.6.1" = self.by-version."bower-config"."0.6.1";
      "bower-endpoint-parser-0.2.2" = self.by-version."bower-endpoint-parser"."0.2.2";
      "bower-json-0.4.0" = self.by-version."bower-json"."0.4.0";
      "bower-logger-0.2.2" = self.by-version."bower-logger"."0.2.2";
      "bower-registry-client-0.3.0" = self.by-version."bower-registry-client"."0.3.0";
      "cardinal-0.4.4" = self.by-version."cardinal"."0.4.4";
      "chalk-1.0.0" = self.by-version."chalk"."1.0.0";
      "chmodr-0.1.0" = self.by-version."chmodr"."0.1.0";
      "configstore-0.3.2" = self.by-version."configstore"."0.3.2";
      "decompress-zip-0.1.0" = self.by-version."decompress-zip"."0.1.0";
      "fstream-1.0.6" = self.by-version."fstream"."1.0.6";
      "fstream-ignore-1.0.2" = self.by-version."fstream-ignore"."1.0.2";
      "github-0.2.4" = self.by-version."github"."0.2.4";
      "glob-4.5.3" = self.by-version."glob"."4.5.3";
      "graceful-fs-3.0.7" = self.by-version."graceful-fs"."3.0.7";
      "handlebars-2.0.0" = self.by-version."handlebars"."2.0.0";
      "inquirer-0.8.0" = self.by-version."inquirer"."0.8.0";
      "insight-0.5.3" = self.by-version."insight"."0.5.3";
      "is-root-1.0.0" = self.by-version."is-root"."1.0.0";
      "junk-1.0.1" = self.by-version."junk"."1.0.1";
      "lockfile-1.0.1" = self.by-version."lockfile"."1.0.1";
      "lru-cache-2.6.4" = self.by-version."lru-cache"."2.6.4";
      "mkdirp-0.5.0" = self.by-version."mkdirp"."0.5.0";
      "mout-0.11.0" = self.by-version."mout"."0.11.0";
      "nopt-3.0.2" = self.by-version."nopt"."3.0.2";
      "opn-1.0.2" = self.by-version."opn"."1.0.2";
      "p-throttler-0.1.1" = self.by-version."p-throttler"."0.1.1";
      "promptly-0.2.0" = self.by-version."promptly"."0.2.0";
      "q-1.4.1" = self.by-version."q"."1.4.1";
      "request-2.53.0" = self.by-version."request"."2.53.0";
      "request-progress-0.3.1" = self.by-version."request-progress"."0.3.1";
      "retry-0.6.1" = self.by-version."retry"."0.6.1";
      "rimraf-2.3.4" = self.by-version."rimraf"."2.3.4";
      "semver-2.3.2" = self.by-version."semver"."2.3.2";
      "shell-quote-1.4.3" = self.by-version."shell-quote"."1.4.3";
      "stringify-object-1.0.1" = self.by-version."stringify-object"."1.0.1";
      "tar-fs-1.5.1" = self.by-version."tar-fs"."1.5.1";
      "tmp-0.0.24" = self.by-version."tmp"."0.0.24";
      "update-notifier-0.3.2" = self.by-version."update-notifier"."0.3.2";
      "user-home-1.1.1" = self.by-version."user-home"."1.1.1";
      "which-1.1.1" = self.by-version."which"."1.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower" ];
  };
  by-spec."bower-config"."^0.6.1" =
    self.by-version."bower-config"."0.6.1";
  by-version."bower-config"."0.6.1" = lib.makeOverridable self.buildNodePackage {
    name = "bower-config-0.6.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-config/-/bower-config-0.6.1.tgz";
        name = "bower-config-0.6.1.tgz";
        sha1 = "7093155688bef44079bf4cb32d189312c87ded60";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-config" or []);
    deps = {
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "mout-0.9.1" = self.by-version."mout"."0.9.1";
      "optimist-0.6.1" = self.by-version."optimist"."0.6.1";
      "osenv-0.0.3" = self.by-version."osenv"."0.0.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-config" ];
  };
  by-spec."bower-config"."~0.6.1" =
    self.by-version."bower-config"."0.6.1";
  by-spec."bower-endpoint-parser"."0.2.1" =
    self.by-version."bower-endpoint-parser"."0.2.1";
  by-version."bower-endpoint-parser"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "bower-endpoint-parser-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-endpoint-parser/-/bower-endpoint-parser-0.2.1.tgz";
        name = "bower-endpoint-parser-0.2.1.tgz";
        sha1 = "8c4010a2900cdab07ea5d38f0bd03e9bbccef90f";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-endpoint-parser" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-endpoint-parser" ];
  };
  by-spec."bower-endpoint-parser"."^0.2.2" =
    self.by-version."bower-endpoint-parser"."0.2.2";
  by-version."bower-endpoint-parser"."0.2.2" = lib.makeOverridable self.buildNodePackage {
    name = "bower-endpoint-parser-0.2.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-endpoint-parser/-/bower-endpoint-parser-0.2.2.tgz";
        name = "bower-endpoint-parser-0.2.2.tgz";
        sha1 = "00b565adbfab6f2d35addde977e97962acbcb3f6";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-endpoint-parser" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-endpoint-parser" ];
  };
  by-spec."bower-json"."0.4.0" =
    self.by-version."bower-json"."0.4.0";
  by-version."bower-json"."0.4.0" = lib.makeOverridable self.buildNodePackage {
    name = "bower-json-0.4.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-json/-/bower-json-0.4.0.tgz";
        name = "bower-json-0.4.0.tgz";
        sha1 = "a99c3ccf416ef0590ed0ded252c760f1c6d93766";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-json" or []);
    deps = {
      "deep-extend-0.2.11" = self.by-version."deep-extend"."0.2.11";
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "intersect-0.0.3" = self.by-version."intersect"."0.0.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-json" ];
  };
  by-spec."bower-json"."^0.4.0" =
    self.by-version."bower-json"."0.4.0";
  by-spec."bower-logger"."0.2.1" =
    self.by-version."bower-logger"."0.2.1";
  by-version."bower-logger"."0.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "bower-logger-0.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-logger/-/bower-logger-0.2.1.tgz";
        name = "bower-logger-0.2.1.tgz";
        sha1 = "0c1817c48063a88d96cc3d516c55e57fff5d9ecb";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-logger" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-logger" ];
  };
  by-spec."bower-logger"."^0.2.2" =
    self.by-version."bower-logger"."0.2.2";
  by-version."bower-logger"."0.2.2" = lib.makeOverridable self.buildNodePackage {
    name = "bower-logger-0.2.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-logger/-/bower-logger-0.2.2.tgz";
        name = "bower-logger-0.2.2.tgz";
        sha1 = "39be07e979b2fc8e03a94634205ed9422373d381";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-logger" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-logger" ];
  };
  by-spec."bower-registry-client"."^0.3.0" =
    self.by-version."bower-registry-client"."0.3.0";
  by-version."bower-registry-client"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "bower-registry-client-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower-registry-client/-/bower-registry-client-0.3.0.tgz";
        name = "bower-registry-client-0.3.0.tgz";
        sha1 = "f5adcfdeda771a84be088ef1310d9756e58ebe74";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower-registry-client" or []);
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "bower-config-0.6.1" = self.by-version."bower-config"."0.6.1";
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "lru-cache-2.3.1" = self.by-version."lru-cache"."2.3.1";
      "request-2.51.0" = self.by-version."request"."2.51.0";
      "request-replay-0.2.0" = self.by-version."request-replay"."0.2.0";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower-registry-client" ];
  };
  by-spec."bower2nix"."*" =
    self.by-version."bower2nix"."2.1.0";
  by-version."bower2nix"."2.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "bower2nix-2.1.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/bower2nix/-/bower2nix-2.1.0.tgz";
        name = "bower2nix-2.1.0.tgz";
        sha1 = "213f507a729b20a1c3cb48f995a034f9c05f53e6";
      })
    ];
    buildInputs =
      (self.nativeDeps."bower2nix" or []);
    deps = {
      "temp-0.6.0" = self.by-version."temp"."0.6.0";
      "fs.extra-1.3.2" = self.by-version."fs.extra"."1.3.2";
      "bower-json-0.4.0" = self.by-version."bower-json"."0.4.0";
      "bower-endpoint-parser-0.2.1" = self.by-version."bower-endpoint-parser"."0.2.1";
      "bower-logger-0.2.1" = self.by-version."bower-logger"."0.2.1";
      "bower-1.4.1" = self.by-version."bower"."1.4.1";
      "argparse-0.1.15" = self.by-version."argparse"."0.1.15";
      "clone-0.1.11" = self.by-version."clone"."0.1.11";
      "semver-2.3.2" = self.by-version."semver"."2.3.2";
      "fetch-bower-2.0.0" = self.by-version."fetch-bower"."2.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "bower2nix" ];
  };
  "bower2nix" = self.by-version."bower2nix"."2.1.0";
  by-spec."brace-expansion"."^1.0.0" =
    self.by-version."brace-expansion"."1.1.0";
  by-version."brace-expansion"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "brace-expansion-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.0.tgz";
        name = "brace-expansion-1.1.0.tgz";
        sha1 = "c9b7d03c03f37bc704be100e522b40db8f6cfcd9";
      })
    ];
    buildInputs =
      (self.nativeDeps."brace-expansion" or []);
    deps = {
      "balanced-match-0.2.0" = self.by-version."balanced-match"."0.2.0";
      "concat-map-0.0.1" = self.by-version."concat-map"."0.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "brace-expansion" ];
  };
  by-spec."buffers"."~0.1.1" =
    self.by-version."buffers"."0.1.1";
  by-version."buffers"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "buffers-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/buffers/-/buffers-0.1.1.tgz";
        name = "buffers-0.1.1.tgz";
        sha1 = "b24579c3bed4d6d396aeee6d9a8ae7f5482ab7bb";
      })
    ];
    buildInputs =
      (self.nativeDeps."buffers" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "buffers" ];
  };
  by-spec."camelcase"."^1.0.2" =
    self.by-version."camelcase"."1.1.0";
  by-version."camelcase"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "camelcase-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/camelcase/-/camelcase-1.1.0.tgz";
        name = "camelcase-1.1.0.tgz";
        sha1 = "953b25c3bc98671ee59a44cb9d542672da7331b9";
      })
    ];
    buildInputs =
      (self.nativeDeps."camelcase" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "camelcase" ];
  };
  by-spec."cardinal"."0.4.4" =
    self.by-version."cardinal"."0.4.4";
  by-version."cardinal"."0.4.4" = lib.makeOverridable self.buildNodePackage {
    name = "cardinal-0.4.4";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cardinal/-/cardinal-0.4.4.tgz";
        name = "cardinal-0.4.4.tgz";
        sha1 = "ca5bb68a5b511b90fe93b9acea49bdee5c32bfe2";
      })
    ];
    buildInputs =
      (self.nativeDeps."cardinal" or []);
    deps = {
      "redeyed-0.4.4" = self.by-version."redeyed"."0.4.4";
      "ansicolors-0.2.1" = self.by-version."ansicolors"."0.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "cardinal" ];
  };
  by-spec."caseless"."~0.8.0" =
    self.by-version."caseless"."0.8.0";
  by-version."caseless"."0.8.0" = lib.makeOverridable self.buildNodePackage {
    name = "caseless-0.8.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/caseless/-/caseless-0.8.0.tgz";
        name = "caseless-0.8.0.tgz";
        sha1 = "5bca2881d41437f54b2407ebe34888c7b9ad4f7d";
      })
    ];
    buildInputs =
      (self.nativeDeps."caseless" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "caseless" ];
  };
  by-spec."caseless"."~0.9.0" =
    self.by-version."caseless"."0.9.0";
  by-version."caseless"."0.9.0" = lib.makeOverridable self.buildNodePackage {
    name = "caseless-0.9.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/caseless/-/caseless-0.9.0.tgz";
        name = "caseless-0.9.0.tgz";
        sha1 = "b7b65ce6bf1413886539cfd533f0b30effa9cf88";
      })
    ];
    buildInputs =
      (self.nativeDeps."caseless" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "caseless" ];
  };
  by-spec."chainsaw"."~0.1.0" =
    self.by-version."chainsaw"."0.1.0";
  by-version."chainsaw"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "chainsaw-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/chainsaw/-/chainsaw-0.1.0.tgz";
        name = "chainsaw-0.1.0.tgz";
        sha1 = "5eab50b28afe58074d0d58291388828b5e5fbc98";
      })
    ];
    buildInputs =
      (self.nativeDeps."chainsaw" or []);
    deps = {
      "traverse-0.3.9" = self.by-version."traverse"."0.3.9";
    };
    peerDependencies = [
    ];
    passthru.names = [ "chainsaw" ];
  };
  by-spec."chalk"."^0.5.0" =
    self.by-version."chalk"."0.5.1";
  by-version."chalk"."0.5.1" = lib.makeOverridable self.buildNodePackage {
    name = "chalk-0.5.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/chalk/-/chalk-0.5.1.tgz";
        name = "chalk-0.5.1.tgz";
        sha1 = "663b3a648b68b55d04690d49167aa837858f2174";
      })
    ];
    buildInputs =
      (self.nativeDeps."chalk" or []);
    deps = {
      "ansi-styles-1.1.0" = self.by-version."ansi-styles"."1.1.0";
      "escape-string-regexp-1.0.3" = self.by-version."escape-string-regexp"."1.0.3";
      "has-ansi-0.1.0" = self.by-version."has-ansi"."0.1.0";
      "strip-ansi-0.3.0" = self.by-version."strip-ansi"."0.3.0";
      "supports-color-0.2.0" = self.by-version."supports-color"."0.2.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "chalk" ];
  };
  by-spec."chalk"."^1.0.0" =
    self.by-version."chalk"."1.0.0";
  by-version."chalk"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "chalk-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/chalk/-/chalk-1.0.0.tgz";
        name = "chalk-1.0.0.tgz";
        sha1 = "b3cf4ed0ff5397c99c75b8f679db2f52831f96dc";
      })
    ];
    buildInputs =
      (self.nativeDeps."chalk" or []);
    deps = {
      "ansi-styles-2.0.1" = self.by-version."ansi-styles"."2.0.1";
      "escape-string-regexp-1.0.3" = self.by-version."escape-string-regexp"."1.0.3";
      "has-ansi-1.0.3" = self.by-version."has-ansi"."1.0.3";
      "strip-ansi-2.0.1" = self.by-version."strip-ansi"."2.0.1";
      "supports-color-1.3.1" = self.by-version."supports-color"."1.3.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "chalk" ];
  };
  by-spec."chmodr"."0.1.0" =
    self.by-version."chmodr"."0.1.0";
  by-version."chmodr"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "chmodr-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/chmodr/-/chmodr-0.1.0.tgz";
        name = "chmodr-0.1.0.tgz";
        sha1 = "e09215a1d51542db2a2576969765bcf6125583eb";
      })
    ];
    buildInputs =
      (self.nativeDeps."chmodr" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "chmodr" ];
  };
  by-spec."chownr"."0" =
    self.by-version."chownr"."0.0.2";
  by-version."chownr"."0.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "chownr-0.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/chownr/-/chownr-0.0.2.tgz";
        name = "chownr-0.0.2.tgz";
        sha1 = "2f9aebf746f90808ce00607b72ba73b41604c485";
      })
    ];
    buildInputs =
      (self.nativeDeps."chownr" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "chownr" ];
  };
  by-spec."cli-color"."~0.3.2" =
    self.by-version."cli-color"."0.3.3";
  by-version."cli-color"."0.3.3" = lib.makeOverridable self.buildNodePackage {
    name = "cli-color-0.3.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cli-color/-/cli-color-0.3.3.tgz";
        name = "cli-color-0.3.3.tgz";
        sha1 = "12d5bdd158ff8a0b0db401198913c03df069f6f5";
      })
    ];
    buildInputs =
      (self.nativeDeps."cli-color" or []);
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.7" = self.by-version."es5-ext"."0.10.7";
      "memoizee-0.3.8" = self.by-version."memoizee"."0.3.8";
      "timers-ext-0.1.0" = self.by-version."timers-ext"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "cli-color" ];
  };
  by-spec."cli-width"."^1.0.1" =
    self.by-version."cli-width"."1.0.1";
  by-version."cli-width"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "cli-width-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cli-width/-/cli-width-1.0.1.tgz";
        name = "cli-width-1.0.1.tgz";
        sha1 = "14d4f6870234d91e97f7dd81e76be8271410a1ef";
      })
    ];
    buildInputs =
      (self.nativeDeps."cli-width" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "cli-width" ];
  };
  by-spec."clone"."0.1.11" =
    self.by-version."clone"."0.1.11";
  by-version."clone"."0.1.11" = lib.makeOverridable self.buildNodePackage {
    name = "clone-0.1.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/clone/-/clone-0.1.11.tgz";
        name = "clone-0.1.11.tgz";
        sha1 = "408b7d1773eb0dfbf2ddb156c1c47170c17e3a96";
      })
    ];
    buildInputs =
      (self.nativeDeps."clone" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "clone" ];
  };
  by-spec."coffee-script"."*" =
    self.by-version."coffee-script"."1.9.2";
  by-version."coffee-script"."1.9.2" = lib.makeOverridable self.buildNodePackage {
    name = "coffee-script-1.9.2";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/coffee-script/-/coffee-script-1.9.2.tgz";
        name = "coffee-script-1.9.2.tgz";
        sha1 = "2da4b663c61c6d1d851788aa31f941fc7b63edf3";
      })
    ];
    buildInputs =
      (self.nativeDeps."coffee-script" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "coffee-script" ];
  };
  "coffee-script" = self.by-version."coffee-script"."1.9.2";
  by-spec."combined-stream"."~0.0.4" =
    self.by-version."combined-stream"."0.0.7";
  by-version."combined-stream"."0.0.7" = lib.makeOverridable self.buildNodePackage {
    name = "combined-stream-0.0.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/combined-stream/-/combined-stream-0.0.7.tgz";
        name = "combined-stream-0.0.7.tgz";
        sha1 = "0137e657baa5a7541c57ac37ac5fc07d73b4dc1f";
      })
    ];
    buildInputs =
      (self.nativeDeps."combined-stream" or []);
    deps = {
      "delayed-stream-0.0.5" = self.by-version."delayed-stream"."0.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "combined-stream" ];
  };
  by-spec."combined-stream"."~0.0.5" =
    self.by-version."combined-stream"."0.0.7";
  by-spec."commander"."^2.8.1" =
    self.by-version."commander"."2.8.1";
  by-version."commander"."2.8.1" = lib.makeOverridable self.buildNodePackage {
    name = "commander-2.8.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/commander/-/commander-2.8.1.tgz";
        name = "commander-2.8.1.tgz";
        sha1 = "06be367febfda0c330aa1e2a072d3dc9762425d4";
      })
    ];
    buildInputs =
      (self.nativeDeps."commander" or []);
    deps = {
      "graceful-readlink-1.0.1" = self.by-version."graceful-readlink"."1.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "commander" ];
  };
  by-spec."concat-map"."0.0.1" =
    self.by-version."concat-map"."0.0.1";
  by-version."concat-map"."0.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "concat-map-0.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
        name = "concat-map-0.0.1.tgz";
        sha1 = "d8a96bd77fd68df7793a73036a3ba0d5405d477b";
      })
    ];
    buildInputs =
      (self.nativeDeps."concat-map" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "concat-map" ];
  };
  by-spec."config-chain"."~1.1.1" =
    self.by-version."config-chain"."1.1.8";
  by-version."config-chain"."1.1.8" = lib.makeOverridable self.buildNodePackage {
    name = "config-chain-1.1.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/config-chain/-/config-chain-1.1.8.tgz";
        name = "config-chain-1.1.8.tgz";
        sha1 = "0943d0b7227213a20d4eaff4434f4a1c0a052cad";
      })
    ];
    buildInputs =
      (self.nativeDeps."config-chain" or []);
    deps = {
      "proto-list-1.2.4" = self.by-version."proto-list"."1.2.4";
      "ini-1.3.3" = self.by-version."ini"."1.3.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "config-chain" ];
  };
  by-spec."configstore"."^0.3.1" =
    self.by-version."configstore"."0.3.2";
  by-version."configstore"."0.3.2" = lib.makeOverridable self.buildNodePackage {
    name = "configstore-0.3.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/configstore/-/configstore-0.3.2.tgz";
        name = "configstore-0.3.2.tgz";
        sha1 = "25e4c16c3768abf75c5a65bc61761f495055b459";
      })
    ];
    buildInputs =
      (self.nativeDeps."configstore" or []);
    deps = {
      "graceful-fs-3.0.7" = self.by-version."graceful-fs"."3.0.7";
      "js-yaml-3.3.1" = self.by-version."js-yaml"."3.3.1";
      "mkdirp-0.5.1" = self.by-version."mkdirp"."0.5.1";
      "object-assign-2.0.0" = self.by-version."object-assign"."2.0.0";
      "osenv-0.1.1" = self.by-version."osenv"."0.1.1";
      "user-home-1.1.1" = self.by-version."user-home"."1.1.1";
      "uuid-2.0.1" = self.by-version."uuid"."2.0.1";
      "xdg-basedir-1.0.1" = self.by-version."xdg-basedir"."1.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "configstore" ];
  };
  by-spec."configstore"."^0.3.2" =
    self.by-version."configstore"."0.3.2";
  by-spec."core-util-is"."~1.0.0" =
    self.by-version."core-util-is"."1.0.1";
  by-version."core-util-is"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "core-util-is-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/core-util-is/-/core-util-is-1.0.1.tgz";
        name = "core-util-is-1.0.1.tgz";
        sha1 = "6b07085aef9a3ccac6ee53bf9d3df0c1521a5538";
      })
    ];
    buildInputs =
      (self.nativeDeps."core-util-is" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "core-util-is" ];
  };
  by-spec."couch-login"."~0.1.15" =
    self.by-version."couch-login"."0.1.20";
  by-version."couch-login"."0.1.20" = lib.makeOverridable self.buildNodePackage {
    name = "couch-login-0.1.20";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/couch-login/-/couch-login-0.1.20.tgz";
        name = "couch-login-0.1.20.tgz";
        sha1 = "007c70ef80089dbae6f59eeeec37480799b39595";
      })
    ];
    buildInputs =
      (self.nativeDeps."couch-login" or []);
    deps = {
      "request-2.55.0" = self.by-version."request"."2.55.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "couch-login" ];
  };
  by-spec."cryptiles"."0.2.x" =
    self.by-version."cryptiles"."0.2.2";
  by-version."cryptiles"."0.2.2" = lib.makeOverridable self.buildNodePackage {
    name = "cryptiles-0.2.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cryptiles/-/cryptiles-0.2.2.tgz";
        name = "cryptiles-0.2.2.tgz";
        sha1 = "ed91ff1f17ad13d3748288594f8a48a0d26f325c";
      })
    ];
    buildInputs =
      (self.nativeDeps."cryptiles" or []);
    deps = {
      "boom-0.4.2" = self.by-version."boom"."0.4.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "cryptiles" ];
  };
  by-spec."cryptiles"."2.x.x" =
    self.by-version."cryptiles"."2.0.4";
  by-version."cryptiles"."2.0.4" = lib.makeOverridable self.buildNodePackage {
    name = "cryptiles-2.0.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/cryptiles/-/cryptiles-2.0.4.tgz";
        name = "cryptiles-2.0.4.tgz";
        sha1 = "09ea1775b9e1c7de7e60a99d42ab6f08ce1a1285";
      })
    ];
    buildInputs =
      (self.nativeDeps."cryptiles" or []);
    deps = {
      "boom-2.7.2" = self.by-version."boom"."2.7.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "cryptiles" ];
  };
  by-spec."ctype"."0.5.3" =
    self.by-version."ctype"."0.5.3";
  by-version."ctype"."0.5.3" = lib.makeOverridable self.buildNodePackage {
    name = "ctype-0.5.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ctype/-/ctype-0.5.3.tgz";
        name = "ctype-0.5.3.tgz";
        sha1 = "82c18c2461f74114ef16c135224ad0b9144ca12f";
      })
    ];
    buildInputs =
      (self.nativeDeps."ctype" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ctype" ];
  };
  by-spec."d"."~0.1.1" =
    self.by-version."d"."0.1.1";
  by-version."d"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "d-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/d/-/d-0.1.1.tgz";
        name = "d-0.1.1.tgz";
        sha1 = "da184c535d18d8ee7ba2aa229b914009fae11309";
      })
    ];
    buildInputs =
      (self.nativeDeps."d" or []);
    deps = {
      "es5-ext-0.10.7" = self.by-version."es5-ext"."0.10.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "d" ];
  };
  by-spec."decamelize"."^1.0.0" =
    self.by-version."decamelize"."1.0.0";
  by-version."decamelize"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "decamelize-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/decamelize/-/decamelize-1.0.0.tgz";
        name = "decamelize-1.0.0.tgz";
        sha1 = "5287122f71691d4505b18ff2258dc400a5b23847";
      })
    ];
    buildInputs =
      (self.nativeDeps."decamelize" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "decamelize" ];
  };
  by-spec."decompress-zip"."^0.1.0" =
    self.by-version."decompress-zip"."0.1.0";
  by-version."decompress-zip"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "decompress-zip-0.1.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/decompress-zip/-/decompress-zip-0.1.0.tgz";
        name = "decompress-zip-0.1.0.tgz";
        sha1 = "bce60c11664f2d660fca4bcf634af6de5d6c14c7";
      })
    ];
    buildInputs =
      (self.nativeDeps."decompress-zip" or []);
    deps = {
      "binary-0.3.0" = self.by-version."binary"."0.3.0";
      "graceful-fs-3.0.7" = self.by-version."graceful-fs"."3.0.7";
      "mkpath-0.1.0" = self.by-version."mkpath"."0.1.0";
      "nopt-3.0.2" = self.by-version."nopt"."3.0.2";
      "q-1.4.1" = self.by-version."q"."1.4.1";
      "readable-stream-1.1.13" = self.by-version."readable-stream"."1.1.13";
      "touch-0.0.3" = self.by-version."touch"."0.0.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "decompress-zip" ];
  };
  by-spec."deep-extend"."~0.2.5" =
    self.by-version."deep-extend"."0.2.11";
  by-version."deep-extend"."0.2.11" = lib.makeOverridable self.buildNodePackage {
    name = "deep-extend-0.2.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/deep-extend/-/deep-extend-0.2.11.tgz";
        name = "deep-extend-0.2.11.tgz";
        sha1 = "7a16ba69729132340506170494bc83f7076fe08f";
      })
    ];
    buildInputs =
      (self.nativeDeps."deep-extend" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "deep-extend" ];
  };
  by-spec."delayed-stream"."0.0.5" =
    self.by-version."delayed-stream"."0.0.5";
  by-version."delayed-stream"."0.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "delayed-stream-0.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/delayed-stream/-/delayed-stream-0.0.5.tgz";
        name = "delayed-stream-0.0.5.tgz";
        sha1 = "d4b1f43a93e8296dfe02694f4680bc37a313c73f";
      })
    ];
    buildInputs =
      (self.nativeDeps."delayed-stream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "delayed-stream" ];
  };
  by-spec."delegates"."^0.1.0" =
    self.by-version."delegates"."0.1.0";
  by-version."delegates"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "delegates-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/delegates/-/delegates-0.1.0.tgz";
        name = "delegates-0.1.0.tgz";
        sha1 = "b4b57be11a1653517a04b27f0949bdc327dfe390";
      })
    ];
    buildInputs =
      (self.nativeDeps."delegates" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "delegates" ];
  };
  by-spec."duplexify"."^3.2.0" =
    self.by-version."duplexify"."3.4.0";
  by-version."duplexify"."3.4.0" = lib.makeOverridable self.buildNodePackage {
    name = "duplexify-3.4.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/duplexify/-/duplexify-3.4.0.tgz";
        name = "duplexify-3.4.0.tgz";
        sha1 = "830f7878a4c45818076104953930382cc7097833";
      })
    ];
    buildInputs =
      (self.nativeDeps."duplexify" or []);
    deps = {
      "end-of-stream-1.0.0" = self.by-version."end-of-stream"."1.0.0";
      "readable-stream-1.1.13" = self.by-version."readable-stream"."1.1.13";
    };
    peerDependencies = [
    ];
    passthru.names = [ "duplexify" ];
  };
  by-spec."end-of-stream"."1.0.0" =
    self.by-version."end-of-stream"."1.0.0";
  by-version."end-of-stream"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "end-of-stream-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/end-of-stream/-/end-of-stream-1.0.0.tgz";
        name = "end-of-stream-1.0.0.tgz";
        sha1 = "d4596e702734a93e40e9af864319eabd99ff2f0e";
      })
    ];
    buildInputs =
      (self.nativeDeps."end-of-stream" or []);
    deps = {
      "once-1.3.2" = self.by-version."once"."1.3.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "end-of-stream" ];
  };
  by-spec."end-of-stream"."^1.0.0" =
    self.by-version."end-of-stream"."1.1.0";
  by-version."end-of-stream"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "end-of-stream-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/end-of-stream/-/end-of-stream-1.1.0.tgz";
        name = "end-of-stream-1.1.0.tgz";
        sha1 = "e9353258baa9108965efc41cb0ef8ade2f3cfb07";
      })
    ];
    buildInputs =
      (self.nativeDeps."end-of-stream" or []);
    deps = {
      "once-1.3.2" = self.by-version."once"."1.3.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "end-of-stream" ];
  };
  by-spec."end-of-stream"."^1.1.0" =
    self.by-version."end-of-stream"."1.1.0";
  by-spec."es5-ext"."~0.10.2" =
    self.by-version."es5-ext"."0.10.7";
  by-version."es5-ext"."0.10.7" = lib.makeOverridable self.buildNodePackage {
    name = "es5-ext-0.10.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/es5-ext/-/es5-ext-0.10.7.tgz";
        name = "es5-ext-0.10.7.tgz";
        sha1 = "dfaea50721301042e2d89c1719d43493fa821656";
      })
    ];
    buildInputs =
      (self.nativeDeps."es5-ext" or []);
    deps = {
      "es6-iterator-0.1.3" = self.by-version."es6-iterator"."0.1.3";
      "es6-symbol-2.0.1" = self.by-version."es6-symbol"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "es5-ext" ];
  };
  by-spec."es5-ext"."~0.10.4" =
    self.by-version."es5-ext"."0.10.7";
  by-spec."es5-ext"."~0.10.5" =
    self.by-version."es5-ext"."0.10.7";
  by-spec."es5-ext"."~0.10.6" =
    self.by-version."es5-ext"."0.10.7";
  by-spec."es6-iterator"."~0.1.3" =
    self.by-version."es6-iterator"."0.1.3";
  by-version."es6-iterator"."0.1.3" = lib.makeOverridable self.buildNodePackage {
    name = "es6-iterator-0.1.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/es6-iterator/-/es6-iterator-0.1.3.tgz";
        name = "es6-iterator-0.1.3.tgz";
        sha1 = "d6f58b8c4fc413c249b4baa19768f8e4d7c8944e";
      })
    ];
    buildInputs =
      (self.nativeDeps."es6-iterator" or []);
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.7" = self.by-version."es5-ext"."0.10.7";
      "es6-symbol-2.0.1" = self.by-version."es6-symbol"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "es6-iterator" ];
  };
  by-spec."es6-symbol"."~2.0.1" =
    self.by-version."es6-symbol"."2.0.1";
  by-version."es6-symbol"."2.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "es6-symbol-2.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/es6-symbol/-/es6-symbol-2.0.1.tgz";
        name = "es6-symbol-2.0.1.tgz";
        sha1 = "761b5c67cfd4f1d18afb234f691d678682cb3bf3";
      })
    ];
    buildInputs =
      (self.nativeDeps."es6-symbol" or []);
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.7" = self.by-version."es5-ext"."0.10.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "es6-symbol" ];
  };
  by-spec."es6-weak-map"."~0.1.2" =
    self.by-version."es6-weak-map"."0.1.4";
  by-version."es6-weak-map"."0.1.4" = lib.makeOverridable self.buildNodePackage {
    name = "es6-weak-map-0.1.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/es6-weak-map/-/es6-weak-map-0.1.4.tgz";
        name = "es6-weak-map-0.1.4.tgz";
        sha1 = "706cef9e99aa236ba7766c239c8b9e286ea7d228";
      })
    ];
    buildInputs =
      (self.nativeDeps."es6-weak-map" or []);
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.7" = self.by-version."es5-ext"."0.10.7";
      "es6-iterator-0.1.3" = self.by-version."es6-iterator"."0.1.3";
      "es6-symbol-2.0.1" = self.by-version."es6-symbol"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "es6-weak-map" ];
  };
  by-spec."escape-string-regexp"."^1.0.0" =
    self.by-version."escape-string-regexp"."1.0.3";
  by-version."escape-string-regexp"."1.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "escape-string-regexp-1.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.3.tgz";
        name = "escape-string-regexp-1.0.3.tgz";
        sha1 = "9e2d8b25bc2555c3336723750e03f099c2735bb5";
      })
    ];
    buildInputs =
      (self.nativeDeps."escape-string-regexp" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "escape-string-regexp" ];
  };
  by-spec."escape-string-regexp"."^1.0.2" =
    self.by-version."escape-string-regexp"."1.0.3";
  by-spec."esprima"."~1.0.4" =
    self.by-version."esprima"."1.0.4";
  by-version."esprima"."1.0.4" = lib.makeOverridable self.buildNodePackage {
    name = "esprima-1.0.4";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/esprima/-/esprima-1.0.4.tgz";
        name = "esprima-1.0.4.tgz";
        sha1 = "9f557e08fc3b4d26ece9dd34f8fbf476b62585ad";
      })
    ];
    buildInputs =
      (self.nativeDeps."esprima" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "esprima" ];
  };
  by-spec."esprima"."~2.2.0" =
    self.by-version."esprima"."2.2.0";
  by-version."esprima"."2.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "esprima-2.2.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/esprima/-/esprima-2.2.0.tgz";
        name = "esprima-2.2.0.tgz";
        sha1 = "4292c1d68e4173d815fa2290dc7afc96d81fcd83";
      })
    ];
    buildInputs =
      (self.nativeDeps."esprima" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "esprima" ];
  };
  by-spec."event-emitter"."~0.3.1" =
    self.by-version."event-emitter"."0.3.3";
  by-version."event-emitter"."0.3.3" = lib.makeOverridable self.buildNodePackage {
    name = "event-emitter-0.3.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/event-emitter/-/event-emitter-0.3.3.tgz";
        name = "event-emitter-0.3.3.tgz";
        sha1 = "df8e806541c68ab8ff20a79a1841b91abaa1bee4";
      })
    ];
    buildInputs =
      (self.nativeDeps."event-emitter" or []);
    deps = {
      "es5-ext-0.10.7" = self.by-version."es5-ext"."0.10.7";
      "d-0.1.1" = self.by-version."d"."0.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "event-emitter" ];
  };
  by-spec."fetch-bower"."*" =
    self.by-version."fetch-bower"."2.0.0";
  by-version."fetch-bower"."2.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "fetch-bower-2.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/fetch-bower/-/fetch-bower-2.0.0.tgz";
        name = "fetch-bower-2.0.0.tgz";
        sha1 = "c027feb75a512001d1287bbfb3ffaafba67eb92f";
      })
    ];
    buildInputs =
      (self.nativeDeps."fetch-bower" or []);
    deps = {
      "bower-endpoint-parser-0.2.1" = self.by-version."bower-endpoint-parser"."0.2.1";
      "bower-logger-0.2.1" = self.by-version."bower-logger"."0.2.1";
      "bower-1.4.1" = self.by-version."bower"."1.4.1";
      "glob-3.2.11" = self.by-version."glob"."3.2.11";
    };
    peerDependencies = [
    ];
    passthru.names = [ "fetch-bower" ];
  };
  "fetch-bower" = self.by-version."fetch-bower"."2.0.0";
  by-spec."fetch-bower".">=2 <3" =
    self.by-version."fetch-bower"."2.0.0";
  by-spec."figures"."^1.3.2" =
    self.by-version."figures"."1.3.5";
  by-version."figures"."1.3.5" = lib.makeOverridable self.buildNodePackage {
    name = "figures-1.3.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/figures/-/figures-1.3.5.tgz";
        name = "figures-1.3.5.tgz";
        sha1 = "d1a31f4e1d2c2938ecde5c06aa16134cf29f4771";
      })
    ];
    buildInputs =
      (self.nativeDeps."figures" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "figures" ];
  };
  by-spec."figures"."^1.3.5" =
    self.by-version."figures"."1.3.5";
  by-spec."findit".">=1.1.0 <2.0.0" =
    self.by-version."findit"."1.2.0";
  by-version."findit"."1.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "findit-1.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/findit/-/findit-1.2.0.tgz";
        name = "findit-1.2.0.tgz";
        sha1 = "f571a3a840749ae8b0cbf4bf43ced7659eec3ce8";
      })
    ];
    buildInputs =
      (self.nativeDeps."findit" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "findit" ];
  };
  by-spec."foreachasync"."^3.0.0" =
    self.by-version."foreachasync"."3.0.0";
  by-version."foreachasync"."3.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "foreachasync-3.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/foreachasync/-/foreachasync-3.0.0.tgz";
        name = "foreachasync-3.0.0.tgz";
        sha1 = "5502987dc8714be3392097f32e0071c9dee07cf6";
      })
    ];
    buildInputs =
      (self.nativeDeps."foreachasync" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "foreachasync" ];
  };
  by-spec."forever-agent"."~0.5.0" =
    self.by-version."forever-agent"."0.5.2";
  by-version."forever-agent"."0.5.2" = lib.makeOverridable self.buildNodePackage {
    name = "forever-agent-0.5.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/forever-agent/-/forever-agent-0.5.2.tgz";
        name = "forever-agent-0.5.2.tgz";
        sha1 = "6d0e09c4921f94a27f63d3b49c5feff1ea4c5130";
      })
    ];
    buildInputs =
      (self.nativeDeps."forever-agent" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "forever-agent" ];
  };
  by-spec."forever-agent"."~0.6.0" =
    self.by-version."forever-agent"."0.6.1";
  by-version."forever-agent"."0.6.1" = lib.makeOverridable self.buildNodePackage {
    name = "forever-agent-0.6.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/forever-agent/-/forever-agent-0.6.1.tgz";
        name = "forever-agent-0.6.1.tgz";
        sha1 = "fbc71f0c41adeb37f96c577ad1ed42d8fdacca91";
      })
    ];
    buildInputs =
      (self.nativeDeps."forever-agent" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "forever-agent" ];
  };
  by-spec."form-data"."~0.2.0" =
    self.by-version."form-data"."0.2.0";
  by-version."form-data"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "form-data-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/form-data/-/form-data-0.2.0.tgz";
        name = "form-data-0.2.0.tgz";
        sha1 = "26f8bc26da6440e299cbdcfb69035c4f77a6e466";
      })
    ];
    buildInputs =
      (self.nativeDeps."form-data" or []);
    deps = {
      "async-0.9.2" = self.by-version."async"."0.9.2";
      "combined-stream-0.0.7" = self.by-version."combined-stream"."0.0.7";
      "mime-types-2.0.12" = self.by-version."mime-types"."2.0.12";
    };
    peerDependencies = [
    ];
    passthru.names = [ "form-data" ];
  };
  by-spec."fs-extra"."~0.6.1" =
    self.by-version."fs-extra"."0.6.4";
  by-version."fs-extra"."0.6.4" = lib.makeOverridable self.buildNodePackage {
    name = "fs-extra-0.6.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/fs-extra/-/fs-extra-0.6.4.tgz";
        name = "fs-extra-0.6.4.tgz";
        sha1 = "f46f0c75b7841f8d200b3348cd4d691d5a099d15";
      })
    ];
    buildInputs =
      (self.nativeDeps."fs-extra" or []);
    deps = {
      "ncp-0.4.2" = self.by-version."ncp"."0.4.2";
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
      "jsonfile-1.0.1" = self.by-version."jsonfile"."1.0.1";
      "rimraf-2.2.8" = self.by-version."rimraf"."2.2.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "fs-extra" ];
  };
  by-spec."fs.extra".">=1.2.0 <2.0.0" =
    self.by-version."fs.extra"."1.3.2";
  by-version."fs.extra"."1.3.2" = lib.makeOverridable self.buildNodePackage {
    name = "fs.extra-1.3.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/fs.extra/-/fs.extra-1.3.2.tgz";
        name = "fs.extra-1.3.2.tgz";
        sha1 = "dd023f93013bee24531f1b33514c37b20fd93349";
      })
    ];
    buildInputs =
      (self.nativeDeps."fs.extra" or []);
    deps = {
      "fs-extra-0.6.4" = self.by-version."fs-extra"."0.6.4";
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
      "walk-2.3.9" = self.by-version."walk"."2.3.9";
    };
    peerDependencies = [
    ];
    passthru.names = [ "fs.extra" ];
  };
  by-spec."fs.extra".">=1.2.1 <2" =
    self.by-version."fs.extra"."1.3.2";
  by-spec."fstream"."^1.0.0" =
    self.by-version."fstream"."1.0.6";
  by-version."fstream"."1.0.6" = lib.makeOverridable self.buildNodePackage {
    name = "fstream-1.0.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/fstream/-/fstream-1.0.6.tgz";
        name = "fstream-1.0.6.tgz";
        sha1 = "817e50312fb4ed90da865c8eb5ecd1d1d7aed0ec";
      })
    ];
    buildInputs =
      (self.nativeDeps."fstream" or []);
    deps = {
      "graceful-fs-3.0.7" = self.by-version."graceful-fs"."3.0.7";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "mkdirp-0.5.1" = self.by-version."mkdirp"."0.5.1";
      "rimraf-2.3.4" = self.by-version."rimraf"."2.3.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "fstream" ];
  };
  by-spec."fstream"."^1.0.3" =
    self.by-version."fstream"."1.0.6";
  by-spec."fstream"."~0.1.8" =
    self.by-version."fstream"."0.1.31";
  by-version."fstream"."0.1.31" = lib.makeOverridable self.buildNodePackage {
    name = "fstream-0.1.31";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/fstream/-/fstream-0.1.31.tgz";
        name = "fstream-0.1.31.tgz";
        sha1 = "7337f058fbbbbefa8c9f561a28cab0849202c988";
      })
    ];
    buildInputs =
      (self.nativeDeps."fstream" or []);
    deps = {
      "graceful-fs-3.0.7" = self.by-version."graceful-fs"."3.0.7";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "mkdirp-0.5.1" = self.by-version."mkdirp"."0.5.1";
      "rimraf-2.3.4" = self.by-version."rimraf"."2.3.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "fstream" ];
  };
  by-spec."fstream-ignore"."^1.0.2" =
    self.by-version."fstream-ignore"."1.0.2";
  by-version."fstream-ignore"."1.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "fstream-ignore-1.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/fstream-ignore/-/fstream-ignore-1.0.2.tgz";
        name = "fstream-ignore-1.0.2.tgz";
        sha1 = "18c891db01b782a74a7bff936a0f24997741c7ab";
      })
    ];
    buildInputs =
      (self.nativeDeps."fstream-ignore" or []);
    deps = {
      "fstream-1.0.6" = self.by-version."fstream"."1.0.6";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "minimatch-2.0.8" = self.by-version."minimatch"."2.0.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "fstream-ignore" ];
  };
  by-spec."gauge"."~1.2.0" =
    self.by-version."gauge"."1.2.0";
  by-version."gauge"."1.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "gauge-1.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/gauge/-/gauge-1.2.0.tgz";
        name = "gauge-1.2.0.tgz";
        sha1 = "3094ab1285633f799814388fc8f2de67b4c012c5";
      })
    ];
    buildInputs =
      (self.nativeDeps."gauge" or []);
    deps = {
      "ansi-0.3.0" = self.by-version."ansi"."0.3.0";
      "has-unicode-1.0.0" = self.by-version."has-unicode"."1.0.0";
      "lodash.pad-3.1.0" = self.by-version."lodash.pad"."3.1.0";
      "lodash.padleft-3.1.1" = self.by-version."lodash.padleft"."3.1.1";
      "lodash.padright-3.1.1" = self.by-version."lodash.padright"."3.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "gauge" ];
  };
  by-spec."generate-function"."^2.0.0" =
    self.by-version."generate-function"."2.0.0";
  by-version."generate-function"."2.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "generate-function-2.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/generate-function/-/generate-function-2.0.0.tgz";
        name = "generate-function-2.0.0.tgz";
        sha1 = "6858fe7c0969b7d4e9093337647ac79f60dfbe74";
      })
    ];
    buildInputs =
      (self.nativeDeps."generate-function" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "generate-function" ];
  };
  by-spec."generate-object-property"."^1.1.0" =
    self.by-version."generate-object-property"."1.2.0";
  by-version."generate-object-property"."1.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "generate-object-property-1.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/generate-object-property/-/generate-object-property-1.2.0.tgz";
        name = "generate-object-property-1.2.0.tgz";
        sha1 = "9c0e1c40308ce804f4783618b937fa88f99d50d0";
      })
    ];
    buildInputs =
      (self.nativeDeps."generate-object-property" or []);
    deps = {
      "is-property-1.0.2" = self.by-version."is-property"."1.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "generate-object-property" ];
  };
  by-spec."get-stdin"."^4.0.1" =
    self.by-version."get-stdin"."4.0.1";
  by-version."get-stdin"."4.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "get-stdin-4.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/get-stdin/-/get-stdin-4.0.1.tgz";
        name = "get-stdin-4.0.1.tgz";
        sha1 = "b968c6b0a04384324902e8bf1a5df32579a450fe";
      })
    ];
    buildInputs =
      (self.nativeDeps."get-stdin" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "get-stdin" ];
  };
  by-spec."github"."^0.2.3" =
    self.by-version."github"."0.2.4";
  by-version."github"."0.2.4" = lib.makeOverridable self.buildNodePackage {
    name = "github-0.2.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/github/-/github-0.2.4.tgz";
        name = "github-0.2.4.tgz";
        sha1 = "24fa7f0e13fa11b946af91134c51982a91ce538b";
      })
    ];
    buildInputs =
      (self.nativeDeps."github" or []);
    deps = {
      "mime-1.3.4" = self.by-version."mime"."1.3.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "github" ];
  };
  by-spec."glob".">=3.2.7 <4" =
    self.by-version."glob"."3.2.11";
  by-version."glob"."3.2.11" = lib.makeOverridable self.buildNodePackage {
    name = "glob-3.2.11";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/glob/-/glob-3.2.11.tgz";
        name = "glob-3.2.11.tgz";
        sha1 = "4a973f635b9190f715d10987d5c00fd2815ebe3d";
      })
    ];
    buildInputs =
      (self.nativeDeps."glob" or []);
    deps = {
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "minimatch-0.3.0" = self.by-version."minimatch"."0.3.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "glob" ];
  };
  by-spec."glob"."^4.3.2" =
    self.by-version."glob"."4.5.3";
  by-version."glob"."4.5.3" = lib.makeOverridable self.buildNodePackage {
    name = "glob-4.5.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/glob/-/glob-4.5.3.tgz";
        name = "glob-4.5.3.tgz";
        sha1 = "c6cb73d3226c1efef04de3c56d012f03377ee15f";
      })
    ];
    buildInputs =
      (self.nativeDeps."glob" or []);
    deps = {
      "inflight-1.0.4" = self.by-version."inflight"."1.0.4";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "minimatch-2.0.8" = self.by-version."minimatch"."2.0.8";
      "once-1.3.2" = self.by-version."once"."1.3.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "glob" ];
  };
  by-spec."glob"."^4.4.2" =
    self.by-version."glob"."4.5.3";
  by-spec."got"."^2.4.0" =
    self.by-version."got"."2.9.2";
  by-version."got"."2.9.2" = lib.makeOverridable self.buildNodePackage {
    name = "got-2.9.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/got/-/got-2.9.2.tgz";
        name = "got-2.9.2.tgz";
        sha1 = "2e1ee58ea1e8d201e25ae580b96e63c15fefd4ee";
      })
    ];
    buildInputs =
      (self.nativeDeps."got" or []);
    deps = {
      "duplexify-3.4.0" = self.by-version."duplexify"."3.4.0";
      "infinity-agent-2.0.3" = self.by-version."infinity-agent"."2.0.3";
      "is-stream-1.0.1" = self.by-version."is-stream"."1.0.1";
      "lowercase-keys-1.0.0" = self.by-version."lowercase-keys"."1.0.0";
      "nested-error-stacks-1.0.0" = self.by-version."nested-error-stacks"."1.0.0";
      "object-assign-2.0.0" = self.by-version."object-assign"."2.0.0";
      "prepend-http-1.0.1" = self.by-version."prepend-http"."1.0.1";
      "read-all-stream-2.1.2" = self.by-version."read-all-stream"."2.1.2";
      "statuses-1.2.1" = self.by-version."statuses"."1.2.1";
      "timed-out-2.0.0" = self.by-version."timed-out"."2.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "got" ];
  };
  by-spec."graceful-fs"."3" =
    self.by-version."graceful-fs"."3.0.7";
  by-version."graceful-fs"."3.0.7" = lib.makeOverridable self.buildNodePackage {
    name = "graceful-fs-3.0.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/graceful-fs/-/graceful-fs-3.0.7.tgz";
        name = "graceful-fs-3.0.7.tgz";
        sha1 = "e935be4b3e57892d289dc3bef7be8c02779d2b54";
      })
    ];
    buildInputs =
      (self.nativeDeps."graceful-fs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "graceful-fs" ];
  };
  by-spec."graceful-fs"."^3.0.0" =
    self.by-version."graceful-fs"."3.0.7";
  by-spec."graceful-fs"."^3.0.1" =
    self.by-version."graceful-fs"."3.0.7";
  by-spec."graceful-fs"."^3.0.5" =
    self.by-version."graceful-fs"."3.0.7";
  by-spec."graceful-fs"."~1" =
    self.by-version."graceful-fs"."1.2.3";
  by-version."graceful-fs"."1.2.3" = lib.makeOverridable self.buildNodePackage {
    name = "graceful-fs-1.2.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/graceful-fs/-/graceful-fs-1.2.3.tgz";
        name = "graceful-fs-1.2.3.tgz";
        sha1 = "15a4806a57547cb2d2dbf27f42e89a8c3451b364";
      })
    ];
    buildInputs =
      (self.nativeDeps."graceful-fs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "graceful-fs" ];
  };
  by-spec."graceful-fs"."~2.0.0" =
    self.by-version."graceful-fs"."2.0.3";
  by-version."graceful-fs"."2.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "graceful-fs-2.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/graceful-fs/-/graceful-fs-2.0.3.tgz";
        name = "graceful-fs-2.0.3.tgz";
        sha1 = "7cd2cdb228a4a3f36e95efa6cc142de7d1a136d0";
      })
    ];
    buildInputs =
      (self.nativeDeps."graceful-fs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "graceful-fs" ];
  };
  by-spec."graceful-fs"."~3.0.2" =
    self.by-version."graceful-fs"."3.0.7";
  by-spec."graceful-readlink".">= 1.0.0" =
    self.by-version."graceful-readlink"."1.0.1";
  by-version."graceful-readlink"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "graceful-readlink-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/graceful-readlink/-/graceful-readlink-1.0.1.tgz";
        name = "graceful-readlink-1.0.1.tgz";
        sha1 = "4cafad76bc62f02fa039b2f94e9a3dd3a391a725";
      })
    ];
    buildInputs =
      (self.nativeDeps."graceful-readlink" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "graceful-readlink" ];
  };
  by-spec."handlebars"."^2.0.0" =
    self.by-version."handlebars"."2.0.0";
  by-version."handlebars"."2.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "handlebars-2.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/handlebars/-/handlebars-2.0.0.tgz";
        name = "handlebars-2.0.0.tgz";
        sha1 = "6e9d7f8514a3467fa5e9f82cc158ecfc1d5ac76f";
      })
    ];
    buildInputs =
      (self.nativeDeps."handlebars" or []);
    deps = {
      "optimist-0.3.7" = self.by-version."optimist"."0.3.7";
      "uglify-js-2.3.6" = self.by-version."uglify-js"."2.3.6";
    };
    peerDependencies = [
    ];
    passthru.names = [ "handlebars" ];
  };
  by-spec."har-validator"."^1.4.0" =
    self.by-version."har-validator"."1.7.0";
  by-version."har-validator"."1.7.0" = lib.makeOverridable self.buildNodePackage {
    name = "har-validator-1.7.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/har-validator/-/har-validator-1.7.0.tgz";
        name = "har-validator-1.7.0.tgz";
        sha1 = "563f8c58edca6410e2e408b0e540161da580dc46";
      })
    ];
    buildInputs =
      (self.nativeDeps."har-validator" or []);
    deps = {
      "bluebird-2.9.26" = self.by-version."bluebird"."2.9.26";
      "chalk-1.0.0" = self.by-version."chalk"."1.0.0";
      "commander-2.8.1" = self.by-version."commander"."2.8.1";
      "is-my-json-valid-2.12.0" = self.by-version."is-my-json-valid"."2.12.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "har-validator" ];
  };
  by-spec."has-ansi"."^0.1.0" =
    self.by-version."has-ansi"."0.1.0";
  by-version."has-ansi"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "has-ansi-0.1.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/has-ansi/-/has-ansi-0.1.0.tgz";
        name = "has-ansi-0.1.0.tgz";
        sha1 = "84f265aae8c0e6a88a12d7022894b7568894c62e";
      })
    ];
    buildInputs =
      (self.nativeDeps."has-ansi" or []);
    deps = {
      "ansi-regex-0.2.1" = self.by-version."ansi-regex"."0.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "has-ansi" ];
  };
  by-spec."has-ansi"."^1.0.3" =
    self.by-version."has-ansi"."1.0.3";
  by-version."has-ansi"."1.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "has-ansi-1.0.3";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/has-ansi/-/has-ansi-1.0.3.tgz";
        name = "has-ansi-1.0.3.tgz";
        sha1 = "c0b5b1615d9e382b0ff67169d967b425e48ca538";
      })
    ];
    buildInputs =
      (self.nativeDeps."has-ansi" or []);
    deps = {
      "ansi-regex-1.1.1" = self.by-version."ansi-regex"."1.1.1";
      "get-stdin-4.0.1" = self.by-version."get-stdin"."4.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "has-ansi" ];
  };
  by-spec."has-unicode"."^1.0.0" =
    self.by-version."has-unicode"."1.0.0";
  by-version."has-unicode"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "has-unicode-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/has-unicode/-/has-unicode-1.0.0.tgz";
        name = "has-unicode-1.0.0.tgz";
        sha1 = "bac5c44e064c2ffc3b8fcbd8c71afe08f9afc8cc";
      })
    ];
    buildInputs =
      (self.nativeDeps."has-unicode" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "has-unicode" ];
  };
  by-spec."hawk"."1.1.1" =
    self.by-version."hawk"."1.1.1";
  by-version."hawk"."1.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "hawk-1.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/hawk/-/hawk-1.1.1.tgz";
        name = "hawk-1.1.1.tgz";
        sha1 = "87cd491f9b46e4e2aeaca335416766885d2d1ed9";
      })
    ];
    buildInputs =
      (self.nativeDeps."hawk" or []);
    deps = {
      "hoek-0.9.1" = self.by-version."hoek"."0.9.1";
      "boom-0.4.2" = self.by-version."boom"."0.4.2";
      "cryptiles-0.2.2" = self.by-version."cryptiles"."0.2.2";
      "sntp-0.2.4" = self.by-version."sntp"."0.2.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "hawk" ];
  };
  by-spec."hawk"."~2.3.0" =
    self.by-version."hawk"."2.3.1";
  by-version."hawk"."2.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "hawk-2.3.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/hawk/-/hawk-2.3.1.tgz";
        name = "hawk-2.3.1.tgz";
        sha1 = "1e731ce39447fa1d0f6d707f7bceebec0fd1ec1f";
      })
    ];
    buildInputs =
      (self.nativeDeps."hawk" or []);
    deps = {
      "hoek-2.14.0" = self.by-version."hoek"."2.14.0";
      "boom-2.7.2" = self.by-version."boom"."2.7.2";
      "cryptiles-2.0.4" = self.by-version."cryptiles"."2.0.4";
      "sntp-1.0.9" = self.by-version."sntp"."1.0.9";
    };
    peerDependencies = [
    ];
    passthru.names = [ "hawk" ];
  };
  by-spec."hoek"."0.9.x" =
    self.by-version."hoek"."0.9.1";
  by-version."hoek"."0.9.1" = lib.makeOverridable self.buildNodePackage {
    name = "hoek-0.9.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/hoek/-/hoek-0.9.1.tgz";
        name = "hoek-0.9.1.tgz";
        sha1 = "3d322462badf07716ea7eb85baf88079cddce505";
      })
    ];
    buildInputs =
      (self.nativeDeps."hoek" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "hoek" ];
  };
  by-spec."hoek"."2.x.x" =
    self.by-version."hoek"."2.14.0";
  by-version."hoek"."2.14.0" = lib.makeOverridable self.buildNodePackage {
    name = "hoek-2.14.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/hoek/-/hoek-2.14.0.tgz";
        name = "hoek-2.14.0.tgz";
        sha1 = "81211691f52a5a835ae49edbf1e89c9003476aa4";
      })
    ];
    buildInputs =
      (self.nativeDeps."hoek" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "hoek" ];
  };
  by-spec."http-signature"."~0.10.0" =
    self.by-version."http-signature"."0.10.1";
  by-version."http-signature"."0.10.1" = lib.makeOverridable self.buildNodePackage {
    name = "http-signature-0.10.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/http-signature/-/http-signature-0.10.1.tgz";
        name = "http-signature-0.10.1.tgz";
        sha1 = "4fbdac132559aa8323121e540779c0a012b27e66";
      })
    ];
    buildInputs =
      (self.nativeDeps."http-signature" or []);
    deps = {
      "assert-plus-0.1.5" = self.by-version."assert-plus"."0.1.5";
      "asn1-0.1.11" = self.by-version."asn1"."0.1.11";
      "ctype-0.5.3" = self.by-version."ctype"."0.5.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "http-signature" ];
  };
  by-spec."infinity-agent"."^2.0.0" =
    self.by-version."infinity-agent"."2.0.3";
  by-version."infinity-agent"."2.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "infinity-agent-2.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/infinity-agent/-/infinity-agent-2.0.3.tgz";
        name = "infinity-agent-2.0.3.tgz";
        sha1 = "45e0e2ff7a9eb030b27d62b74b3744b7a7ac4216";
      })
    ];
    buildInputs =
      (self.nativeDeps."infinity-agent" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "infinity-agent" ];
  };
  by-spec."inflight"."^1.0.4" =
    self.by-version."inflight"."1.0.4";
  by-version."inflight"."1.0.4" = lib.makeOverridable self.buildNodePackage {
    name = "inflight-1.0.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/inflight/-/inflight-1.0.4.tgz";
        name = "inflight-1.0.4.tgz";
        sha1 = "6cbb4521ebd51ce0ec0a936bfd7657ef7e9b172a";
      })
    ];
    buildInputs =
      (self.nativeDeps."inflight" or []);
    deps = {
      "once-1.3.2" = self.by-version."once"."1.3.2";
      "wrappy-1.0.1" = self.by-version."wrappy"."1.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "inflight" ];
  };
  by-spec."inherits"."1.x" =
    self.by-version."inherits"."1.0.0";
  by-version."inherits"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "inherits-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/inherits/-/inherits-1.0.0.tgz";
        name = "inherits-1.0.0.tgz";
        sha1 = "38e1975285bf1f7ba9c84da102bb12771322ac48";
      })
    ];
    buildInputs =
      (self.nativeDeps."inherits" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "inherits" ];
  };
  by-spec."inherits"."2" =
    self.by-version."inherits"."2.0.1";
  by-version."inherits"."2.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "inherits-2.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/inherits/-/inherits-2.0.1.tgz";
        name = "inherits-2.0.1.tgz";
        sha1 = "b17d08d326b4423e568eff719f91b0b1cbdf69f1";
      })
    ];
    buildInputs =
      (self.nativeDeps."inherits" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "inherits" ];
  };
  by-spec."inherits"."~1.0.0" =
    self.by-version."inherits"."1.0.0";
  by-spec."inherits"."~2.0.0" =
    self.by-version."inherits"."2.0.1";
  by-spec."inherits"."~2.0.1" =
    self.by-version."inherits"."2.0.1";
  by-spec."ini"."1" =
    self.by-version."ini"."1.3.3";
  by-version."ini"."1.3.3" = lib.makeOverridable self.buildNodePackage {
    name = "ini-1.3.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ini/-/ini-1.3.3.tgz";
        name = "ini-1.3.3.tgz";
        sha1 = "c07e34aef1de06aff21d413b458e52b21533a11e";
      })
    ];
    buildInputs =
      (self.nativeDeps."ini" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ini" ];
  };
  by-spec."ini"."~1.1.0" =
    self.by-version."ini"."1.1.0";
  by-version."ini"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "ini-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ini/-/ini-1.1.0.tgz";
        name = "ini-1.1.0.tgz";
        sha1 = "4e808c2ce144c6c1788918e034d6797bc6cf6281";
      })
    ];
    buildInputs =
      (self.nativeDeps."ini" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ini" ];
  };
  by-spec."ini"."~1.3.0" =
    self.by-version."ini"."1.3.3";
  by-spec."inquirer"."0.8.0" =
    self.by-version."inquirer"."0.8.0";
  by-version."inquirer"."0.8.0" = lib.makeOverridable self.buildNodePackage {
    name = "inquirer-0.8.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/inquirer/-/inquirer-0.8.0.tgz";
        name = "inquirer-0.8.0.tgz";
        sha1 = "525d4dd827d4f3d506b453726068f90deb99b443";
      })
    ];
    buildInputs =
      (self.nativeDeps."inquirer" or []);
    deps = {
      "ansi-regex-1.1.1" = self.by-version."ansi-regex"."1.1.1";
      "chalk-0.5.1" = self.by-version."chalk"."0.5.1";
      "cli-color-0.3.3" = self.by-version."cli-color"."0.3.3";
      "figures-1.3.5" = self.by-version."figures"."1.3.5";
      "lodash-2.4.2" = self.by-version."lodash"."2.4.2";
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
      "readline2-0.1.1" = self.by-version."readline2"."0.1.1";
      "rx-2.5.2" = self.by-version."rx"."2.5.2";
      "through-2.3.7" = self.by-version."through"."2.3.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "inquirer" ];
  };
  by-spec."inquirer"."^0.8.0" =
    self.by-version."inquirer"."0.8.5";
  by-version."inquirer"."0.8.5" = lib.makeOverridable self.buildNodePackage {
    name = "inquirer-0.8.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/inquirer/-/inquirer-0.8.5.tgz";
        name = "inquirer-0.8.5.tgz";
        sha1 = "dbd740cf6ca3b731296a63ce6f6d961851f336df";
      })
    ];
    buildInputs =
      (self.nativeDeps."inquirer" or []);
    deps = {
      "ansi-regex-1.1.1" = self.by-version."ansi-regex"."1.1.1";
      "chalk-1.0.0" = self.by-version."chalk"."1.0.0";
      "cli-width-1.0.1" = self.by-version."cli-width"."1.0.1";
      "figures-1.3.5" = self.by-version."figures"."1.3.5";
      "lodash-3.9.3" = self.by-version."lodash"."3.9.3";
      "readline2-0.1.1" = self.by-version."readline2"."0.1.1";
      "rx-2.5.2" = self.by-version."rx"."2.5.2";
      "through-2.3.7" = self.by-version."through"."2.3.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "inquirer" ];
  };
  by-spec."insight"."^0.5.0" =
    self.by-version."insight"."0.5.3";
  by-version."insight"."0.5.3" = lib.makeOverridable self.buildNodePackage {
    name = "insight-0.5.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/insight/-/insight-0.5.3.tgz";
        name = "insight-0.5.3.tgz";
        sha1 = "353626c1b86b12c7bdfecb0a54ef80cd7e6f89e0";
      })
    ];
    buildInputs =
      (self.nativeDeps."insight" or []);
    deps = {
      "async-0.9.2" = self.by-version."async"."0.9.2";
      "chalk-1.0.0" = self.by-version."chalk"."1.0.0";
      "configstore-0.3.2" = self.by-version."configstore"."0.3.2";
      "inquirer-0.8.5" = self.by-version."inquirer"."0.8.5";
      "lodash.debounce-3.1.0" = self.by-version."lodash.debounce"."3.1.0";
      "object-assign-2.0.0" = self.by-version."object-assign"."2.0.0";
      "os-name-1.0.3" = self.by-version."os-name"."1.0.3";
      "request-2.55.0" = self.by-version."request"."2.55.0";
      "tough-cookie-0.12.1" = self.by-version."tough-cookie"."0.12.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "insight" ];
  };
  by-spec."intersect"."~0.0.3" =
    self.by-version."intersect"."0.0.3";
  by-version."intersect"."0.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "intersect-0.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/intersect/-/intersect-0.0.3.tgz";
        name = "intersect-0.0.3.tgz";
        sha1 = "c1a4a5e5eac6ede4af7504cc07e0ada7bc9f4920";
      })
    ];
    buildInputs =
      (self.nativeDeps."intersect" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "intersect" ];
  };
  by-spec."is-absolute"."^0.1.7" =
    self.by-version."is-absolute"."0.1.7";
  by-version."is-absolute"."0.1.7" = lib.makeOverridable self.buildNodePackage {
    name = "is-absolute-0.1.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/is-absolute/-/is-absolute-0.1.7.tgz";
        name = "is-absolute-0.1.7.tgz";
        sha1 = "847491119fccb5fb436217cc737f7faad50f603f";
      })
    ];
    buildInputs =
      (self.nativeDeps."is-absolute" or []);
    deps = {
      "is-relative-0.1.3" = self.by-version."is-relative"."0.1.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "is-absolute" ];
  };
  by-spec."is-my-json-valid"."^2.10.1" =
    self.by-version."is-my-json-valid"."2.12.0";
  by-version."is-my-json-valid"."2.12.0" = lib.makeOverridable self.buildNodePackage {
    name = "is-my-json-valid-2.12.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/is-my-json-valid/-/is-my-json-valid-2.12.0.tgz";
        name = "is-my-json-valid-2.12.0.tgz";
        sha1 = "8fa6c408b26be95b45a23e8f8c4b464a53874d2b";
      })
    ];
    buildInputs =
      (self.nativeDeps."is-my-json-valid" or []);
    deps = {
      "generate-function-2.0.0" = self.by-version."generate-function"."2.0.0";
      "generate-object-property-1.2.0" = self.by-version."generate-object-property"."1.2.0";
      "jsonpointer-1.1.0" = self.by-version."jsonpointer"."1.1.0";
      "xtend-4.0.0" = self.by-version."xtend"."4.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "is-my-json-valid" ];
  };
  by-spec."is-npm"."^1.0.0" =
    self.by-version."is-npm"."1.0.0";
  by-version."is-npm"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "is-npm-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/is-npm/-/is-npm-1.0.0.tgz";
        name = "is-npm-1.0.0.tgz";
        sha1 = "f2fb63a65e4905b406c86072765a1a4dc793b9f4";
      })
    ];
    buildInputs =
      (self.nativeDeps."is-npm" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "is-npm" ];
  };
  by-spec."is-property"."^1.0.0" =
    self.by-version."is-property"."1.0.2";
  by-version."is-property"."1.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "is-property-1.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/is-property/-/is-property-1.0.2.tgz";
        name = "is-property-1.0.2.tgz";
        sha1 = "57fe1c4e48474edd65b09911f26b1cd4095dda84";
      })
    ];
    buildInputs =
      (self.nativeDeps."is-property" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "is-property" ];
  };
  by-spec."is-relative"."^0.1.0" =
    self.by-version."is-relative"."0.1.3";
  by-version."is-relative"."0.1.3" = lib.makeOverridable self.buildNodePackage {
    name = "is-relative-0.1.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/is-relative/-/is-relative-0.1.3.tgz";
        name = "is-relative-0.1.3.tgz";
        sha1 = "905fee8ae86f45b3ec614bc3c15c869df0876e82";
      })
    ];
    buildInputs =
      (self.nativeDeps."is-relative" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "is-relative" ];
  };
  by-spec."is-root"."^1.0.0" =
    self.by-version."is-root"."1.0.0";
  by-version."is-root"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "is-root-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/is-root/-/is-root-1.0.0.tgz";
        name = "is-root-1.0.0.tgz";
        sha1 = "07b6c233bc394cd9d02ba15c966bd6660d6342d5";
      })
    ];
    buildInputs =
      (self.nativeDeps."is-root" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "is-root" ];
  };
  by-spec."is-stream"."^1.0.0" =
    self.by-version."is-stream"."1.0.1";
  by-version."is-stream"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "is-stream-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/is-stream/-/is-stream-1.0.1.tgz";
        name = "is-stream-1.0.1.tgz";
        sha1 = "b44ce45b1f0c3df583f6b5debf84dcf9743ac8b5";
      })
    ];
    buildInputs =
      (self.nativeDeps."is-stream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "is-stream" ];
  };
  by-spec."isarray"."0.0.1" =
    self.by-version."isarray"."0.0.1";
  by-version."isarray"."0.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "isarray-0.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz";
        name = "isarray-0.0.1.tgz";
        sha1 = "8a18acfca9a8f4177e09abfc6038939b05d1eedf";
      })
    ];
    buildInputs =
      (self.nativeDeps."isarray" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "isarray" ];
  };
  by-spec."isstream"."~0.1.1" =
    self.by-version."isstream"."0.1.2";
  by-version."isstream"."0.1.2" = lib.makeOverridable self.buildNodePackage {
    name = "isstream-0.1.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/isstream/-/isstream-0.1.2.tgz";
        name = "isstream-0.1.2.tgz";
        sha1 = "47e63f7af55afa6f92e1500e690eb8b8529c099a";
      })
    ];
    buildInputs =
      (self.nativeDeps."isstream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "isstream" ];
  };
  by-spec."js-yaml"."^3.1.0" =
    self.by-version."js-yaml"."3.3.1";
  by-version."js-yaml"."3.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "js-yaml-3.3.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/js-yaml/-/js-yaml-3.3.1.tgz";
        name = "js-yaml-3.3.1.tgz";
        sha1 = "ca1acd3423ec275d12140a7bab51db015ba0b3c0";
      })
    ];
    buildInputs =
      (self.nativeDeps."js-yaml" or []);
    deps = {
      "argparse-1.0.2" = self.by-version."argparse"."1.0.2";
      "esprima-2.2.0" = self.by-version."esprima"."2.2.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "js-yaml" ];
  };
  by-spec."json-stringify-safe"."~5.0.0" =
    self.by-version."json-stringify-safe"."5.0.1";
  by-version."json-stringify-safe"."5.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "json-stringify-safe-5.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz";
        name = "json-stringify-safe-5.0.1.tgz";
        sha1 = "1296a2d58fd45f19a0f6ce01d65701e2c735b6eb";
      })
    ];
    buildInputs =
      (self.nativeDeps."json-stringify-safe" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "json-stringify-safe" ];
  };
  by-spec."jsonfile"."~1.0.1" =
    self.by-version."jsonfile"."1.0.1";
  by-version."jsonfile"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "jsonfile-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/jsonfile/-/jsonfile-1.0.1.tgz";
        name = "jsonfile-1.0.1.tgz";
        sha1 = "ea5efe40b83690b98667614a7392fc60e842c0dd";
      })
    ];
    buildInputs =
      (self.nativeDeps."jsonfile" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "jsonfile" ];
  };
  by-spec."jsonify"."~0.0.0" =
    self.by-version."jsonify"."0.0.0";
  by-version."jsonify"."0.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "jsonify-0.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/jsonify/-/jsonify-0.0.0.tgz";
        name = "jsonify-0.0.0.tgz";
        sha1 = "2c74b6ee41d93ca51b7b5aaee8f503631d252a73";
      })
    ];
    buildInputs =
      (self.nativeDeps."jsonify" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "jsonify" ];
  };
  by-spec."jsonpointer"."^1.1.0" =
    self.by-version."jsonpointer"."1.1.0";
  by-version."jsonpointer"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "jsonpointer-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/jsonpointer/-/jsonpointer-1.1.0.tgz";
        name = "jsonpointer-1.1.0.tgz";
        sha1 = "c3c72efaed3b97154163dc01dd349e1cfe0f80fc";
      })
    ];
    buildInputs =
      (self.nativeDeps."jsonpointer" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "jsonpointer" ];
  };
  by-spec."junk"."^1.0.0" =
    self.by-version."junk"."1.0.1";
  by-version."junk"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "junk-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/junk/-/junk-1.0.1.tgz";
        name = "junk-1.0.1.tgz";
        sha1 = "824ef8925f02026f61bc6e6fa346b25fa8f3938b";
      })
    ];
    buildInputs =
      (self.nativeDeps."junk" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "junk" ];
  };
  by-spec."latest-version"."^1.0.0" =
    self.by-version."latest-version"."1.0.0";
  by-version."latest-version"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "latest-version-1.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/latest-version/-/latest-version-1.0.0.tgz";
        name = "latest-version-1.0.0.tgz";
        sha1 = "84f40e5c90745c7e4f7811624d6152c381d931d9";
      })
    ];
    buildInputs =
      (self.nativeDeps."latest-version" or []);
    deps = {
      "package-json-1.1.0" = self.by-version."package-json"."1.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "latest-version" ];
  };
  by-spec."lockfile"."^1.0.0" =
    self.by-version."lockfile"."1.0.1";
  by-version."lockfile"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "lockfile-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lockfile/-/lockfile-1.0.1.tgz";
        name = "lockfile-1.0.1.tgz";
        sha1 = "9d353ecfe3f54d150bb57f89d51746935a39c4f5";
      })
    ];
    buildInputs =
      (self.nativeDeps."lockfile" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lockfile" ];
  };
  by-spec."lodash".">= 3.2.0 < 4.0.0" =
    self.by-version."lodash"."3.9.3";
  by-version."lodash"."3.9.3" = lib.makeOverridable self.buildNodePackage {
    name = "lodash-3.9.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash/-/lodash-3.9.3.tgz";
        name = "lodash-3.9.3.tgz";
        sha1 = "0159e86832feffc6d61d852b12a953b99496bd32";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash" ];
  };
  by-spec."lodash"."^3.3.1" =
    self.by-version."lodash"."3.9.3";
  by-spec."lodash"."~2.4.1" =
    self.by-version."lodash"."2.4.2";
  by-version."lodash"."2.4.2" = lib.makeOverridable self.buildNodePackage {
    name = "lodash-2.4.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash/-/lodash-2.4.2.tgz";
        name = "lodash-2.4.2.tgz";
        sha1 = "fadd834b9683073da179b3eae6d9c0d15053f73e";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash" ];
  };
  by-spec."lodash._basetostring"."^3.0.0" =
    self.by-version."lodash._basetostring"."3.0.0";
  by-version."lodash._basetostring"."3.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._basetostring-3.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._basetostring/-/lodash._basetostring-3.0.0.tgz";
        name = "lodash._basetostring-3.0.0.tgz";
        sha1 = "75a9a4aaaa2b2a8761111ff5431e7d83c1daf0e2";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._basetostring" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._basetostring" ];
  };
  by-spec."lodash._createpadding"."^3.0.0" =
    self.by-version."lodash._createpadding"."3.6.0";
  by-version."lodash._createpadding"."3.6.0" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._createpadding-3.6.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._createpadding/-/lodash._createpadding-3.6.0.tgz";
        name = "lodash._createpadding-3.6.0.tgz";
        sha1 = "c466850dd1a05e6bfec54fd0cf0db28b68332d5e";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._createpadding" or []);
    deps = {
      "lodash.repeat-3.0.0" = self.by-version."lodash.repeat"."3.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._createpadding" ];
  };
  by-spec."lodash._getnative"."^3.0.0" =
    self.by-version."lodash._getnative"."3.9.0";
  by-version."lodash._getnative"."3.9.0" = lib.makeOverridable self.buildNodePackage {
    name = "lodash._getnative-3.9.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash._getnative/-/lodash._getnative-3.9.0.tgz";
        name = "lodash._getnative-3.9.0.tgz";
        sha1 = "a478f0b87dd17d75b4311ffca2f551b2623977d9";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash._getnative" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash._getnative" ];
  };
  by-spec."lodash.debounce"."^3.0.1" =
    self.by-version."lodash.debounce"."3.1.0";
  by-version."lodash.debounce"."3.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.debounce-3.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.debounce/-/lodash.debounce-3.1.0.tgz";
        name = "lodash.debounce-3.1.0.tgz";
        sha1 = "f6731d72c739f29bd38e5803b208c9f640868b78";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.debounce" or []);
    deps = {
      "lodash._getnative-3.9.0" = self.by-version."lodash._getnative"."3.9.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.debounce" ];
  };
  by-spec."lodash.pad"."^3.0.0" =
    self.by-version."lodash.pad"."3.1.0";
  by-version."lodash.pad"."3.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.pad-3.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.pad/-/lodash.pad-3.1.0.tgz";
        name = "lodash.pad-3.1.0.tgz";
        sha1 = "9f18b1f3749a95e197b5ff2ae752ea9851ada965";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.pad" or []);
    deps = {
      "lodash._basetostring-3.0.0" = self.by-version."lodash._basetostring"."3.0.0";
      "lodash._createpadding-3.6.0" = self.by-version."lodash._createpadding"."3.6.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.pad" ];
  };
  by-spec."lodash.padleft"."^3.0.0" =
    self.by-version."lodash.padleft"."3.1.1";
  by-version."lodash.padleft"."3.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.padleft-3.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.padleft/-/lodash.padleft-3.1.1.tgz";
        name = "lodash.padleft-3.1.1.tgz";
        sha1 = "150151f1e0245edba15d50af2d71f1d5cff46530";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.padleft" or []);
    deps = {
      "lodash._basetostring-3.0.0" = self.by-version."lodash._basetostring"."3.0.0";
      "lodash._createpadding-3.6.0" = self.by-version."lodash._createpadding"."3.6.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.padleft" ];
  };
  by-spec."lodash.padright"."^3.0.0" =
    self.by-version."lodash.padright"."3.1.1";
  by-version."lodash.padright"."3.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.padright-3.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.padright/-/lodash.padright-3.1.1.tgz";
        name = "lodash.padright-3.1.1.tgz";
        sha1 = "79f7770baaa39738c040aeb5465e8d88f2aacec0";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.padright" or []);
    deps = {
      "lodash._basetostring-3.0.0" = self.by-version."lodash._basetostring"."3.0.0";
      "lodash._createpadding-3.6.0" = self.by-version."lodash._createpadding"."3.6.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.padright" ];
  };
  by-spec."lodash.repeat"."^3.0.0" =
    self.by-version."lodash.repeat"."3.0.0";
  by-version."lodash.repeat"."3.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "lodash.repeat-3.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lodash.repeat/-/lodash.repeat-3.0.0.tgz";
        name = "lodash.repeat-3.0.0.tgz";
        sha1 = "c340f4136c99dc5b2e397b3fd50cffbd172a94b0";
      })
    ];
    buildInputs =
      (self.nativeDeps."lodash.repeat" or []);
    deps = {
      "lodash._basetostring-3.0.0" = self.by-version."lodash._basetostring"."3.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lodash.repeat" ];
  };
  by-spec."lowercase-keys"."^1.0.0" =
    self.by-version."lowercase-keys"."1.0.0";
  by-version."lowercase-keys"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "lowercase-keys-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lowercase-keys/-/lowercase-keys-1.0.0.tgz";
        name = "lowercase-keys-1.0.0.tgz";
        sha1 = "4e3366b39e7f5457e35f1324bdf6f88d0bfc7306";
      })
    ];
    buildInputs =
      (self.nativeDeps."lowercase-keys" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lowercase-keys" ];
  };
  by-spec."lru-cache"."2" =
    self.by-version."lru-cache"."2.6.4";
  by-version."lru-cache"."2.6.4" = lib.makeOverridable self.buildNodePackage {
    name = "lru-cache-2.6.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lru-cache/-/lru-cache-2.6.4.tgz";
        name = "lru-cache-2.6.4.tgz";
        sha1 = "2675190ccd1b0701ec2f652a4d0d3d400d76c0dd";
      })
    ];
    buildInputs =
      (self.nativeDeps."lru-cache" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lru-cache" ];
  };
  by-spec."lru-cache"."^2.5.0" =
    self.by-version."lru-cache"."2.6.4";
  by-spec."lru-cache"."~2.3.0" =
    self.by-version."lru-cache"."2.3.1";
  by-version."lru-cache"."2.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "lru-cache-2.3.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lru-cache/-/lru-cache-2.3.1.tgz";
        name = "lru-cache-2.3.1.tgz";
        sha1 = "b3adf6b3d856e954e2c390e6cef22081245a53d6";
      })
    ];
    buildInputs =
      (self.nativeDeps."lru-cache" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "lru-cache" ];
  };
  by-spec."lru-queue"."0.1" =
    self.by-version."lru-queue"."0.1.0";
  by-version."lru-queue"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "lru-queue-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/lru-queue/-/lru-queue-0.1.0.tgz";
        name = "lru-queue-0.1.0.tgz";
        sha1 = "2738bd9f0d3cf4f84490c5736c48699ac632cda3";
      })
    ];
    buildInputs =
      (self.nativeDeps."lru-queue" or []);
    deps = {
      "es5-ext-0.10.7" = self.by-version."es5-ext"."0.10.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "lru-queue" ];
  };
  by-spec."memoizee"."~0.3.8" =
    self.by-version."memoizee"."0.3.8";
  by-version."memoizee"."0.3.8" = lib.makeOverridable self.buildNodePackage {
    name = "memoizee-0.3.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/memoizee/-/memoizee-0.3.8.tgz";
        name = "memoizee-0.3.8.tgz";
        sha1 = "b5faf419f02fafe3c2cc1cf5d3907c210fc7efdc";
      })
    ];
    buildInputs =
      (self.nativeDeps."memoizee" or []);
    deps = {
      "d-0.1.1" = self.by-version."d"."0.1.1";
      "es5-ext-0.10.7" = self.by-version."es5-ext"."0.10.7";
      "es6-weak-map-0.1.4" = self.by-version."es6-weak-map"."0.1.4";
      "event-emitter-0.3.3" = self.by-version."event-emitter"."0.3.3";
      "lru-queue-0.1.0" = self.by-version."lru-queue"."0.1.0";
      "next-tick-0.2.2" = self.by-version."next-tick"."0.2.2";
      "timers-ext-0.1.0" = self.by-version."timers-ext"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "memoizee" ];
  };
  by-spec."mime"."^1.2.11" =
    self.by-version."mime"."1.3.4";
  by-version."mime"."1.3.4" = lib.makeOverridable self.buildNodePackage {
    name = "mime-1.3.4";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mime/-/mime-1.3.4.tgz";
        name = "mime-1.3.4.tgz";
        sha1 = "115f9e3b6b3daf2959983cb38f149a2d40eb5d53";
      })
    ];
    buildInputs =
      (self.nativeDeps."mime" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mime" ];
  };
  by-spec."mime-db"."~1.10.0" =
    self.by-version."mime-db"."1.10.0";
  by-version."mime-db"."1.10.0" = lib.makeOverridable self.buildNodePackage {
    name = "mime-db-1.10.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mime-db/-/mime-db-1.10.0.tgz";
        name = "mime-db-1.10.0.tgz";
        sha1 = "e6308063c758ebd12837874c3d1ea9170766b03b";
      })
    ];
    buildInputs =
      (self.nativeDeps."mime-db" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mime-db" ];
  };
  by-spec."mime-types"."~1.0.1" =
    self.by-version."mime-types"."1.0.2";
  by-version."mime-types"."1.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "mime-types-1.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mime-types/-/mime-types-1.0.2.tgz";
        name = "mime-types-1.0.2.tgz";
        sha1 = "995ae1392ab8affcbfcb2641dd054e943c0d5dce";
      })
    ];
    buildInputs =
      (self.nativeDeps."mime-types" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mime-types" ];
  };
  by-spec."mime-types"."~2.0.1" =
    self.by-version."mime-types"."2.0.12";
  by-version."mime-types"."2.0.12" = lib.makeOverridable self.buildNodePackage {
    name = "mime-types-2.0.12";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mime-types/-/mime-types-2.0.12.tgz";
        name = "mime-types-2.0.12.tgz";
        sha1 = "87ae9f124e94f8e440c93d1a72d0dccecdb71135";
      })
    ];
    buildInputs =
      (self.nativeDeps."mime-types" or []);
    deps = {
      "mime-db-1.10.0" = self.by-version."mime-db"."1.10.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "mime-types" ];
  };
  by-spec."mime-types"."~2.0.3" =
    self.by-version."mime-types"."2.0.12";
  by-spec."minimatch"."0.3" =
    self.by-version."minimatch"."0.3.0";
  by-version."minimatch"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "minimatch-0.3.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimatch/-/minimatch-0.3.0.tgz";
        name = "minimatch-0.3.0.tgz";
        sha1 = "275d8edaac4f1bb3326472089e7949c8394699dd";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimatch" or []);
    deps = {
      "lru-cache-2.6.4" = self.by-version."lru-cache"."2.6.4";
      "sigmund-1.0.1" = self.by-version."sigmund"."1.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimatch" ];
  };
  by-spec."minimatch"."^2.0.1" =
    self.by-version."minimatch"."2.0.8";
  by-version."minimatch"."2.0.8" = lib.makeOverridable self.buildNodePackage {
    name = "minimatch-2.0.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimatch/-/minimatch-2.0.8.tgz";
        name = "minimatch-2.0.8.tgz";
        sha1 = "0bc20f6bf3570a698ef0ddff902063c6cabda6bf";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimatch" or []);
    deps = {
      "brace-expansion-1.1.0" = self.by-version."brace-expansion"."1.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimatch" ];
  };
  by-spec."minimist"."0.0.8" =
    self.by-version."minimist"."0.0.8";
  by-version."minimist"."0.0.8" = lib.makeOverridable self.buildNodePackage {
    name = "minimist-0.0.8";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimist/-/minimist-0.0.8.tgz";
        name = "minimist-0.0.8.tgz";
        sha1 = "857fcabfc3397d2625b8228262e86aa7a011b05d";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimist" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimist" ];
  };
  by-spec."minimist"."^1.1.0" =
    self.by-version."minimist"."1.1.1";
  by-version."minimist"."1.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "minimist-1.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimist/-/minimist-1.1.1.tgz";
        name = "minimist-1.1.1.tgz";
        sha1 = "1bc2bc71658cdca5712475684363615b0b4f695b";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimist" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimist" ];
  };
  by-spec."minimist"."~0.0.1" =
    self.by-version."minimist"."0.0.10";
  by-version."minimist"."0.0.10" = lib.makeOverridable self.buildNodePackage {
    name = "minimist-0.0.10";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/minimist/-/minimist-0.0.10.tgz";
        name = "minimist-0.0.10.tgz";
        sha1 = "de3f98543dbf96082be48ad1a0c7cda836301dcf";
      })
    ];
    buildInputs =
      (self.nativeDeps."minimist" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "minimist" ];
  };
  by-spec."minimist"."~0.0.7" =
    self.by-version."minimist"."0.0.10";
  by-spec."mkdirp"."0.3.x" =
    self.by-version."mkdirp"."0.3.5";
  by-version."mkdirp"."0.3.5" = lib.makeOverridable self.buildNodePackage {
    name = "mkdirp-0.3.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mkdirp/-/mkdirp-0.3.5.tgz";
        name = "mkdirp-0.3.5.tgz";
        sha1 = "de3e5f8961c88c787ee1368df849ac4413eca8d7";
      })
    ];
    buildInputs =
      (self.nativeDeps."mkdirp" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mkdirp" ];
  };
  by-spec."mkdirp"."0.5" =
    self.by-version."mkdirp"."0.5.1";
  by-version."mkdirp"."0.5.1" = lib.makeOverridable self.buildNodePackage {
    name = "mkdirp-0.5.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mkdirp/-/mkdirp-0.5.1.tgz";
        name = "mkdirp-0.5.1.tgz";
        sha1 = "30057438eac6cf7f8c4767f38648d6697d75c903";
      })
    ];
    buildInputs =
      (self.nativeDeps."mkdirp" or []);
    deps = {
      "minimist-0.0.8" = self.by-version."minimist"."0.0.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "mkdirp" ];
  };
  by-spec."mkdirp"."0.5.0" =
    self.by-version."mkdirp"."0.5.0";
  by-version."mkdirp"."0.5.0" = lib.makeOverridable self.buildNodePackage {
    name = "mkdirp-0.5.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mkdirp/-/mkdirp-0.5.0.tgz";
        name = "mkdirp-0.5.0.tgz";
        sha1 = "1d73076a6df986cd9344e15e71fcc05a4c9abf12";
      })
    ];
    buildInputs =
      (self.nativeDeps."mkdirp" or []);
    deps = {
      "minimist-0.0.8" = self.by-version."minimist"."0.0.8";
    };
    peerDependencies = [
    ];
    passthru.names = [ "mkdirp" ];
  };
  by-spec."mkdirp".">=0.5 0" =
    self.by-version."mkdirp"."0.5.1";
  by-spec."mkdirp"."^0.5.0" =
    self.by-version."mkdirp"."0.5.1";
  by-spec."mkdirp"."~0.3.3" =
    self.by-version."mkdirp"."0.3.5";
  by-spec."mkdirp"."~0.3.5" =
    self.by-version."mkdirp"."0.3.5";
  by-spec."mkpath"."^0.1.0" =
    self.by-version."mkpath"."0.1.0";
  by-version."mkpath"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "mkpath-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mkpath/-/mkpath-0.1.0.tgz";
        name = "mkpath-0.1.0.tgz";
        sha1 = "7554a6f8d871834cc97b5462b122c4c124d6de91";
      })
    ];
    buildInputs =
      (self.nativeDeps."mkpath" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mkpath" ];
  };
  by-spec."mout"."^0.11.0" =
    self.by-version."mout"."0.11.0";
  by-version."mout"."0.11.0" = lib.makeOverridable self.buildNodePackage {
    name = "mout-0.11.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mout/-/mout-0.11.0.tgz";
        name = "mout-0.11.0.tgz";
        sha1 = "93cdf0791ac8a24873ceeb42a5b016b7c867abee";
      })
    ];
    buildInputs =
      (self.nativeDeps."mout" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mout" ];
  };
  by-spec."mout"."~0.9.0" =
    self.by-version."mout"."0.9.1";
  by-version."mout"."0.9.1" = lib.makeOverridable self.buildNodePackage {
    name = "mout-0.9.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mout/-/mout-0.9.1.tgz";
        name = "mout-0.9.1.tgz";
        sha1 = "84f0f3fd6acc7317f63de2affdcc0cee009b0477";
      })
    ];
    buildInputs =
      (self.nativeDeps."mout" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mout" ];
  };
  by-spec."mute-stream"."0.0.4" =
    self.by-version."mute-stream"."0.0.4";
  by-version."mute-stream"."0.0.4" = lib.makeOverridable self.buildNodePackage {
    name = "mute-stream-0.0.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mute-stream/-/mute-stream-0.0.4.tgz";
        name = "mute-stream-0.0.4.tgz";
        sha1 = "a9219960a6d5d5d046597aee51252c6655f7177e";
      })
    ];
    buildInputs =
      (self.nativeDeps."mute-stream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mute-stream" ];
  };
  by-spec."mute-stream"."~0.0.4" =
    self.by-version."mute-stream"."0.0.5";
  by-version."mute-stream"."0.0.5" = lib.makeOverridable self.buildNodePackage {
    name = "mute-stream-0.0.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/mute-stream/-/mute-stream-0.0.5.tgz";
        name = "mute-stream-0.0.5.tgz";
        sha1 = "8fbfabb0a98a253d3184331f9e8deb7372fac6c0";
      })
    ];
    buildInputs =
      (self.nativeDeps."mute-stream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "mute-stream" ];
  };
  by-spec."ncp"."~0.4.2" =
    self.by-version."ncp"."0.4.2";
  by-version."ncp"."0.4.2" = lib.makeOverridable self.buildNodePackage {
    name = "ncp-0.4.2";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/ncp/-/ncp-0.4.2.tgz";
        name = "ncp-0.4.2.tgz";
        sha1 = "abcc6cbd3ec2ed2a729ff6e7c1fa8f01784a8574";
      })
    ];
    buildInputs =
      (self.nativeDeps."ncp" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "ncp" ];
  };
  by-spec."nested-error-stacks"."^1.0.0" =
    self.by-version."nested-error-stacks"."1.0.0";
  by-version."nested-error-stacks"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "nested-error-stacks-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/nested-error-stacks/-/nested-error-stacks-1.0.0.tgz";
        name = "nested-error-stacks-1.0.0.tgz";
        sha1 = "3bd2785bb1fa9ebbf608e293e9ccb9ea765254c7";
      })
    ];
    buildInputs =
      (self.nativeDeps."nested-error-stacks" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "nested-error-stacks" ];
  };
  by-spec."next-tick"."~0.2.2" =
    self.by-version."next-tick"."0.2.2";
  by-version."next-tick"."0.2.2" = lib.makeOverridable self.buildNodePackage {
    name = "next-tick-0.2.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/next-tick/-/next-tick-0.2.2.tgz";
        name = "next-tick-0.2.2.tgz";
        sha1 = "75da4a927ee5887e39065880065b7336413b310d";
      })
    ];
    buildInputs =
      (self.nativeDeps."next-tick" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "next-tick" ];
  };
  by-spec."node-uuid"."~1.4.0" =
    self.by-version."node-uuid"."1.4.3";
  by-version."node-uuid"."1.4.3" = lib.makeOverridable self.buildNodePackage {
    name = "node-uuid-1.4.3";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/node-uuid/-/node-uuid-1.4.3.tgz";
        name = "node-uuid-1.4.3.tgz";
        sha1 = "319bb7a56e7cb63f00b5c0cd7851cd4b4ddf1df9";
      })
    ];
    buildInputs =
      (self.nativeDeps."node-uuid" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "node-uuid" ];
  };
  by-spec."nopt"."2" =
    self.by-version."nopt"."2.2.1";
  by-version."nopt"."2.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "nopt-2.2.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/nopt/-/nopt-2.2.1.tgz";
        name = "nopt-2.2.1.tgz";
        sha1 = "2aa09b7d1768487b3b89a9c5aa52335bff0baea7";
      })
    ];
    buildInputs =
      (self.nativeDeps."nopt" or []);
    deps = {
      "abbrev-1.0.6" = self.by-version."abbrev"."1.0.6";
    };
    peerDependencies = [
    ];
    passthru.names = [ "nopt" ];
  };
  by-spec."nopt"."^3.0.1" =
    self.by-version."nopt"."3.0.2";
  by-version."nopt"."3.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "nopt-3.0.2";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/nopt/-/nopt-3.0.2.tgz";
        name = "nopt-3.0.2.tgz";
        sha1 = "a82a87f9d8c3df140fe78fb29657a7a774403b5e";
      })
    ];
    buildInputs =
      (self.nativeDeps."nopt" or []);
    deps = {
      "abbrev-1.0.6" = self.by-version."abbrev"."1.0.6";
    };
    peerDependencies = [
    ];
    passthru.names = [ "nopt" ];
  };
  by-spec."nopt"."~1.0.10" =
    self.by-version."nopt"."1.0.10";
  by-version."nopt"."1.0.10" = lib.makeOverridable self.buildNodePackage {
    name = "nopt-1.0.10";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/nopt/-/nopt-1.0.10.tgz";
        name = "nopt-1.0.10.tgz";
        sha1 = "6ddd21bd2a31417b92727dd585f8a6f37608ebee";
      })
    ];
    buildInputs =
      (self.nativeDeps."nopt" or []);
    deps = {
      "abbrev-1.0.6" = self.by-version."abbrev"."1.0.6";
    };
    peerDependencies = [
    ];
    passthru.names = [ "nopt" ];
  };
  by-spec."npm-registry-client"."0.2.27" =
    self.by-version."npm-registry-client"."0.2.27";
  by-version."npm-registry-client"."0.2.27" = lib.makeOverridable self.buildNodePackage {
    name = "npm-registry-client-0.2.27";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/npm-registry-client/-/npm-registry-client-0.2.27.tgz";
        name = "npm-registry-client-0.2.27.tgz";
        sha1 = "8f338189d32769267886a07ad7b7fd2267446adf";
      })
    ];
    buildInputs =
      (self.nativeDeps."npm-registry-client" or []);
    deps = {
      "request-2.55.0" = self.by-version."request"."2.55.0";
      "graceful-fs-2.0.3" = self.by-version."graceful-fs"."2.0.3";
      "semver-2.0.11" = self.by-version."semver"."2.0.11";
      "slide-1.1.6" = self.by-version."slide"."1.1.6";
      "chownr-0.0.2" = self.by-version."chownr"."0.0.2";
      "mkdirp-0.3.5" = self.by-version."mkdirp"."0.3.5";
      "rimraf-2.3.4" = self.by-version."rimraf"."2.3.4";
      "retry-0.6.0" = self.by-version."retry"."0.6.0";
      "couch-login-0.1.20" = self.by-version."couch-login"."0.1.20";
      "npmlog-1.2.1" = self.by-version."npmlog"."1.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "npm-registry-client" ];
  };
  by-spec."npm2nix"."*" =
    self.by-version."npm2nix"."5.8.1";
  by-version."npm2nix"."5.8.1" = lib.makeOverridable self.buildNodePackage {
    name = "npm2nix-5.8.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/npm2nix/-/npm2nix-5.8.1.tgz";
        name = "npm2nix-5.8.1.tgz";
        sha1 = "0d8356b458caaa677b4a1225fea4900f2995982f";
      })
    ];
    buildInputs =
      (self.nativeDeps."npm2nix" or []);
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
    peerDependencies = [
    ];
    passthru.names = [ "npm2nix" ];
  };
  "npm2nix" = self.by-version."npm2nix"."5.8.1";
  by-spec."npmconf"."0.1.1" =
    self.by-version."npmconf"."0.1.1";
  by-version."npmconf"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "npmconf-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/npmconf/-/npmconf-0.1.1.tgz";
        name = "npmconf-0.1.1.tgz";
        sha1 = "7a254182591ca22d77b2faecc0d17e0f9bdf25a1";
      })
    ];
    buildInputs =
      (self.nativeDeps."npmconf" or []);
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
    peerDependencies = [
    ];
    passthru.names = [ "npmconf" ];
  };
  by-spec."npmlog"."*" =
    self.by-version."npmlog"."1.2.1";
  by-version."npmlog"."1.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "npmlog-1.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/npmlog/-/npmlog-1.2.1.tgz";
        name = "npmlog-1.2.1.tgz";
        sha1 = "28e7be619609b53f7ad1dd300a10d64d716268b6";
      })
    ];
    buildInputs =
      (self.nativeDeps."npmlog" or []);
    deps = {
      "ansi-0.3.0" = self.by-version."ansi"."0.3.0";
      "are-we-there-yet-1.0.4" = self.by-version."are-we-there-yet"."1.0.4";
      "gauge-1.2.0" = self.by-version."gauge"."1.2.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "npmlog" ];
  };
  by-spec."oauth-sign"."~0.5.0" =
    self.by-version."oauth-sign"."0.5.0";
  by-version."oauth-sign"."0.5.0" = lib.makeOverridable self.buildNodePackage {
    name = "oauth-sign-0.5.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/oauth-sign/-/oauth-sign-0.5.0.tgz";
        name = "oauth-sign-0.5.0.tgz";
        sha1 = "d767f5169325620eab2e087ef0c472e773db6461";
      })
    ];
    buildInputs =
      (self.nativeDeps."oauth-sign" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "oauth-sign" ];
  };
  by-spec."oauth-sign"."~0.6.0" =
    self.by-version."oauth-sign"."0.6.0";
  by-version."oauth-sign"."0.6.0" = lib.makeOverridable self.buildNodePackage {
    name = "oauth-sign-0.6.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/oauth-sign/-/oauth-sign-0.6.0.tgz";
        name = "oauth-sign-0.6.0.tgz";
        sha1 = "7dbeae44f6ca454e1f168451d630746735813ce3";
      })
    ];
    buildInputs =
      (self.nativeDeps."oauth-sign" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "oauth-sign" ];
  };
  by-spec."object-assign"."^2.0.0" =
    self.by-version."object-assign"."2.0.0";
  by-version."object-assign"."2.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "object-assign-2.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/object-assign/-/object-assign-2.0.0.tgz";
        name = "object-assign-2.0.0.tgz";
        sha1 = "f8309b09083b01261ece3ef7373f2b57b8dd7042";
      })
    ];
    buildInputs =
      (self.nativeDeps."object-assign" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "object-assign" ];
  };
  by-spec."once"."^1.3.0" =
    self.by-version."once"."1.3.2";
  by-version."once"."1.3.2" = lib.makeOverridable self.buildNodePackage {
    name = "once-1.3.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/once/-/once-1.3.2.tgz";
        name = "once-1.3.2.tgz";
        sha1 = "d8feeca93b039ec1dcdee7741c92bdac5e28081b";
      })
    ];
    buildInputs =
      (self.nativeDeps."once" or []);
    deps = {
      "wrappy-1.0.1" = self.by-version."wrappy"."1.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "once" ];
  };
  by-spec."once"."^1.3.1" =
    self.by-version."once"."1.3.2";
  by-spec."once"."~1.1.1" =
    self.by-version."once"."1.1.1";
  by-version."once"."1.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "once-1.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/once/-/once-1.1.1.tgz";
        name = "once-1.1.1.tgz";
        sha1 = "9db574933ccb08c3a7614d154032c09ea6f339e7";
      })
    ];
    buildInputs =
      (self.nativeDeps."once" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "once" ];
  };
  by-spec."once"."~1.3.0" =
    self.by-version."once"."1.3.2";
  by-spec."opn"."^1.0.1" =
    self.by-version."opn"."1.0.2";
  by-version."opn"."1.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "opn-1.0.2";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/opn/-/opn-1.0.2.tgz";
        name = "opn-1.0.2.tgz";
        sha1 = "b909643346d00a1abc977a8b96f3ce3c53d5cf5f";
      })
    ];
    buildInputs =
      (self.nativeDeps."opn" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "opn" ];
  };
  by-spec."optimist"."~0.3" =
    self.by-version."optimist"."0.3.7";
  by-version."optimist"."0.3.7" = lib.makeOverridable self.buildNodePackage {
    name = "optimist-0.3.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/optimist/-/optimist-0.3.7.tgz";
        name = "optimist-0.3.7.tgz";
        sha1 = "c90941ad59e4273328923074d2cf2e7cbc6ec0d9";
      })
    ];
    buildInputs =
      (self.nativeDeps."optimist" or []);
    deps = {
      "wordwrap-0.0.3" = self.by-version."wordwrap"."0.0.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "optimist" ];
  };
  by-spec."optimist"."~0.3.5" =
    self.by-version."optimist"."0.3.7";
  by-spec."optimist"."~0.6.0" =
    self.by-version."optimist"."0.6.1";
  by-version."optimist"."0.6.1" = lib.makeOverridable self.buildNodePackage {
    name = "optimist-0.6.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/optimist/-/optimist-0.6.1.tgz";
        name = "optimist-0.6.1.tgz";
        sha1 = "da3ea74686fa21a19a111c326e90eb15a0196686";
      })
    ];
    buildInputs =
      (self.nativeDeps."optimist" or []);
    deps = {
      "wordwrap-0.0.3" = self.by-version."wordwrap"."0.0.3";
      "minimist-0.0.10" = self.by-version."minimist"."0.0.10";
    };
    peerDependencies = [
    ];
    passthru.names = [ "optimist" ];
  };
  by-spec."os-name"."^1.0.0" =
    self.by-version."os-name"."1.0.3";
  by-version."os-name"."1.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "os-name-1.0.3";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/os-name/-/os-name-1.0.3.tgz";
        name = "os-name-1.0.3.tgz";
        sha1 = "1b379f64835af7c5a7f498b357cb95215c159edf";
      })
    ];
    buildInputs =
      (self.nativeDeps."os-name" or []);
    deps = {
      "osx-release-1.0.0" = self.by-version."osx-release"."1.0.0";
      "win-release-1.0.0" = self.by-version."win-release"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "os-name" ];
  };
  by-spec."osenv"."0.0.3" =
    self.by-version."osenv"."0.0.3";
  by-version."osenv"."0.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "osenv-0.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/osenv/-/osenv-0.0.3.tgz";
        name = "osenv-0.0.3.tgz";
        sha1 = "cd6ad8ddb290915ad9e22765576025d411f29cb6";
      })
    ];
    buildInputs =
      (self.nativeDeps."osenv" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "osenv" ];
  };
  by-spec."osenv"."^0.1.0" =
    self.by-version."osenv"."0.1.1";
  by-version."osenv"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "osenv-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/osenv/-/osenv-0.1.1.tgz";
        name = "osenv-0.1.1.tgz";
        sha1 = "ddc7c4bb86c64a3022e95f030ee028e9a5996c07";
      })
    ];
    buildInputs =
      (self.nativeDeps."osenv" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "osenv" ];
  };
  by-spec."osx-release"."^1.0.0" =
    self.by-version."osx-release"."1.0.0";
  by-version."osx-release"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "osx-release-1.0.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/osx-release/-/osx-release-1.0.0.tgz";
        name = "osx-release-1.0.0.tgz";
        sha1 = "02bee80f3b898aaa88922d2f86e178605974beac";
      })
    ];
    buildInputs =
      (self.nativeDeps."osx-release" or []);
    deps = {
      "minimist-1.1.1" = self.by-version."minimist"."1.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "osx-release" ];
  };
  by-spec."p-throttler"."0.1.1" =
    self.by-version."p-throttler"."0.1.1";
  by-version."p-throttler"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "p-throttler-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/p-throttler/-/p-throttler-0.1.1.tgz";
        name = "p-throttler-0.1.1.tgz";
        sha1 = "15246409d225d3eefca85c50de710a83a78cca6a";
      })
    ];
    buildInputs =
      (self.nativeDeps."p-throttler" or []);
    deps = {
      "q-0.9.7" = self.by-version."q"."0.9.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "p-throttler" ];
  };
  by-spec."package-json"."^1.0.0" =
    self.by-version."package-json"."1.1.0";
  by-version."package-json"."1.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "package-json-1.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/package-json/-/package-json-1.1.0.tgz";
        name = "package-json-1.1.0.tgz";
        sha1 = "32b427c626385ccce180dc73a66d94f35f545e4b";
      })
    ];
    buildInputs =
      (self.nativeDeps."package-json" or []);
    deps = {
      "got-2.9.2" = self.by-version."got"."2.9.2";
      "registry-url-3.0.3" = self.by-version."registry-url"."3.0.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "package-json" ];
  };
  by-spec."prepend-http"."^1.0.0" =
    self.by-version."prepend-http"."1.0.1";
  by-version."prepend-http"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "prepend-http-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/prepend-http/-/prepend-http-1.0.1.tgz";
        name = "prepend-http-1.0.1.tgz";
        sha1 = "5f13dad9a434fa4f346aa51cf03f3cea15fe4eb3";
      })
    ];
    buildInputs =
      (self.nativeDeps."prepend-http" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "prepend-http" ];
  };
  by-spec."promptly"."0.2.0" =
    self.by-version."promptly"."0.2.0";
  by-version."promptly"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "promptly-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/promptly/-/promptly-0.2.0.tgz";
        name = "promptly-0.2.0.tgz";
        sha1 = "73ef200fa8329d5d3a8df41798950b8646ca46d9";
      })
    ];
    buildInputs =
      (self.nativeDeps."promptly" or []);
    deps = {
      "read-1.0.6" = self.by-version."read"."1.0.6";
    };
    peerDependencies = [
    ];
    passthru.names = [ "promptly" ];
  };
  by-spec."proto-list"."~1.2.1" =
    self.by-version."proto-list"."1.2.4";
  by-version."proto-list"."1.2.4" = lib.makeOverridable self.buildNodePackage {
    name = "proto-list-1.2.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/proto-list/-/proto-list-1.2.4.tgz";
        name = "proto-list-1.2.4.tgz";
        sha1 = "212d5bfe1318306a420f6402b8e26ff39647a849";
      })
    ];
    buildInputs =
      (self.nativeDeps."proto-list" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "proto-list" ];
  };
  by-spec."pump"."^1.0.0" =
    self.by-version."pump"."1.0.0";
  by-version."pump"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "pump-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/pump/-/pump-1.0.0.tgz";
        name = "pump-1.0.0.tgz";
        sha1 = "f0250fe282742492e4dea170e5ed3f7bc8a5e32c";
      })
    ];
    buildInputs =
      (self.nativeDeps."pump" or []);
    deps = {
      "end-of-stream-1.1.0" = self.by-version."end-of-stream"."1.1.0";
      "once-1.3.2" = self.by-version."once"."1.3.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "pump" ];
  };
  by-spec."punycode".">=0.2.0" =
    self.by-version."punycode"."1.3.2";
  by-version."punycode"."1.3.2" = lib.makeOverridable self.buildNodePackage {
    name = "punycode-1.3.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/punycode/-/punycode-1.3.2.tgz";
        name = "punycode-1.3.2.tgz";
        sha1 = "9653a036fb7c1ee42342f2325cceefea3926c48d";
      })
    ];
    buildInputs =
      (self.nativeDeps."punycode" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "punycode" ];
  };
  by-spec."q"."^1.1.2" =
    self.by-version."q"."1.4.1";
  by-version."q"."1.4.1" = lib.makeOverridable self.buildNodePackage {
    name = "q-1.4.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/q/-/q-1.4.1.tgz";
        name = "q-1.4.1.tgz";
        sha1 = "55705bcd93c5f3673530c2c2cbc0c2b3addc286e";
      })
    ];
    buildInputs =
      (self.nativeDeps."q" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "q" ];
  };
  by-spec."q"."~0.9.2" =
    self.by-version."q"."0.9.7";
  by-version."q"."0.9.7" = lib.makeOverridable self.buildNodePackage {
    name = "q-0.9.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/q/-/q-0.9.7.tgz";
        name = "q-0.9.7.tgz";
        sha1 = "4de2e6cb3b29088c9e4cbc03bf9d42fb96ce2f75";
      })
    ];
    buildInputs =
      (self.nativeDeps."q" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "q" ];
  };
  by-spec."qs"."~2.3.1" =
    self.by-version."qs"."2.3.3";
  by-version."qs"."2.3.3" = lib.makeOverridable self.buildNodePackage {
    name = "qs-2.3.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/qs/-/qs-2.3.3.tgz";
        name = "qs-2.3.3.tgz";
        sha1 = "e9e85adbe75da0bbe4c8e0476a086290f863b404";
      })
    ];
    buildInputs =
      (self.nativeDeps."qs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "qs" ];
  };
  by-spec."qs"."~2.4.0" =
    self.by-version."qs"."2.4.2";
  by-version."qs"."2.4.2" = lib.makeOverridable self.buildNodePackage {
    name = "qs-2.4.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/qs/-/qs-2.4.2.tgz";
        name = "qs-2.4.2.tgz";
        sha1 = "f7ce788e5777df0b5010da7f7c4e73ba32470f5a";
      })
    ];
    buildInputs =
      (self.nativeDeps."qs" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "qs" ];
  };
  by-spec."rc"."^1.0.1" =
    self.by-version."rc"."1.0.3";
  by-version."rc"."1.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "rc-1.0.3";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/rc/-/rc-1.0.3.tgz";
        name = "rc-1.0.3.tgz";
        sha1 = "51bf28d21f13a9324528a9633460161ad9a39f77";
      })
    ];
    buildInputs =
      (self.nativeDeps."rc" or []);
    deps = {
      "minimist-0.0.10" = self.by-version."minimist"."0.0.10";
      "deep-extend-0.2.11" = self.by-version."deep-extend"."0.2.11";
      "strip-json-comments-0.1.3" = self.by-version."strip-json-comments"."0.1.3";
      "ini-1.3.3" = self.by-version."ini"."1.3.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "rc" ];
  };
  by-spec."read"."~1.0.4" =
    self.by-version."read"."1.0.6";
  by-version."read"."1.0.6" = lib.makeOverridable self.buildNodePackage {
    name = "read-1.0.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/read/-/read-1.0.6.tgz";
        name = "read-1.0.6.tgz";
        sha1 = "09873c14ecc114d063fad43b8ca5a33d304721c8";
      })
    ];
    buildInputs =
      (self.nativeDeps."read" or []);
    deps = {
      "mute-stream-0.0.5" = self.by-version."mute-stream"."0.0.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "read" ];
  };
  by-spec."read-all-stream"."^2.0.0" =
    self.by-version."read-all-stream"."2.1.2";
  by-version."read-all-stream"."2.1.2" = lib.makeOverridable self.buildNodePackage {
    name = "read-all-stream-2.1.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/read-all-stream/-/read-all-stream-2.1.2.tgz";
        name = "read-all-stream-2.1.2.tgz";
        sha1 = "0e80070eadd99712383e9f3c26762310900bda0a";
      })
    ];
    buildInputs =
      (self.nativeDeps."read-all-stream" or []);
    deps = {
      "readable-stream-1.1.13" = self.by-version."readable-stream"."1.1.13";
    };
    peerDependencies = [
    ];
    passthru.names = [ "read-all-stream" ];
  };
  by-spec."readable-stream"."^1.1.13" =
    self.by-version."readable-stream"."1.1.13";
  by-version."readable-stream"."1.1.13" = lib.makeOverridable self.buildNodePackage {
    name = "readable-stream-1.1.13";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/readable-stream/-/readable-stream-1.1.13.tgz";
        name = "readable-stream-1.1.13.tgz";
        sha1 = "f6eef764f514c89e2b9e23146a75ba106756d23e";
      })
    ];
    buildInputs =
      (self.nativeDeps."readable-stream" or []);
    deps = {
      "core-util-is-1.0.1" = self.by-version."core-util-is"."1.0.1";
      "isarray-0.0.1" = self.by-version."isarray"."0.0.1";
      "string_decoder-0.10.31" = self.by-version."string_decoder"."0.10.31";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "readable-stream" ];
  };
  by-spec."readable-stream"."^1.1.8" =
    self.by-version."readable-stream"."1.1.13";
  by-spec."readable-stream"."~1.0.26" =
    self.by-version."readable-stream"."1.0.33";
  by-version."readable-stream"."1.0.33" = lib.makeOverridable self.buildNodePackage {
    name = "readable-stream-1.0.33";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/readable-stream/-/readable-stream-1.0.33.tgz";
        name = "readable-stream-1.0.33.tgz";
        sha1 = "3a360dd66c1b1d7fd4705389860eda1d0f61126c";
      })
    ];
    buildInputs =
      (self.nativeDeps."readable-stream" or []);
    deps = {
      "core-util-is-1.0.1" = self.by-version."core-util-is"."1.0.1";
      "isarray-0.0.1" = self.by-version."isarray"."0.0.1";
      "string_decoder-0.10.31" = self.by-version."string_decoder"."0.10.31";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "readable-stream" ];
  };
  by-spec."readable-stream"."~1.0.33" =
    self.by-version."readable-stream"."1.0.33";
  by-spec."readable-stream"."~1.1.13" =
    self.by-version."readable-stream"."1.1.13";
  by-spec."readline2"."^0.1.1" =
    self.by-version."readline2"."0.1.1";
  by-version."readline2"."0.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "readline2-0.1.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/readline2/-/readline2-0.1.1.tgz";
        name = "readline2-0.1.1.tgz";
        sha1 = "99443ba6e83b830ef3051bfd7dc241a82728d568";
      })
    ];
    buildInputs =
      (self.nativeDeps."readline2" or []);
    deps = {
      "mute-stream-0.0.4" = self.by-version."mute-stream"."0.0.4";
      "strip-ansi-2.0.1" = self.by-version."strip-ansi"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "readline2" ];
  };
  by-spec."readline2"."~0.1.0" =
    self.by-version."readline2"."0.1.1";
  by-spec."redeyed"."~0.4.0" =
    self.by-version."redeyed"."0.4.4";
  by-version."redeyed"."0.4.4" = lib.makeOverridable self.buildNodePackage {
    name = "redeyed-0.4.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/redeyed/-/redeyed-0.4.4.tgz";
        name = "redeyed-0.4.4.tgz";
        sha1 = "37e990a6f2b21b2a11c2e6a48fd4135698cba97f";
      })
    ];
    buildInputs =
      (self.nativeDeps."redeyed" or []);
    deps = {
      "esprima-1.0.4" = self.by-version."esprima"."1.0.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "redeyed" ];
  };
  by-spec."registry-url"."^3.0.0" =
    self.by-version."registry-url"."3.0.3";
  by-version."registry-url"."3.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "registry-url-3.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/registry-url/-/registry-url-3.0.3.tgz";
        name = "registry-url-3.0.3.tgz";
        sha1 = "c9f5102e0fd9c9f250522a7f19f68672c84ccc96";
      })
    ];
    buildInputs =
      (self.nativeDeps."registry-url" or []);
    deps = {
      "rc-1.0.3" = self.by-version."rc"."1.0.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "registry-url" ];
  };
  by-spec."request"."2 >=2.20.0" =
    self.by-version."request"."2.55.0";
  by-version."request"."2.55.0" = lib.makeOverridable self.buildNodePackage {
    name = "request-2.55.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request/-/request-2.55.0.tgz";
        name = "request-2.55.0.tgz";
        sha1 = "d75c1cdf679d76bb100f9bffe1fe551b5c24e93d";
      })
    ];
    buildInputs =
      (self.nativeDeps."request" or []);
    deps = {
      "bl-0.9.4" = self.by-version."bl"."0.9.4";
      "caseless-0.9.0" = self.by-version."caseless"."0.9.0";
      "forever-agent-0.6.1" = self.by-version."forever-agent"."0.6.1";
      "form-data-0.2.0" = self.by-version."form-data"."0.2.0";
      "json-stringify-safe-5.0.1" = self.by-version."json-stringify-safe"."5.0.1";
      "mime-types-2.0.12" = self.by-version."mime-types"."2.0.12";
      "node-uuid-1.4.3" = self.by-version."node-uuid"."1.4.3";
      "qs-2.4.2" = self.by-version."qs"."2.4.2";
      "tunnel-agent-0.4.0" = self.by-version."tunnel-agent"."0.4.0";
      "tough-cookie-1.2.0" = self.by-version."tough-cookie"."1.2.0";
      "http-signature-0.10.1" = self.by-version."http-signature"."0.10.1";
      "oauth-sign-0.6.0" = self.by-version."oauth-sign"."0.6.0";
      "hawk-2.3.1" = self.by-version."hawk"."2.3.1";
      "aws-sign2-0.5.0" = self.by-version."aws-sign2"."0.5.0";
      "stringstream-0.0.4" = self.by-version."stringstream"."0.0.4";
      "combined-stream-0.0.7" = self.by-version."combined-stream"."0.0.7";
      "isstream-0.1.2" = self.by-version."isstream"."0.1.2";
      "har-validator-1.7.0" = self.by-version."har-validator"."1.7.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request" ];
  };
  by-spec."request"."2 >=2.25.0" =
    self.by-version."request"."2.55.0";
  by-spec."request"."2.53.0" =
    self.by-version."request"."2.53.0";
  by-version."request"."2.53.0" = lib.makeOverridable self.buildNodePackage {
    name = "request-2.53.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request/-/request-2.53.0.tgz";
        name = "request-2.53.0.tgz";
        sha1 = "180a3ae92b7b639802e4f9545dd8fcdeb71d760c";
      })
    ];
    buildInputs =
      (self.nativeDeps."request" or []);
    deps = {
      "bl-0.9.4" = self.by-version."bl"."0.9.4";
      "caseless-0.9.0" = self.by-version."caseless"."0.9.0";
      "forever-agent-0.5.2" = self.by-version."forever-agent"."0.5.2";
      "form-data-0.2.0" = self.by-version."form-data"."0.2.0";
      "json-stringify-safe-5.0.1" = self.by-version."json-stringify-safe"."5.0.1";
      "mime-types-2.0.12" = self.by-version."mime-types"."2.0.12";
      "node-uuid-1.4.3" = self.by-version."node-uuid"."1.4.3";
      "qs-2.3.3" = self.by-version."qs"."2.3.3";
      "tunnel-agent-0.4.0" = self.by-version."tunnel-agent"."0.4.0";
      "tough-cookie-1.2.0" = self.by-version."tough-cookie"."1.2.0";
      "http-signature-0.10.1" = self.by-version."http-signature"."0.10.1";
      "oauth-sign-0.6.0" = self.by-version."oauth-sign"."0.6.0";
      "hawk-2.3.1" = self.by-version."hawk"."2.3.1";
      "aws-sign2-0.5.0" = self.by-version."aws-sign2"."0.5.0";
      "stringstream-0.0.4" = self.by-version."stringstream"."0.0.4";
      "combined-stream-0.0.7" = self.by-version."combined-stream"."0.0.7";
      "isstream-0.1.2" = self.by-version."isstream"."0.1.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request" ];
  };
  by-spec."request"."^2.40.0" =
    self.by-version."request"."2.55.0";
  by-spec."request"."~2.51.0" =
    self.by-version."request"."2.51.0";
  by-version."request"."2.51.0" = lib.makeOverridable self.buildNodePackage {
    name = "request-2.51.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request/-/request-2.51.0.tgz";
        name = "request-2.51.0.tgz";
        sha1 = "35d00bbecc012e55f907b1bd9e0dbd577bfef26e";
      })
    ];
    buildInputs =
      (self.nativeDeps."request" or []);
    deps = {
      "bl-0.9.4" = self.by-version."bl"."0.9.4";
      "caseless-0.8.0" = self.by-version."caseless"."0.8.0";
      "forever-agent-0.5.2" = self.by-version."forever-agent"."0.5.2";
      "form-data-0.2.0" = self.by-version."form-data"."0.2.0";
      "json-stringify-safe-5.0.1" = self.by-version."json-stringify-safe"."5.0.1";
      "mime-types-1.0.2" = self.by-version."mime-types"."1.0.2";
      "node-uuid-1.4.3" = self.by-version."node-uuid"."1.4.3";
      "qs-2.3.3" = self.by-version."qs"."2.3.3";
      "tunnel-agent-0.4.0" = self.by-version."tunnel-agent"."0.4.0";
      "tough-cookie-1.2.0" = self.by-version."tough-cookie"."1.2.0";
      "http-signature-0.10.1" = self.by-version."http-signature"."0.10.1";
      "oauth-sign-0.5.0" = self.by-version."oauth-sign"."0.5.0";
      "hawk-1.1.1" = self.by-version."hawk"."1.1.1";
      "aws-sign2-0.5.0" = self.by-version."aws-sign2"."0.5.0";
      "stringstream-0.0.4" = self.by-version."stringstream"."0.0.4";
      "combined-stream-0.0.7" = self.by-version."combined-stream"."0.0.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request" ];
  };
  by-spec."request-progress"."0.3.1" =
    self.by-version."request-progress"."0.3.1";
  by-version."request-progress"."0.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "request-progress-0.3.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request-progress/-/request-progress-0.3.1.tgz";
        name = "request-progress-0.3.1.tgz";
        sha1 = "0721c105d8a96ac6b2ce8b2c89ae2d5ecfcf6b3a";
      })
    ];
    buildInputs =
      (self.nativeDeps."request-progress" or []);
    deps = {
      "throttleit-0.0.2" = self.by-version."throttleit"."0.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request-progress" ];
  };
  by-spec."request-replay"."~0.2.0" =
    self.by-version."request-replay"."0.2.0";
  by-version."request-replay"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "request-replay-0.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/request-replay/-/request-replay-0.2.0.tgz";
        name = "request-replay-0.2.0.tgz";
        sha1 = "9b693a5d118b39f5c596ead5ed91a26444057f60";
      })
    ];
    buildInputs =
      (self.nativeDeps."request-replay" or []);
    deps = {
      "retry-0.6.1" = self.by-version."retry"."0.6.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "request-replay" ];
  };
  by-spec."retry"."0.6.0" =
    self.by-version."retry"."0.6.0";
  by-version."retry"."0.6.0" = lib.makeOverridable self.buildNodePackage {
    name = "retry-0.6.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/retry/-/retry-0.6.0.tgz";
        name = "retry-0.6.0.tgz";
        sha1 = "1c010713279a6fd1e8def28af0c3ff1871caa537";
      })
    ];
    buildInputs =
      (self.nativeDeps."retry" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "retry" ];
  };
  by-spec."retry"."0.6.1" =
    self.by-version."retry"."0.6.1";
  by-version."retry"."0.6.1" = lib.makeOverridable self.buildNodePackage {
    name = "retry-0.6.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/retry/-/retry-0.6.1.tgz";
        name = "retry-0.6.1.tgz";
        sha1 = "fdc90eed943fde11b893554b8cc63d0e899ba918";
      })
    ];
    buildInputs =
      (self.nativeDeps."retry" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "retry" ];
  };
  by-spec."retry"."~0.6.0" =
    self.by-version."retry"."0.6.1";
  by-spec."rimraf"."2" =
    self.by-version."rimraf"."2.3.4";
  by-version."rimraf"."2.3.4" = lib.makeOverridable self.buildNodePackage {
    name = "rimraf-2.3.4";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/rimraf/-/rimraf-2.3.4.tgz";
        name = "rimraf-2.3.4.tgz";
        sha1 = "82d9bc1b2fcf31e205ac7b28138a025d08e9159a";
      })
    ];
    buildInputs =
      (self.nativeDeps."rimraf" or []);
    deps = {
      "glob-4.5.3" = self.by-version."glob"."4.5.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "rimraf" ];
  };
  by-spec."rimraf"."^2.2.8" =
    self.by-version."rimraf"."2.3.4";
  by-spec."rimraf"."~2" =
    self.by-version."rimraf"."2.3.4";
  by-spec."rimraf"."~2.1.4" =
    self.by-version."rimraf"."2.1.4";
  by-version."rimraf"."2.1.4" = lib.makeOverridable self.buildNodePackage {
    name = "rimraf-2.1.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/rimraf/-/rimraf-2.1.4.tgz";
        name = "rimraf-2.1.4.tgz";
        sha1 = "5a6eb62eeda068f51ede50f29b3e5cd22f3d9bb2";
      })
    ];
    buildInputs =
      (self.nativeDeps."rimraf" or []);
    deps = {
      "graceful-fs-1.2.3" = self.by-version."graceful-fs"."1.2.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "rimraf" ];
  };
  by-spec."rimraf"."~2.2.0" =
    self.by-version."rimraf"."2.2.8";
  by-version."rimraf"."2.2.8" = lib.makeOverridable self.buildNodePackage {
    name = "rimraf-2.2.8";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/rimraf/-/rimraf-2.2.8.tgz";
        name = "rimraf-2.2.8.tgz";
        sha1 = "e439be2aaee327321952730f99a8929e4fc50582";
      })
    ];
    buildInputs =
      (self.nativeDeps."rimraf" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "rimraf" ];
  };
  by-spec."rx"."^2.2.27" =
    self.by-version."rx"."2.5.2";
  by-version."rx"."2.5.2" = lib.makeOverridable self.buildNodePackage {
    name = "rx-2.5.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/rx/-/rx-2.5.2.tgz";
        name = "rx-2.5.2.tgz";
        sha1 = "52f236b5a6d24e538aa1fba88152909322a02886";
      })
    ];
    buildInputs =
      (self.nativeDeps."rx" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "rx" ];
  };
  by-spec."rx"."^2.4.3" =
    self.by-version."rx"."2.5.2";
  by-spec."semver"."2" =
    self.by-version."semver"."2.3.2";
  by-version."semver"."2.3.2" = lib.makeOverridable self.buildNodePackage {
    name = "semver-2.3.2";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/semver/-/semver-2.3.2.tgz";
        name = "semver-2.3.2.tgz";
        sha1 = "b9848f25d6cf36333073ec9ef8856d42f1233e52";
      })
    ];
    buildInputs =
      (self.nativeDeps."semver" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "semver" ];
  };
  by-spec."semver".">=2.0.10 <3.0.0" =
    self.by-version."semver"."2.3.2";
  by-spec."semver".">=2.2.1 <3" =
    self.by-version."semver"."2.3.2";
  by-spec."semver"."^2.3.0" =
    self.by-version."semver"."2.3.2";
  by-spec."semver"."^4.0.0" =
    self.by-version."semver"."4.3.4";
  by-version."semver"."4.3.4" = lib.makeOverridable self.buildNodePackage {
    name = "semver-4.3.4";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/semver/-/semver-4.3.4.tgz";
        name = "semver-4.3.4.tgz";
        sha1 = "bf43a1aae304de040e12a13f84200ca7aeab7589";
      })
    ];
    buildInputs =
      (self.nativeDeps."semver" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "semver" ];
  };
  by-spec."semver"."~2.0.5" =
    self.by-version."semver"."2.0.11";
  by-version."semver"."2.0.11" = lib.makeOverridable self.buildNodePackage {
    name = "semver-2.0.11";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/semver/-/semver-2.0.11.tgz";
        name = "semver-2.0.11.tgz";
        sha1 = "f51f07d03fa5af79beb537fc067a7e141786cced";
      })
    ];
    buildInputs =
      (self.nativeDeps."semver" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "semver" ];
  };
  by-spec."semver-diff"."^2.0.0" =
    self.by-version."semver-diff"."2.0.0";
  by-version."semver-diff"."2.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "semver-diff-2.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/semver-diff/-/semver-diff-2.0.0.tgz";
        name = "semver-diff-2.0.0.tgz";
        sha1 = "d43024f91aa7843937dc1379002766809f7480d2";
      })
    ];
    buildInputs =
      (self.nativeDeps."semver-diff" or []);
    deps = {
      "semver-4.3.4" = self.by-version."semver"."4.3.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "semver-diff" ];
  };
  by-spec."shell-quote"."^1.4.2" =
    self.by-version."shell-quote"."1.4.3";
  by-version."shell-quote"."1.4.3" = lib.makeOverridable self.buildNodePackage {
    name = "shell-quote-1.4.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/shell-quote/-/shell-quote-1.4.3.tgz";
        name = "shell-quote-1.4.3.tgz";
        sha1 = "952c44e0b1ed9013ef53958179cc643e8777466b";
      })
    ];
    buildInputs =
      (self.nativeDeps."shell-quote" or []);
    deps = {
      "jsonify-0.0.0" = self.by-version."jsonify"."0.0.0";
      "array-filter-0.0.1" = self.by-version."array-filter"."0.0.1";
      "array-reduce-0.0.0" = self.by-version."array-reduce"."0.0.0";
      "array-map-0.0.0" = self.by-version."array-map"."0.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "shell-quote" ];
  };
  by-spec."sigmund"."~1.0.0" =
    self.by-version."sigmund"."1.0.1";
  by-version."sigmund"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "sigmund-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/sigmund/-/sigmund-1.0.1.tgz";
        name = "sigmund-1.0.1.tgz";
        sha1 = "3ff21f198cad2175f9f3b781853fd94d0d19b590";
      })
    ];
    buildInputs =
      (self.nativeDeps."sigmund" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "sigmund" ];
  };
  by-spec."slide"."~1.1.3" =
    self.by-version."slide"."1.1.6";
  by-version."slide"."1.1.6" = lib.makeOverridable self.buildNodePackage {
    name = "slide-1.1.6";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/slide/-/slide-1.1.6.tgz";
        name = "slide-1.1.6.tgz";
        sha1 = "56eb027d65b4d2dce6cb2e2d32c4d4afc9e1d707";
      })
    ];
    buildInputs =
      (self.nativeDeps."slide" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "slide" ];
  };
  by-spec."sntp"."0.2.x" =
    self.by-version."sntp"."0.2.4";
  by-version."sntp"."0.2.4" = lib.makeOverridable self.buildNodePackage {
    name = "sntp-0.2.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/sntp/-/sntp-0.2.4.tgz";
        name = "sntp-0.2.4.tgz";
        sha1 = "fb885f18b0f3aad189f824862536bceeec750900";
      })
    ];
    buildInputs =
      (self.nativeDeps."sntp" or []);
    deps = {
      "hoek-0.9.1" = self.by-version."hoek"."0.9.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "sntp" ];
  };
  by-spec."sntp"."1.x.x" =
    self.by-version."sntp"."1.0.9";
  by-version."sntp"."1.0.9" = lib.makeOverridable self.buildNodePackage {
    name = "sntp-1.0.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/sntp/-/sntp-1.0.9.tgz";
        name = "sntp-1.0.9.tgz";
        sha1 = "6541184cc90aeea6c6e7b35e2659082443c66198";
      })
    ];
    buildInputs =
      (self.nativeDeps."sntp" or []);
    deps = {
      "hoek-2.14.0" = self.by-version."hoek"."2.14.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "sntp" ];
  };
  by-spec."source-map"."0.1.34" =
    self.by-version."source-map"."0.1.34";
  by-version."source-map"."0.1.34" = lib.makeOverridable self.buildNodePackage {
    name = "source-map-0.1.34";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/source-map/-/source-map-0.1.34.tgz";
        name = "source-map-0.1.34.tgz";
        sha1 = "a7cfe89aec7b1682c3b198d0acfb47d7d090566b";
      })
    ];
    buildInputs =
      (self.nativeDeps."source-map" or []);
    deps = {
      "amdefine-0.1.0" = self.by-version."amdefine"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "source-map" ];
  };
  by-spec."source-map"."~0.1.7" =
    self.by-version."source-map"."0.1.43";
  by-version."source-map"."0.1.43" = lib.makeOverridable self.buildNodePackage {
    name = "source-map-0.1.43";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/source-map/-/source-map-0.1.43.tgz";
        name = "source-map-0.1.43.tgz";
        sha1 = "c24bc146ca517c1471f5dacbe2571b2b7f9e3346";
      })
    ];
    buildInputs =
      (self.nativeDeps."source-map" or []);
    deps = {
      "amdefine-0.1.0" = self.by-version."amdefine"."0.1.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "source-map" ];
  };
  by-spec."sprintf-js"."~1.0.2" =
    self.by-version."sprintf-js"."1.0.2";
  by-version."sprintf-js"."1.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "sprintf-js-1.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.2.tgz";
        name = "sprintf-js-1.0.2.tgz";
        sha1 = "11e4d84ff32144e35b0bf3a66f8587f38d8f9978";
      })
    ];
    buildInputs =
      (self.nativeDeps."sprintf-js" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "sprintf-js" ];
  };
  by-spec."statuses"."^1.2.1" =
    self.by-version."statuses"."1.2.1";
  by-version."statuses"."1.2.1" = lib.makeOverridable self.buildNodePackage {
    name = "statuses-1.2.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/statuses/-/statuses-1.2.1.tgz";
        name = "statuses-1.2.1.tgz";
        sha1 = "dded45cc18256d51ed40aec142489d5c61026d28";
      })
    ];
    buildInputs =
      (self.nativeDeps."statuses" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "statuses" ];
  };
  by-spec."string-length"."^1.0.0" =
    self.by-version."string-length"."1.0.0";
  by-version."string-length"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "string-length-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/string-length/-/string-length-1.0.0.tgz";
        name = "string-length-1.0.0.tgz";
        sha1 = "5f0564b174feb299595a763da71513266370d3a9";
      })
    ];
    buildInputs =
      (self.nativeDeps."string-length" or []);
    deps = {
      "strip-ansi-2.0.1" = self.by-version."strip-ansi"."2.0.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "string-length" ];
  };
  by-spec."string_decoder"."~0.10.x" =
    self.by-version."string_decoder"."0.10.31";
  by-version."string_decoder"."0.10.31" = lib.makeOverridable self.buildNodePackage {
    name = "string_decoder-0.10.31";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz";
        name = "string_decoder-0.10.31.tgz";
        sha1 = "62e203bc41766c6c28c9fc84301dab1c5310fa94";
      })
    ];
    buildInputs =
      (self.nativeDeps."string_decoder" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "string_decoder" ];
  };
  by-spec."stringify-object"."^1.0.0" =
    self.by-version."stringify-object"."1.0.1";
  by-version."stringify-object"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "stringify-object-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/stringify-object/-/stringify-object-1.0.1.tgz";
        name = "stringify-object-1.0.1.tgz";
        sha1 = "86d35e7dbfbce9aa45637d7ecdd7847e159db8a2";
      })
    ];
    buildInputs =
      (self.nativeDeps."stringify-object" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "stringify-object" ];
  };
  by-spec."stringstream"."~0.0.4" =
    self.by-version."stringstream"."0.0.4";
  by-version."stringstream"."0.0.4" = lib.makeOverridable self.buildNodePackage {
    name = "stringstream-0.0.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/stringstream/-/stringstream-0.0.4.tgz";
        name = "stringstream-0.0.4.tgz";
        sha1 = "0f0e3423f942960b5692ac324a57dd093bc41a92";
      })
    ];
    buildInputs =
      (self.nativeDeps."stringstream" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "stringstream" ];
  };
  by-spec."strip-ansi"."^0.3.0" =
    self.by-version."strip-ansi"."0.3.0";
  by-version."strip-ansi"."0.3.0" = lib.makeOverridable self.buildNodePackage {
    name = "strip-ansi-0.3.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/strip-ansi/-/strip-ansi-0.3.0.tgz";
        name = "strip-ansi-0.3.0.tgz";
        sha1 = "25f48ea22ca79187f3174a4db8759347bb126220";
      })
    ];
    buildInputs =
      (self.nativeDeps."strip-ansi" or []);
    deps = {
      "ansi-regex-0.2.1" = self.by-version."ansi-regex"."0.2.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "strip-ansi" ];
  };
  by-spec."strip-ansi"."^2.0.0" =
    self.by-version."strip-ansi"."2.0.1";
  by-version."strip-ansi"."2.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "strip-ansi-2.0.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/strip-ansi/-/strip-ansi-2.0.1.tgz";
        name = "strip-ansi-2.0.1.tgz";
        sha1 = "df62c1aa94ed2f114e1d0f21fd1d50482b79a60e";
      })
    ];
    buildInputs =
      (self.nativeDeps."strip-ansi" or []);
    deps = {
      "ansi-regex-1.1.1" = self.by-version."ansi-regex"."1.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "strip-ansi" ];
  };
  by-spec."strip-ansi"."^2.0.1" =
    self.by-version."strip-ansi"."2.0.1";
  by-spec."strip-json-comments"."0.1.x" =
    self.by-version."strip-json-comments"."0.1.3";
  by-version."strip-json-comments"."0.1.3" = lib.makeOverridable self.buildNodePackage {
    name = "strip-json-comments-0.1.3";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/strip-json-comments/-/strip-json-comments-0.1.3.tgz";
        name = "strip-json-comments-0.1.3.tgz";
        sha1 = "164c64e370a8a3cc00c9e01b539e569823f0ee54";
      })
    ];
    buildInputs =
      (self.nativeDeps."strip-json-comments" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "strip-json-comments" ];
  };
  by-spec."supports-color"."^0.2.0" =
    self.by-version."supports-color"."0.2.0";
  by-version."supports-color"."0.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "supports-color-0.2.0";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/supports-color/-/supports-color-0.2.0.tgz";
        name = "supports-color-0.2.0.tgz";
        sha1 = "d92de2694eb3f67323973d7ae3d8b55b4c22190a";
      })
    ];
    buildInputs =
      (self.nativeDeps."supports-color" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "supports-color" ];
  };
  by-spec."supports-color"."^1.3.0" =
    self.by-version."supports-color"."1.3.1";
  by-version."supports-color"."1.3.1" = lib.makeOverridable self.buildNodePackage {
    name = "supports-color-1.3.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/supports-color/-/supports-color-1.3.1.tgz";
        name = "supports-color-1.3.1.tgz";
        sha1 = "15758df09d8ff3b4acc307539fabe27095e1042d";
      })
    ];
    buildInputs =
      (self.nativeDeps."supports-color" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "supports-color" ];
  };
  by-spec."tar"."0.1.17" =
    self.by-version."tar"."0.1.17";
  by-version."tar"."0.1.17" = lib.makeOverridable self.buildNodePackage {
    name = "tar-0.1.17";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tar/-/tar-0.1.17.tgz";
        name = "tar-0.1.17.tgz";
        sha1 = "408c8a95deb8e78a65b59b1a51a333183a32badc";
      })
    ];
    buildInputs =
      (self.nativeDeps."tar" or []);
    deps = {
      "inherits-1.0.0" = self.by-version."inherits"."1.0.0";
      "block-stream-0.0.8" = self.by-version."block-stream"."0.0.8";
      "fstream-0.1.31" = self.by-version."fstream"."0.1.31";
    };
    peerDependencies = [
    ];
    passthru.names = [ "tar" ];
  };
  by-spec."tar-fs"."^1.4.1" =
    self.by-version."tar-fs"."1.5.1";
  by-version."tar-fs"."1.5.1" = lib.makeOverridable self.buildNodePackage {
    name = "tar-fs-1.5.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tar-fs/-/tar-fs-1.5.1.tgz";
        name = "tar-fs-1.5.1.tgz";
        sha1 = "5fc6744cf79c1331330112cbdc290aa6ebf0eda8";
      })
    ];
    buildInputs =
      (self.nativeDeps."tar-fs" or []);
    deps = {
      "mkdirp-0.5.1" = self.by-version."mkdirp"."0.5.1";
      "pump-1.0.0" = self.by-version."pump"."1.0.0";
      "tar-stream-1.1.5" = self.by-version."tar-stream"."1.1.5";
    };
    peerDependencies = [
    ];
    passthru.names = [ "tar-fs" ];
  };
  by-spec."tar-stream"."^1.1.2" =
    self.by-version."tar-stream"."1.1.5";
  by-version."tar-stream"."1.1.5" = lib.makeOverridable self.buildNodePackage {
    name = "tar-stream-1.1.5";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tar-stream/-/tar-stream-1.1.5.tgz";
        name = "tar-stream-1.1.5.tgz";
        sha1 = "be9218c130c20029e107b0f967fb23de0579d13c";
      })
    ];
    buildInputs =
      (self.nativeDeps."tar-stream" or []);
    deps = {
      "bl-0.9.4" = self.by-version."bl"."0.9.4";
      "end-of-stream-1.1.0" = self.by-version."end-of-stream"."1.1.0";
      "readable-stream-1.0.33" = self.by-version."readable-stream"."1.0.33";
      "xtend-4.0.0" = self.by-version."xtend"."4.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "tar-stream" ];
  };
  by-spec."temp"."0.6.0" =
    self.by-version."temp"."0.6.0";
  by-version."temp"."0.6.0" = lib.makeOverridable self.buildNodePackage {
    name = "temp-0.6.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/temp/-/temp-0.6.0.tgz";
        name = "temp-0.6.0.tgz";
        sha1 = "6b13df5cddf370f2e3a606ca40f202c419173f07";
      })
    ];
    buildInputs =
      (self.nativeDeps."temp" or []);
    deps = {
      "rimraf-2.1.4" = self.by-version."rimraf"."2.1.4";
      "osenv-0.0.3" = self.by-version."osenv"."0.0.3";
    };
    peerDependencies = [
    ];
    passthru.names = [ "temp" ];
  };
  by-spec."throttleit"."~0.0.2" =
    self.by-version."throttleit"."0.0.2";
  by-version."throttleit"."0.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "throttleit-0.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/throttleit/-/throttleit-0.0.2.tgz";
        name = "throttleit-0.0.2.tgz";
        sha1 = "cfedf88e60c00dd9697b61fdd2a8343a9b680eaf";
      })
    ];
    buildInputs =
      (self.nativeDeps."throttleit" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "throttleit" ];
  };
  by-spec."through"."^2.3.6" =
    self.by-version."through"."2.3.7";
  by-version."through"."2.3.7" = lib.makeOverridable self.buildNodePackage {
    name = "through-2.3.7";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/through/-/through-2.3.7.tgz";
        name = "through-2.3.7.tgz";
        sha1 = "5fcc3690fed2fdf98c6fc88b4d207a4624ac3b87";
      })
    ];
    buildInputs =
      (self.nativeDeps."through" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "through" ];
  };
  by-spec."through"."~2.3.4" =
    self.by-version."through"."2.3.7";
  by-spec."timed-out"."^2.0.0" =
    self.by-version."timed-out"."2.0.0";
  by-version."timed-out"."2.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "timed-out-2.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/timed-out/-/timed-out-2.0.0.tgz";
        name = "timed-out-2.0.0.tgz";
        sha1 = "f38b0ae81d3747d628001f41dafc652ace671c0a";
      })
    ];
    buildInputs =
      (self.nativeDeps."timed-out" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "timed-out" ];
  };
  by-spec."timers-ext"."0.1" =
    self.by-version."timers-ext"."0.1.0";
  by-version."timers-ext"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "timers-ext-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/timers-ext/-/timers-ext-0.1.0.tgz";
        name = "timers-ext-0.1.0.tgz";
        sha1 = "00345a2ca93089d1251322054389d263e27b77e2";
      })
    ];
    buildInputs =
      (self.nativeDeps."timers-ext" or []);
    deps = {
      "es5-ext-0.10.7" = self.by-version."es5-ext"."0.10.7";
      "next-tick-0.2.2" = self.by-version."next-tick"."0.2.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "timers-ext" ];
  };
  by-spec."tmp"."0.0.24" =
    self.by-version."tmp"."0.0.24";
  by-version."tmp"."0.0.24" = lib.makeOverridable self.buildNodePackage {
    name = "tmp-0.0.24";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tmp/-/tmp-0.0.24.tgz";
        name = "tmp-0.0.24.tgz";
        sha1 = "d6a5e198d14a9835cc6f2d7c3d9e302428c8cf12";
      })
    ];
    buildInputs =
      (self.nativeDeps."tmp" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "tmp" ];
  };
  by-spec."touch"."0.0.3" =
    self.by-version."touch"."0.0.3";
  by-version."touch"."0.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "touch-0.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/touch/-/touch-0.0.3.tgz";
        name = "touch-0.0.3.tgz";
        sha1 = "51aef3d449571d4f287a5d87c9c8b49181a0db1d";
      })
    ];
    buildInputs =
      (self.nativeDeps."touch" or []);
    deps = {
      "nopt-1.0.10" = self.by-version."nopt"."1.0.10";
    };
    peerDependencies = [
    ];
    passthru.names = [ "touch" ];
  };
  by-spec."tough-cookie".">=0.12.0" =
    self.by-version."tough-cookie"."1.2.0";
  by-version."tough-cookie"."1.2.0" = lib.makeOverridable self.buildNodePackage {
    name = "tough-cookie-1.2.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tough-cookie/-/tough-cookie-1.2.0.tgz";
        name = "tough-cookie-1.2.0.tgz";
        sha1 = "9b7e9d98e769e80b5aa899d944fe44e02ebf82ad";
      })
    ];
    buildInputs =
      (self.nativeDeps."tough-cookie" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "tough-cookie" ];
  };
  by-spec."tough-cookie"."^0.12.1" =
    self.by-version."tough-cookie"."0.12.1";
  by-version."tough-cookie"."0.12.1" = lib.makeOverridable self.buildNodePackage {
    name = "tough-cookie-0.12.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tough-cookie/-/tough-cookie-0.12.1.tgz";
        name = "tough-cookie-0.12.1.tgz";
        sha1 = "8220c7e21abd5b13d96804254bd5a81ebf2c7d62";
      })
    ];
    buildInputs =
      (self.nativeDeps."tough-cookie" or []);
    deps = {
      "punycode-1.3.2" = self.by-version."punycode"."1.3.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "tough-cookie" ];
  };
  by-spec."traverse".">=0.3.0 <0.4" =
    self.by-version."traverse"."0.3.9";
  by-version."traverse"."0.3.9" = lib.makeOverridable self.buildNodePackage {
    name = "traverse-0.3.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/traverse/-/traverse-0.3.9.tgz";
        name = "traverse-0.3.9.tgz";
        sha1 = "717b8f220cc0bb7b44e40514c22b2e8bbc70d8b9";
      })
    ];
    buildInputs =
      (self.nativeDeps."traverse" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "traverse" ];
  };
  by-spec."tunnel-agent"."~0.4.0" =
    self.by-version."tunnel-agent"."0.4.0";
  by-version."tunnel-agent"."0.4.0" = lib.makeOverridable self.buildNodePackage {
    name = "tunnel-agent-0.4.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.4.0.tgz";
        name = "tunnel-agent-0.4.0.tgz";
        sha1 = "b1184e312ffbcf70b3b4c78e8c219de7ebb1c550";
      })
    ];
    buildInputs =
      (self.nativeDeps."tunnel-agent" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "tunnel-agent" ];
  };
  by-spec."uglify-js"."*" =
    self.by-version."uglify-js"."2.4.23";
  by-version."uglify-js"."2.4.23" = lib.makeOverridable self.buildNodePackage {
    name = "uglify-js-2.4.23";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/uglify-js/-/uglify-js-2.4.23.tgz";
        name = "uglify-js-2.4.23.tgz";
        sha1 = "be05aa6b22f1a83b21b2a49ce60fb5dffda00515";
      })
    ];
    buildInputs =
      (self.nativeDeps."uglify-js" or []);
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "source-map-0.1.34" = self.by-version."source-map"."0.1.34";
      "uglify-to-browserify-1.0.2" = self.by-version."uglify-to-browserify"."1.0.2";
      "yargs-3.5.4" = self.by-version."yargs"."3.5.4";
    };
    peerDependencies = [
    ];
    passthru.names = [ "uglify-js" ];
  };
  "uglify-js" = self.by-version."uglify-js"."2.4.23";
  by-spec."uglify-js"."~2.3" =
    self.by-version."uglify-js"."2.3.6";
  by-version."uglify-js"."2.3.6" = lib.makeOverridable self.buildNodePackage {
    name = "uglify-js-2.3.6";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/uglify-js/-/uglify-js-2.3.6.tgz";
        name = "uglify-js-2.3.6.tgz";
        sha1 = "fa0984770b428b7a9b2a8058f46355d14fef211a";
      })
    ];
    buildInputs =
      (self.nativeDeps."uglify-js" or []);
    deps = {
      "async-0.2.10" = self.by-version."async"."0.2.10";
      "source-map-0.1.43" = self.by-version."source-map"."0.1.43";
      "optimist-0.3.7" = self.by-version."optimist"."0.3.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "uglify-js" ];
  };
  by-spec."uglify-to-browserify"."~1.0.0" =
    self.by-version."uglify-to-browserify"."1.0.2";
  by-version."uglify-to-browserify"."1.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "uglify-to-browserify-1.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/uglify-to-browserify/-/uglify-to-browserify-1.0.2.tgz";
        name = "uglify-to-browserify-1.0.2.tgz";
        sha1 = "6e0924d6bda6b5afe349e39a6d632850a0f882b7";
      })
    ];
    buildInputs =
      (self.nativeDeps."uglify-to-browserify" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "uglify-to-browserify" ];
  };
  by-spec."underscore"."~1.4.3" =
    self.by-version."underscore"."1.4.4";
  by-version."underscore"."1.4.4" = lib.makeOverridable self.buildNodePackage {
    name = "underscore-1.4.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/underscore/-/underscore-1.4.4.tgz";
        name = "underscore-1.4.4.tgz";
        sha1 = "61a6a32010622afa07963bf325203cf12239d604";
      })
    ];
    buildInputs =
      (self.nativeDeps."underscore" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "underscore" ];
  };
  by-spec."underscore.string"."~2.3.1" =
    self.by-version."underscore.string"."2.3.3";
  by-version."underscore.string"."2.3.3" = lib.makeOverridable self.buildNodePackage {
    name = "underscore.string-2.3.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/underscore.string/-/underscore.string-2.3.3.tgz";
        name = "underscore.string-2.3.3.tgz";
        sha1 = "71c08bf6b428b1133f37e78fa3a21c82f7329b0d";
      })
    ];
    buildInputs =
      (self.nativeDeps."underscore.string" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "underscore.string" ];
  };
  by-spec."update-notifier"."^0.3.0" =
    self.by-version."update-notifier"."0.3.2";
  by-version."update-notifier"."0.3.2" = lib.makeOverridable self.buildNodePackage {
    name = "update-notifier-0.3.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/update-notifier/-/update-notifier-0.3.2.tgz";
        name = "update-notifier-0.3.2.tgz";
        sha1 = "22a8735baadef3320e2db928f693da898dc87777";
      })
    ];
    buildInputs =
      (self.nativeDeps."update-notifier" or []);
    deps = {
      "chalk-1.0.0" = self.by-version."chalk"."1.0.0";
      "configstore-0.3.2" = self.by-version."configstore"."0.3.2";
      "is-npm-1.0.0" = self.by-version."is-npm"."1.0.0";
      "latest-version-1.0.0" = self.by-version."latest-version"."1.0.0";
      "semver-diff-2.0.0" = self.by-version."semver-diff"."2.0.0";
      "string-length-1.0.0" = self.by-version."string-length"."1.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "update-notifier" ];
  };
  by-spec."user-home"."^1.0.0" =
    self.by-version."user-home"."1.1.1";
  by-version."user-home"."1.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "user-home-1.1.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/user-home/-/user-home-1.1.1.tgz";
        name = "user-home-1.1.1.tgz";
        sha1 = "2b5be23a32b63a7c9deb8d0f28d485724a3df190";
      })
    ];
    buildInputs =
      (self.nativeDeps."user-home" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "user-home" ];
  };
  by-spec."user-home"."^1.1.0" =
    self.by-version."user-home"."1.1.1";
  by-spec."uuid"."^2.0.1" =
    self.by-version."uuid"."2.0.1";
  by-version."uuid"."2.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "uuid-2.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/uuid/-/uuid-2.0.1.tgz";
        name = "uuid-2.0.1.tgz";
        sha1 = "c2a30dedb3e535d72ccf82e343941a50ba8533ac";
      })
    ];
    buildInputs =
      (self.nativeDeps."uuid" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "uuid" ];
  };
  by-spec."walk"."^2.3.9" =
    self.by-version."walk"."2.3.9";
  by-version."walk"."2.3.9" = lib.makeOverridable self.buildNodePackage {
    name = "walk-2.3.9";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/walk/-/walk-2.3.9.tgz";
        name = "walk-2.3.9.tgz";
        sha1 = "31b4db6678f2ae01c39ea9fb8725a9031e558a7b";
      })
    ];
    buildInputs =
      (self.nativeDeps."walk" or []);
    deps = {
      "foreachasync-3.0.0" = self.by-version."foreachasync"."3.0.0";
    };
    peerDependencies = [
    ];
    passthru.names = [ "walk" ];
  };
  by-spec."which"."^1.0.8" =
    self.by-version."which"."1.1.1";
  by-version."which"."1.1.1" = lib.makeOverridable self.buildNodePackage {
    name = "which-1.1.1";
    bin = true;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/which/-/which-1.1.1.tgz";
        name = "which-1.1.1.tgz";
        sha1 = "9ce512459946166e12c083f08ec073380fc8cbbb";
      })
    ];
    buildInputs =
      (self.nativeDeps."which" or []);
    deps = {
      "is-absolute-0.1.7" = self.by-version."is-absolute"."0.1.7";
    };
    peerDependencies = [
    ];
    passthru.names = [ "which" ];
  };
  by-spec."win-release"."^1.0.0" =
    self.by-version."win-release"."1.0.0";
  by-version."win-release"."1.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "win-release-1.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/win-release/-/win-release-1.0.0.tgz";
        name = "win-release-1.0.0.tgz";
        sha1 = "8993308dedbd8d30ad5594b6b7382a8c1d96ae5a";
      })
    ];
    buildInputs =
      (self.nativeDeps."win-release" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "win-release" ];
  };
  by-spec."window-size"."0.1.0" =
    self.by-version."window-size"."0.1.0";
  by-version."window-size"."0.1.0" = lib.makeOverridable self.buildNodePackage {
    name = "window-size-0.1.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/window-size/-/window-size-0.1.0.tgz";
        name = "window-size-0.1.0.tgz";
        sha1 = "5438cd2ea93b202efa3a19fe8887aee7c94f9c9d";
      })
    ];
    buildInputs =
      (self.nativeDeps."window-size" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "window-size" ];
  };
  by-spec."wordwrap"."0.0.2" =
    self.by-version."wordwrap"."0.0.2";
  by-version."wordwrap"."0.0.2" = lib.makeOverridable self.buildNodePackage {
    name = "wordwrap-0.0.2";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/wordwrap/-/wordwrap-0.0.2.tgz";
        name = "wordwrap-0.0.2.tgz";
        sha1 = "b79669bb42ecb409f83d583cad52ca17eaa1643f";
      })
    ];
    buildInputs =
      (self.nativeDeps."wordwrap" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "wordwrap" ];
  };
  by-spec."wordwrap"."~0.0.2" =
    self.by-version."wordwrap"."0.0.3";
  by-version."wordwrap"."0.0.3" = lib.makeOverridable self.buildNodePackage {
    name = "wordwrap-0.0.3";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/wordwrap/-/wordwrap-0.0.3.tgz";
        name = "wordwrap-0.0.3.tgz";
        sha1 = "a3d5da6cd5c0bc0008d37234bbaf1bed63059107";
      })
    ];
    buildInputs =
      (self.nativeDeps."wordwrap" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "wordwrap" ];
  };
  by-spec."wrappy"."1" =
    self.by-version."wrappy"."1.0.1";
  by-version."wrappy"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "wrappy-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/wrappy/-/wrappy-1.0.1.tgz";
        name = "wrappy-1.0.1.tgz";
        sha1 = "1e65969965ccbc2db4548c6b84a6f2c5aedd4739";
      })
    ];
    buildInputs =
      (self.nativeDeps."wrappy" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "wrappy" ];
  };
  by-spec."xdg-basedir"."^1.0.0" =
    self.by-version."xdg-basedir"."1.0.1";
  by-version."xdg-basedir"."1.0.1" = lib.makeOverridable self.buildNodePackage {
    name = "xdg-basedir-1.0.1";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/xdg-basedir/-/xdg-basedir-1.0.1.tgz";
        name = "xdg-basedir-1.0.1.tgz";
        sha1 = "14ff8f63a4fdbcb05d5b6eea22b36f3033b9f04e";
      })
    ];
    buildInputs =
      (self.nativeDeps."xdg-basedir" or []);
    deps = {
      "user-home-1.1.1" = self.by-version."user-home"."1.1.1";
    };
    peerDependencies = [
    ];
    passthru.names = [ "xdg-basedir" ];
  };
  by-spec."xtend"."^4.0.0" =
    self.by-version."xtend"."4.0.0";
  by-version."xtend"."4.0.0" = lib.makeOverridable self.buildNodePackage {
    name = "xtend-4.0.0";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/xtend/-/xtend-4.0.0.tgz";
        name = "xtend-4.0.0.tgz";
        sha1 = "8bc36ff87aedbe7ce9eaf0bca36b2354a743840f";
      })
    ];
    buildInputs =
      (self.nativeDeps."xtend" or []);
    deps = {
    };
    peerDependencies = [
    ];
    passthru.names = [ "xtend" ];
  };
  by-spec."yargs"."~3.5.4" =
    self.by-version."yargs"."3.5.4";
  by-version."yargs"."3.5.4" = lib.makeOverridable self.buildNodePackage {
    name = "yargs-3.5.4";
    bin = false;
    src = [
      (fetchurl {
        url = "http://registry.npmjs.org/yargs/-/yargs-3.5.4.tgz";
        name = "yargs-3.5.4.tgz";
        sha1 = "d8aff8f665e94c34bd259bdebd1bfaf0ddd35361";
      })
    ];
    buildInputs =
      (self.nativeDeps."yargs" or []);
    deps = {
      "camelcase-1.1.0" = self.by-version."camelcase"."1.1.0";
      "decamelize-1.0.0" = self.by-version."decamelize"."1.0.0";
      "window-size-0.1.0" = self.by-version."window-size"."0.1.0";
      "wordwrap-0.0.2" = self.by-version."wordwrap"."0.0.2";
    };
    peerDependencies = [
    ];
    passthru.names = [ "yargs" ];
  };
}
