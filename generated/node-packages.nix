{ self, fetchurl, fetchgit ? null, lib }:

{
  "cssnano-cli" = self.by-version."cssnano-cli"."1.0.4";

  by-spec."alphanum-sort"."^1.0.1" =
    self.by-version."alphanum-sort"."1.0.2";
  by-spec."alphanum-sort"."^1.0.2" =
    self.by-version."alphanum-sort"."1.0.2";
  by-version."alphanum-sort"."1.0.2" = self.buildNodePackage {
    name = "alphanum-sort";
    version = "1.0.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/alphanum-sort/-/alphanum-sort-1.0.2.tgz";
      sha256 = "19w64ypl4d7c8ds50hi8ybpn65f48qwyrmh15f32ibn1xgpr5lwr";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."ansi-regex"."^2.0.0" =
    self.by-version."ansi-regex"."2.0.0";
  by-version."ansi-regex"."2.0.0" = self.buildNodePackage {
    name = "ansi-regex";
    version = "2.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-2.0.0.tgz";
      sha256 = "0n7kd3b6q3ag7pqlkxfywq0z12raird09qvf0zl9lkvq71q77bxh";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."ansi-styles"."^2.2.1" =
    self.by-version."ansi-styles"."2.2.1";
  by-version."ansi-styles"."2.2.1" = self.buildNodePackage {
    name = "ansi-styles";
    version = "2.2.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-2.2.1.tgz";
      sha256 = "07qj2dsg3ydpj79cc8j52hzzylw8jq6xbl4yzq1573p3lnzkqq4d";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."argparse"."^1.0.7" =
    self.by-version."argparse"."1.0.7";
  by-version."argparse"."1.0.7" = self.buildNodePackage {
    name = "argparse";
    version = "1.0.7";
    src = fetchurl {
      url = "https://registry.npmjs.org/argparse/-/argparse-1.0.7.tgz";
      sha256 = "0xfgbfsxpnrqlxilff2qklp01c1gs3z1fm3nypadhdi3jrr2r793";
    };
    bin = false;
    deps = {
      "sprintf-js" = self.by-spec."sprintf-js"."~1.0.2";
    };
  };
  by-spec."autoprefixer"."^6.3.1" =
    self.by-version."autoprefixer"."6.3.7";
  by-version."autoprefixer"."6.3.7" = self.buildNodePackage {
    name = "autoprefixer";
    version = "6.3.7";
    src = fetchurl {
      url = "https://registry.npmjs.org/autoprefixer/-/autoprefixer-6.3.7.tgz";
      sha256 = "0jqbfbsfdb209mjbaqy4ajvrdla0zjhbv4h3d9h5ynhwgddd2w15";
    };
    bin = false;
    deps = {
      "browserslist" = self.by-spec."browserslist"."~1.3.4";
      "caniuse-db" = self.by-spec."caniuse-db"."^1.0.30000488";
      "normalize-range" = self.by-spec."normalize-range"."^0.1.2";
      "num2fraction" = self.by-spec."num2fraction"."^1.2.2";
      "postcss" = self.by-spec."postcss"."^5.0.21";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.2.3";
    };
  };
  by-spec."balanced-match"."^0.1.0" =
    self.by-version."balanced-match"."0.1.0";
  by-spec."balanced-match"."~0.1.0" =
    self.by-version."balanced-match"."0.1.0";
  by-version."balanced-match"."0.1.0" = self.buildNodePackage {
    name = "balanced-match";
    version = "0.1.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/balanced-match/-/balanced-match-0.1.0.tgz";
      sha256 = "0pgzrgvdlwq94h249614cdif2l5pcprzz45zd3441dn2w1c70qsg";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."browserslist"."~1.3.4" =
    self.by-version."browserslist"."1.3.4";
  by-version."browserslist"."1.3.4" = self.buildNodePackage {
    name = "browserslist";
    version = "1.3.4";
    src = fetchurl {
      url = "https://registry.npmjs.org/browserslist/-/browserslist-1.3.4.tgz";
      sha256 = "1j9yd2j8q01bvbws91wnjrfwd95hhci3y1sm86gqyglhrmbnfqnr";
    };
    bin = false;
    deps = {
      "caniuse-db" = self.by-spec."caniuse-db"."^1.0.30000488";
    };
  };
  by-spec."caniuse-db"."^1.0.30000488" =
    self.by-version."caniuse-db"."1.0.30000495";
  by-version."caniuse-db"."1.0.30000495" = self.buildNodePackage {
    name = "caniuse-db";
    version = "1.0.30000495";
    src = fetchurl {
      url = "https://registry.npmjs.org/caniuse-db/-/caniuse-db-1.0.30000495.tgz";
      sha256 = "09nkspkgmvhgm4k8hy1zbk7cnap6sy6pn4rx67j4lrns180dlh5g";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."chalk"."^1.1.3" =
    self.by-version."chalk"."1.1.3";
  by-version."chalk"."1.1.3" = self.buildNodePackage {
    name = "chalk";
    version = "1.1.3";
    src = fetchurl {
      url = "https://registry.npmjs.org/chalk/-/chalk-1.1.3.tgz";
      sha256 = "0pa4ajfiq9prr608wldd6y6w7asmgravbbx63qz6yj7s6d49r5rk";
    };
    bin = false;
    deps = {
      "ansi-styles" = self.by-spec."ansi-styles"."^2.2.1";
      "escape-string-regexp" = self.by-spec."escape-string-regexp"."^1.0.2";
      "has-ansi" = self.by-spec."has-ansi"."^2.0.0";
      "strip-ansi" = self.by-spec."strip-ansi"."^3.0.0";
      "supports-color" = self.by-spec."supports-color"."^2.0.0";
    };
  };
  by-spec."clap"."^1.0.9" =
    self.by-version."clap"."1.1.1";
  by-version."clap"."1.1.1" = self.buildNodePackage {
    name = "clap";
    version = "1.1.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/clap/-/clap-1.1.1.tgz";
      sha256 = "1nbbbcy0m14akm2bdp2fvyahi3z2sriwy90hpw3zh9n9qfq3zngl";
    };
    bin = false;
    deps = {
      "chalk" = self.by-spec."chalk"."^1.1.3";
    };
  };
  by-spec."clone"."^1.0.2" =
    self.by-version."clone"."1.0.2";
  by-version."clone"."1.0.2" = self.buildNodePackage {
    name = "clone";
    version = "1.0.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/clone/-/clone-1.0.2.tgz";
      sha256 = "1blidz5rxmfv5jh74s3k307kf9q38vk9bqb9zjx047nwb3fwc1nv";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."coa"."~1.0.1" =
    self.by-version."coa"."1.0.1";
  by-version."coa"."1.0.1" = self.buildNodePackage {
    name = "coa";
    version = "1.0.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/coa/-/coa-1.0.1.tgz";
      sha256 = "1nnj8d3qx2ypk9hbdx5ah9h7gvywxyci23ydxrp42y3cksnnpgw0";
    };
    bin = false;
    deps = {
      "q" = self.by-spec."q"."^1.1.2";
    };
  };
  by-spec."color"."^0.11.0" =
    self.by-version."color"."0.11.3";
  by-version."color"."0.11.3" = self.buildNodePackage {
    name = "color";
    version = "0.11.3";
    src = fetchurl {
      url = "https://registry.npmjs.org/color/-/color-0.11.3.tgz";
      sha256 = "1hng330n8wkdmkk0fahxivd8lp5fxhp8ggj0r48z5lj8cp912nj2";
    };
    bin = false;
    deps = {
      "clone" = self.by-spec."clone"."^1.0.2";
      "color-convert" = self.by-spec."color-convert"."^1.3.0";
      "color-string" = self.by-spec."color-string"."^0.3.0";
    };
  };
  by-spec."color-convert"."^1.3.0" =
    self.by-version."color-convert"."1.3.1";
  by-version."color-convert"."1.3.1" = self.buildNodePackage {
    name = "color-convert";
    version = "1.3.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/color-convert/-/color-convert-1.3.1.tgz";
      sha256 = "1b965aq3q1z4rsnqz7yk713d3ax894l4snvgcc87lmwc7l72b8il";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."color-name"."^1.0.0" =
    self.by-version."color-name"."1.1.1";
  by-version."color-name"."1.1.1" = self.buildNodePackage {
    name = "color-name";
    version = "1.1.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/color-name/-/color-name-1.1.1.tgz";
      sha256 = "06p80njjq7w8vd4aqzkdjs09qlm7ygaiy55dmpv6bv8p1mzik2fw";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."color-string"."^0.3.0" =
    self.by-version."color-string"."0.3.0";
  by-version."color-string"."0.3.0" = self.buildNodePackage {
    name = "color-string";
    version = "0.3.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/color-string/-/color-string-0.3.0.tgz";
      sha256 = "0kxw98pj89rrm94aa2yw5ccwpzlglh2k57y0lvmr7w6h1b66ysnp";
    };
    bin = false;
    deps = {
      "color-name" = self.by-spec."color-name"."^1.0.0";
    };
  };
  by-spec."colormin"."^1.0.5" =
    self.by-version."colormin"."1.1.1";
  by-version."colormin"."1.1.1" = self.buildNodePackage {
    name = "colormin";
    version = "1.1.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/colormin/-/colormin-1.1.1.tgz";
      sha256 = "11y39p5fc8g09g7i0givmav0cphmfssfkrfh6wpqp9z9ckm4adrq";
    };
    bin = false;
    deps = {
      "color" = self.by-spec."color"."^0.11.0";
      "css-color-names" = self.by-spec."css-color-names"."0.0.4";
    };
  };
  by-spec."colors"."~1.1.2" =
    self.by-version."colors"."1.1.2";
  by-version."colors"."1.1.2" = self.buildNodePackage {
    name = "colors";
    version = "1.1.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/colors/-/colors-1.1.2.tgz";
      sha256 = "02q6xz1c0v4w2wqxwh9sacbva7mgcyfj1habclyhjhzbxbs7zw40";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."css-color-names"."0.0.4" =
    self.by-version."css-color-names"."0.0.4";
  by-version."css-color-names"."0.0.4" = self.buildNodePackage {
    name = "css-color-names";
    version = "0.0.4";
    src = fetchurl {
      url = "https://registry.npmjs.org/css-color-names/-/css-color-names-0.0.4.tgz";
      sha256 = "18nkjg6ry9zz3ababql1slnnsqpap98cgm911q7y9dj4bnrqn6zi";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."cssnano"."^3.0.0" =
    self.by-version."cssnano"."3.7.1";
  by-version."cssnano"."3.7.1" = self.buildNodePackage {
    name = "cssnano";
    version = "3.7.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/cssnano/-/cssnano-3.7.1.tgz";
      sha256 = "1fzy4yd4xjrlva9ki8sa7az6aa4wllz6rpv9q2mlidx8lqxm30fh";
    };
    bin = false;
    deps = {
      "autoprefixer" = self.by-spec."autoprefixer"."^6.3.1";
      "decamelize" = self.by-spec."decamelize"."^1.1.2";
      "defined" = self.by-spec."defined"."^1.0.0";
      "indexes-of" = self.by-spec."indexes-of"."^1.0.1";
      "object-assign" = self.by-spec."object-assign"."^4.0.1";
      "postcss" = self.by-spec."postcss"."^5.0.14";
      "postcss-calc" = self.by-spec."postcss-calc"."^5.2.0";
      "postcss-colormin" = self.by-spec."postcss-colormin"."^2.1.8";
      "postcss-convert-values" = self.by-spec."postcss-convert-values"."^2.3.4";
      "postcss-discard-comments" = self.by-spec."postcss-discard-comments"."^2.0.4";
      "postcss-discard-duplicates" = self.by-spec."postcss-discard-duplicates"."^2.0.1";
      "postcss-discard-empty" = self.by-spec."postcss-discard-empty"."^2.0.1";
      "postcss-discard-overridden" = self.by-spec."postcss-discard-overridden"."^0.1.1";
      "postcss-discard-unused" = self.by-spec."postcss-discard-unused"."^2.2.1";
      "postcss-filter-plugins" = self.by-spec."postcss-filter-plugins"."^2.0.0";
      "postcss-merge-idents" = self.by-spec."postcss-merge-idents"."^2.1.5";
      "postcss-merge-longhand" = self.by-spec."postcss-merge-longhand"."^2.0.1";
      "postcss-merge-rules" = self.by-spec."postcss-merge-rules"."^2.0.3";
      "postcss-minify-font-values" = self.by-spec."postcss-minify-font-values"."^1.0.2";
      "postcss-minify-gradients" = self.by-spec."postcss-minify-gradients"."^1.0.1";
      "postcss-minify-params" = self.by-spec."postcss-minify-params"."^1.0.4";
      "postcss-minify-selectors" = self.by-spec."postcss-minify-selectors"."^2.0.4";
      "postcss-normalize-charset" = self.by-spec."postcss-normalize-charset"."^1.1.0";
      "postcss-normalize-url" = self.by-spec."postcss-normalize-url"."^3.0.7";
      "postcss-ordered-values" = self.by-spec."postcss-ordered-values"."^2.1.0";
      "postcss-reduce-idents" = self.by-spec."postcss-reduce-idents"."^2.2.2";
      "postcss-reduce-initial" = self.by-spec."postcss-reduce-initial"."^1.0.0";
      "postcss-reduce-transforms" = self.by-spec."postcss-reduce-transforms"."^1.0.3";
      "postcss-svgo" = self.by-spec."postcss-svgo"."^2.1.1";
      "postcss-unique-selectors" = self.by-spec."postcss-unique-selectors"."^2.0.2";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.2.3";
      "postcss-zindex" = self.by-spec."postcss-zindex"."^2.0.1";
    };
  };
  by-spec."cssnano-cli"."*" =
    self.by-version."cssnano-cli"."1.0.4";
  by-version."cssnano-cli"."1.0.4" = self.buildNodePackage {
    name = "cssnano-cli";
    version = "1.0.4";
    src = fetchurl {
      url = "https://registry.npmjs.org/cssnano-cli/-/cssnano-cli-1.0.4.tgz";
      sha256 = "0asq853i6m7cya2832h0q0jl1v8pclib1m16cgr2vjzr2z3cq8cm";
    };
    bin = false;
    deps = {
      "cssnano" = self.by-spec."cssnano"."^3.0.0";
      "minimist" = self.by-spec."minimist"."^1.2.0";
      "read-file-stdin" = self.by-spec."read-file-stdin"."^0.2.0";
      "write-file-stdout" = self.by-spec."write-file-stdout"."0.0.2";
    };
  };
  by-spec."csso"."~2.0.0" =
    self.by-version."csso"."2.0.0";
  by-version."csso"."2.0.0" = self.buildNodePackage {
    name = "csso";
    version = "2.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/csso/-/csso-2.0.0.tgz";
      sha256 = "1qadzycydjpwvn2lcls3lvrykihv6lfwbg0r753x70d94wmljl2f";
    };
    bin = false;
    deps = {
      "clap" = self.by-spec."clap"."^1.0.9";
      "source-map" = self.by-spec."source-map"."^0.5.3";
    };
  };
  by-spec."decamelize"."^1.1.2" =
    self.by-version."decamelize"."1.2.0";
  by-version."decamelize"."1.2.0" = self.buildNodePackage {
    name = "decamelize";
    version = "1.2.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/decamelize/-/decamelize-1.2.0.tgz";
      sha256 = "0r187qd80plv8mm8riqk3xcmpip3zcpsgjrvf013m37323syzbdl";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."defined"."^1.0.0" =
    self.by-version."defined"."1.0.0";
  by-version."defined"."1.0.0" = self.buildNodePackage {
    name = "defined";
    version = "1.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/defined/-/defined-1.0.0.tgz";
      sha256 = "13i7gwa2kxpp5vngzh0c1x5glxbdwgg7kanprspssqdh5swy1qk8";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."escape-string-regexp"."^1.0.2" =
    self.by-version."escape-string-regexp"."1.0.5";
  by-version."escape-string-regexp"."1.0.5" = self.buildNodePackage {
    name = "escape-string-regexp";
    version = "1.0.5";
    src = fetchurl {
      url = "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz";
      sha256 = "0iy3jirnnslnfwk8wa5xkg56fnbmg7bsv5v2a1s0qgbnfqp7j375";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."esprima"."^2.6.0" =
    self.by-version."esprima"."2.7.2";
  by-version."esprima"."2.7.2" = self.buildNodePackage {
    name = "esprima";
    version = "2.7.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/esprima/-/esprima-2.7.2.tgz";
      sha256 = "07d40dj7jhm0whvjwk0vkbvpm6w6lhq5xrhb17h8727pysk8041h";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."flatten"."1.0.2" =
    self.by-version."flatten"."1.0.2";
  by-spec."flatten"."^1.0.2" =
    self.by-version."flatten"."1.0.2";
  by-version."flatten"."1.0.2" = self.buildNodePackage {
    name = "flatten";
    version = "1.0.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/flatten/-/flatten-1.0.2.tgz";
      sha256 = "0jdhdfbvnpy3l5wc9hhfv4icn40720hi19jvvw28lbzi7rkigqvw";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."gather-stream"."^1.0.0" =
    self.by-version."gather-stream"."1.0.0";
  by-version."gather-stream"."1.0.0" = self.buildNodePackage {
    name = "gather-stream";
    version = "1.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/gather-stream/-/gather-stream-1.0.0.tgz";
      sha256 = "0lj64k1d0kksqscpyfr0sjfjcv8xgz1dzrh74gfhdmixjiiqajf9";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."has-ansi"."^2.0.0" =
    self.by-version."has-ansi"."2.0.0";
  by-version."has-ansi"."2.0.0" = self.buildNodePackage {
    name = "has-ansi";
    version = "2.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/has-ansi/-/has-ansi-2.0.0.tgz";
      sha256 = "1va48dv32ighffpqr44dl8l5mm7kc5mylkd6drcd6y0y97mna0p3";
    };
    bin = false;
    deps = {
      "ansi-regex" = self.by-spec."ansi-regex"."^2.0.0";
    };
  };
  by-spec."has-flag"."^1.0.0" =
    self.by-version."has-flag"."1.0.0";
  by-version."has-flag"."1.0.0" = self.buildNodePackage {
    name = "has-flag";
    version = "1.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/has-flag/-/has-flag-1.0.0.tgz";
      sha256 = "19sfml8lx81kdl44305h7nr3wn75jpyb2q3ijcjs4r2g6p2rxdj8";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."has-own"."^1.0.0" =
    self.by-version."has-own"."1.0.0";
  by-version."has-own"."1.0.0" = self.buildNodePackage {
    name = "has-own";
    version = "1.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/has-own/-/has-own-1.0.0.tgz";
      sha256 = "19rfgl5qv1vfrwkijsmqp9hwcmii8gisiyjji3s7hkf50cychpij";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."html-comment-regex"."^1.1.0" =
    self.by-version."html-comment-regex"."1.1.0";
  by-version."html-comment-regex"."1.1.0" = self.buildNodePackage {
    name = "html-comment-regex";
    version = "1.1.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/html-comment-regex/-/html-comment-regex-1.1.0.tgz";
      sha256 = "1f73rv6s5vaidp33jksx4cx8h0r6brycbdgipq60wpqkqnsqf4kq";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."indexes-of"."^1.0.1" =
    self.by-version."indexes-of"."1.0.1";
  by-version."indexes-of"."1.0.1" = self.buildNodePackage {
    name = "indexes-of";
    version = "1.0.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/indexes-of/-/indexes-of-1.0.1.tgz";
      sha256 = "0qjq8awadl8zbbzncbspk6vrz0wl3dr7xdgajl4bj0l4n6m4pfq8";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."is-absolute-url"."^2.0.0" =
    self.by-version."is-absolute-url"."2.0.0";
  by-version."is-absolute-url"."2.0.0" = self.buildNodePackage {
    name = "is-absolute-url";
    version = "2.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/is-absolute-url/-/is-absolute-url-2.0.0.tgz";
      sha256 = "09z1g3xha4s4k54aqcmi04vq0v3x21062n89816wvx9f1n3a15vq";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."is-plain-obj"."^1.0.0" =
    self.by-version."is-plain-obj"."1.1.0";
  by-version."is-plain-obj"."1.1.0" = self.buildNodePackage {
    name = "is-plain-obj";
    version = "1.1.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/is-plain-obj/-/is-plain-obj-1.1.0.tgz";
      sha256 = "1j17ai7dnfx23cr63whw91s7b0x096f82lfmsqz9y2p3q7wl9k5s";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."is-svg"."^2.0.0" =
    self.by-version."is-svg"."2.0.1";
  by-version."is-svg"."2.0.1" = self.buildNodePackage {
    name = "is-svg";
    version = "2.0.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/is-svg/-/is-svg-2.0.1.tgz";
      sha256 = "1wqksrzsv7fpnilfksakfwlmgrjgc1a9am68997hrwlp6nh41kyp";
    };
    bin = false;
    deps = {
      "html-comment-regex" = self.by-spec."html-comment-regex"."^1.1.0";
    };
  };
  by-spec."js-base64"."^2.1.9" =
    self.by-version."js-base64"."2.1.9";
  by-version."js-base64"."2.1.9" = self.buildNodePackage {
    name = "js-base64";
    version = "2.1.9";
    src = fetchurl {
      url = "https://registry.npmjs.org/js-base64/-/js-base64-2.1.9.tgz";
      sha256 = "1wn1z4wk8pvb4s4z8qzjk5v4s38v1v4vd16vk0kichwyszxjsikh";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."js-yaml"."~3.6.0" =
    self.by-version."js-yaml"."3.6.1";
  by-version."js-yaml"."3.6.1" = self.buildNodePackage {
    name = "js-yaml";
    version = "3.6.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/js-yaml/-/js-yaml-3.6.1.tgz";
      sha256 = "1pc5i0cyzz9j6ak5jl6p9i6kwpy3f709ym2k9v9cvyspy2r2j89m";
    };
    bin = false;
    deps = {
      "argparse" = self.by-spec."argparse"."^1.0.7";
      "esprima" = self.by-spec."esprima"."^2.6.0";
    };
  };
  by-spec."minimist"."0.0.8" =
    self.by-version."minimist"."0.0.8";
  by-version."minimist"."0.0.8" = self.buildNodePackage {
    name = "minimist";
    version = "0.0.8";
    src = fetchurl {
      url = "https://registry.npmjs.org/minimist/-/minimist-0.0.8.tgz";
      sha256 = "0csa8y60rwkyf641ry8y4qzf0ayachvnk98zkkszl8dr12iaylvr";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."minimist"."^1.2.0" =
    self.by-version."minimist"."1.2.0";
  by-version."minimist"."1.2.0" = self.buildNodePackage {
    name = "minimist";
    version = "1.2.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/minimist/-/minimist-1.2.0.tgz";
      sha256 = "0w7jll4vlqphxgk9qjbdjh3ni18lkrlfaqgsm7p14xl3f7ghn3gc";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."mkdirp"."~0.5.1" =
    self.by-version."mkdirp"."0.5.1";
  by-version."mkdirp"."0.5.1" = self.buildNodePackage {
    name = "mkdirp";
    version = "0.5.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.1.tgz";
      sha256 = "095z70b1y5dsadjf7apkwkmnvnnk6jxavkdgwzhnip6yx1q2idbp";
    };
    bin = false;
    deps = {
      "minimist" = self.by-spec."minimist"."0.0.8";
    };
  };
  by-spec."normalize-range"."^0.1.2" =
    self.by-version."normalize-range"."0.1.2";
  by-version."normalize-range"."0.1.2" = self.buildNodePackage {
    name = "normalize-range";
    version = "0.1.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/normalize-range/-/normalize-range-0.1.2.tgz";
      sha256 = "0wmc9s221qs4hackn80dmhjm9843651bidxc5bvmbrq0g6b4wy69";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."normalize-url"."^1.4.0" =
    self.by-version."normalize-url"."1.5.3";
  by-version."normalize-url"."1.5.3" = self.buildNodePackage {
    name = "normalize-url";
    version = "1.5.3";
    src = fetchurl {
      url = "https://registry.npmjs.org/normalize-url/-/normalize-url-1.5.3.tgz";
      sha256 = "1ydbw49lmxs952y496nyxxsx70yczyqbkn5r7bly8981s18k5ygk";
    };
    bin = false;
    deps = {
      "object-assign" = self.by-spec."object-assign"."^4.0.1";
      "prepend-http" = self.by-spec."prepend-http"."^1.0.0";
      "query-string" = self.by-spec."query-string"."^4.1.0";
      "sort-keys" = self.by-spec."sort-keys"."^1.0.0";
    };
  };
  by-spec."num2fraction"."^1.2.2" =
    self.by-version."num2fraction"."1.2.2";
  by-version."num2fraction"."1.2.2" = self.buildNodePackage {
    name = "num2fraction";
    version = "1.2.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/num2fraction/-/num2fraction-1.2.2.tgz";
      sha256 = "0cw173lf6yyhb2yjxjfjnsj78kmanx9wk791qqw9byy6srpg8982";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."object-assign"."^4.0.1" =
    self.by-version."object-assign"."4.1.0";
  by-spec."object-assign"."^4.1.0" =
    self.by-version."object-assign"."4.1.0";
  by-version."object-assign"."4.1.0" = self.buildNodePackage {
    name = "object-assign";
    version = "4.1.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/object-assign/-/object-assign-4.1.0.tgz";
      sha256 = "0g393ncx05wwwyjd0nqkgwd6q2wfdx1yb51q5xs6sv9lg5qk8s0n";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."postcss"."^5.0.2" =
    self.by-version."postcss"."5.0.21";
  by-spec."postcss"."^5.0.4" =
    self.by-version."postcss"."5.0.21";
  by-spec."postcss"."^5.0.5" =
    self.by-version."postcss"."5.0.21";
  by-spec."postcss"."^5.0.8" =
    self.by-version."postcss"."5.0.21";
  by-spec."postcss"."^5.0.10" =
    self.by-version."postcss"."5.0.21";
  by-spec."postcss"."^5.0.11" =
    self.by-version."postcss"."5.0.21";
  by-spec."postcss"."^5.0.12" =
    self.by-version."postcss"."5.0.21";
  by-spec."postcss"."^5.0.13" =
    self.by-version."postcss"."5.0.21";
  by-spec."postcss"."^5.0.14" =
    self.by-version."postcss"."5.0.21";
  by-spec."postcss"."^5.0.16" =
    self.by-version."postcss"."5.0.21";
  by-spec."postcss"."^5.0.21" =
    self.by-version."postcss"."5.0.21";
  by-version."postcss"."5.0.21" = self.buildNodePackage {
    name = "postcss";
    version = "5.0.21";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss/-/postcss-5.0.21.tgz";
      sha256 = "0l4kyvmqk3cgc3s91pa4zpisp3ny28pbgxirq42pzs315vbflxly";
    };
    bin = false;
    deps = {
      "js-base64" = self.by-spec."js-base64"."^2.1.9";
      "source-map" = self.by-spec."source-map"."^0.5.5";
      "supports-color" = self.by-spec."supports-color"."^3.1.2";
    };
  };
  by-spec."postcss-calc"."^5.2.0" =
    self.by-version."postcss-calc"."5.2.1";
  by-version."postcss-calc"."5.2.1" = self.buildNodePackage {
    name = "postcss-calc";
    version = "5.2.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-calc/-/postcss-calc-5.2.1.tgz";
      sha256 = "18vqrbqcfk2z357czvgs7adzrhavhxjls75qc9kijxf3a2jy76si";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.2";
      "postcss-message-helpers" = self.by-spec."postcss-message-helpers"."^2.0.0";
      "reduce-css-calc" = self.by-spec."reduce-css-calc"."^1.2.0";
    };
  };
  by-spec."postcss-colormin"."^2.1.8" =
    self.by-version."postcss-colormin"."2.2.0";
  by-version."postcss-colormin"."2.2.0" = self.buildNodePackage {
    name = "postcss-colormin";
    version = "2.2.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-colormin/-/postcss-colormin-2.2.0.tgz";
      sha256 = "1h4c11wqs4jzalyx85la07d8x8kiw08cpblppdg7q57fx0ivg679";
    };
    bin = false;
    deps = {
      "colormin" = self.by-spec."colormin"."^1.0.5";
      "postcss" = self.by-spec."postcss"."^5.0.13";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.2.3";
    };
  };
  by-spec."postcss-convert-values"."^2.3.4" =
    self.by-version."postcss-convert-values"."2.4.0";
  by-version."postcss-convert-values"."2.4.0" = self.buildNodePackage {
    name = "postcss-convert-values";
    version = "2.4.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-convert-values/-/postcss-convert-values-2.4.0.tgz";
      sha256 = "0sdmw6pnwvwrfdv7g339p44l9bxi2mp50mlg8xkprlc0gs3zwqxv";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.11";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.1.2";
    };
  };
  by-spec."postcss-discard-comments"."^2.0.4" =
    self.by-version."postcss-discard-comments"."2.0.4";
  by-version."postcss-discard-comments"."2.0.4" = self.buildNodePackage {
    name = "postcss-discard-comments";
    version = "2.0.4";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-discard-comments/-/postcss-discard-comments-2.0.4.tgz";
      sha256 = "12m2qgkpn7m39flzv47pwvlnfhy16fz6s6x989g06qqqnr445r47";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.14";
    };
  };
  by-spec."postcss-discard-duplicates"."^2.0.1" =
    self.by-version."postcss-discard-duplicates"."2.0.1";
  by-version."postcss-discard-duplicates"."2.0.1" = self.buildNodePackage {
    name = "postcss-discard-duplicates";
    version = "2.0.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-discard-duplicates/-/postcss-discard-duplicates-2.0.1.tgz";
      sha256 = "0d4421cixm9ska3cka8xh0lvq8hm032gjhk13cky88px12fkwp43";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.4";
    };
  };
  by-spec."postcss-discard-empty"."^2.0.1" =
    self.by-version."postcss-discard-empty"."2.1.0";
  by-version."postcss-discard-empty"."2.1.0" = self.buildNodePackage {
    name = "postcss-discard-empty";
    version = "2.1.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-discard-empty/-/postcss-discard-empty-2.1.0.tgz";
      sha256 = "1hh6j2aki1h1kz0bjd6xiv7a0k2khx99g9gn6sd8jyksjma0126a";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.14";
    };
  };
  by-spec."postcss-discard-overridden"."^0.1.1" =
    self.by-version."postcss-discard-overridden"."0.1.1";
  by-version."postcss-discard-overridden"."0.1.1" = self.buildNodePackage {
    name = "postcss-discard-overridden";
    version = "0.1.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-discard-overridden/-/postcss-discard-overridden-0.1.1.tgz";
      sha256 = "16bz6a510p0698b9pnnizfd7kvp3lbpk6k7kpgd1sgxn9jvqlf2q";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.16";
    };
  };
  by-spec."postcss-discard-unused"."^2.2.1" =
    self.by-version."postcss-discard-unused"."2.2.1";
  by-version."postcss-discard-unused"."2.2.1" = self.buildNodePackage {
    name = "postcss-discard-unused";
    version = "2.2.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-discard-unused/-/postcss-discard-unused-2.2.1.tgz";
      sha256 = "1jxx9s8i9b64xjgxy07r3070ysm3hiv1hzvm4jp41fqil6k33y09";
    };
    bin = false;
    deps = {
      "flatten" = self.by-spec."flatten"."1.0.2";
      "postcss" = self.by-spec."postcss"."^5.0.14";
      "uniqs" = self.by-spec."uniqs"."^2.0.0";
    };
  };
  by-spec."postcss-filter-plugins"."^2.0.0" =
    self.by-version."postcss-filter-plugins"."2.0.0";
  by-version."postcss-filter-plugins"."2.0.0" = self.buildNodePackage {
    name = "postcss-filter-plugins";
    version = "2.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-filter-plugins/-/postcss-filter-plugins-2.0.0.tgz";
      sha256 = "08zkhyig9c8nsm1ksdlq2ijnplnfz5zggyhgrd9spjvvwcz8jm2i";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.4";
      "uniqid" = self.by-spec."uniqid"."^1.0.0";
    };
  };
  by-spec."postcss-merge-idents"."^2.1.5" =
    self.by-version."postcss-merge-idents"."2.1.6";
  by-version."postcss-merge-idents"."2.1.6" = self.buildNodePackage {
    name = "postcss-merge-idents";
    version = "2.1.6";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-merge-idents/-/postcss-merge-idents-2.1.6.tgz";
      sha256 = "052bhxahcqkfwy9cw30g17lcj0w5ni840mj0czvrsny632cnlx13";
    };
    bin = false;
    deps = {
      "has-own" = self.by-spec."has-own"."^1.0.0";
      "postcss" = self.by-spec."postcss"."^5.0.10";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.1.1";
    };
  };
  by-spec."postcss-merge-longhand"."^2.0.1" =
    self.by-version."postcss-merge-longhand"."2.0.1";
  by-version."postcss-merge-longhand"."2.0.1" = self.buildNodePackage {
    name = "postcss-merge-longhand";
    version = "2.0.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-merge-longhand/-/postcss-merge-longhand-2.0.1.tgz";
      sha256 = "0s7wfwkq70vz9nxslh1rspx1q10ia767fp9l9zq3lga68s4hrgjn";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.4";
    };
  };
  by-spec."postcss-merge-rules"."^2.0.3" =
    self.by-version."postcss-merge-rules"."2.0.9";
  by-version."postcss-merge-rules"."2.0.9" = self.buildNodePackage {
    name = "postcss-merge-rules";
    version = "2.0.9";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-merge-rules/-/postcss-merge-rules-2.0.9.tgz";
      sha256 = "0hhycqa3hi245q020d1xajm601l5xq2b8zn2p7cw2if0wnqa1r44";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.4";
    };
  };
  by-spec."postcss-message-helpers"."^2.0.0" =
    self.by-version."postcss-message-helpers"."2.0.0";
  by-version."postcss-message-helpers"."2.0.0" = self.buildNodePackage {
    name = "postcss-message-helpers";
    version = "2.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-message-helpers/-/postcss-message-helpers-2.0.0.tgz";
      sha256 = "1qvhzxzam3p3p8g8kb702ggc496vd9fqmfsyh5q4y6d1raaxxaqc";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."postcss-minify-font-values"."^1.0.2" =
    self.by-version."postcss-minify-font-values"."1.0.5";
  by-version."postcss-minify-font-values"."1.0.5" = self.buildNodePackage {
    name = "postcss-minify-font-values";
    version = "1.0.5";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-minify-font-values/-/postcss-minify-font-values-1.0.5.tgz";
      sha256 = "18mwq01zx5c7f5sbjl45lbcsrhxb4zwnn9l8rwfnv1r4m61j8iky";
    };
    bin = false;
    deps = {
      "object-assign" = self.by-spec."object-assign"."^4.0.1";
      "postcss" = self.by-spec."postcss"."^5.0.4";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.0.2";
    };
  };
  by-spec."postcss-minify-gradients"."^1.0.1" =
    self.by-version."postcss-minify-gradients"."1.0.3";
  by-version."postcss-minify-gradients"."1.0.3" = self.buildNodePackage {
    name = "postcss-minify-gradients";
    version = "1.0.3";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-minify-gradients/-/postcss-minify-gradients-1.0.3.tgz";
      sha256 = "0sbr125yh53z9wmf0rcr2mf3lnlm2d4wp7lcqfrnn92fl3k8czwv";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.12";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.1.3";
    };
  };
  by-spec."postcss-minify-params"."^1.0.4" =
    self.by-version."postcss-minify-params"."1.0.4";
  by-version."postcss-minify-params"."1.0.4" = self.buildNodePackage {
    name = "postcss-minify-params";
    version = "1.0.4";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-minify-params/-/postcss-minify-params-1.0.4.tgz";
      sha256 = "1njg0h8s80wr55klzc7dixg66mg6532aqsyvrxx1lcis726pnz2y";
    };
    bin = false;
    deps = {
      "alphanum-sort" = self.by-spec."alphanum-sort"."^1.0.1";
      "postcss" = self.by-spec."postcss"."^5.0.2";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.0.2";
      "uniqs" = self.by-spec."uniqs"."^2.0.0";
    };
  };
  by-spec."postcss-minify-selectors"."^2.0.4" =
    self.by-version."postcss-minify-selectors"."2.0.5";
  by-version."postcss-minify-selectors"."2.0.5" = self.buildNodePackage {
    name = "postcss-minify-selectors";
    version = "2.0.5";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-minify-selectors/-/postcss-minify-selectors-2.0.5.tgz";
      sha256 = "0z2agafg02vymhw6m3z76xjw6mnidgq6kqscg7583ac450bwnllp";
    };
    bin = false;
    deps = {
      "alphanum-sort" = self.by-spec."alphanum-sort"."^1.0.2";
      "postcss" = self.by-spec."postcss"."^5.0.14";
      "postcss-selector-parser" = self.by-spec."postcss-selector-parser"."^2.0.0";
    };
  };
  by-spec."postcss-normalize-charset"."^1.1.0" =
    self.by-version."postcss-normalize-charset"."1.1.0";
  by-version."postcss-normalize-charset"."1.1.0" = self.buildNodePackage {
    name = "postcss-normalize-charset";
    version = "1.1.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-normalize-charset/-/postcss-normalize-charset-1.1.0.tgz";
      sha256 = "1xhn9jhbknijq1nalfl913fza1aynjbp9mvk75ycsalcz0v0yaaw";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.5";
    };
  };
  by-spec."postcss-normalize-url"."^3.0.7" =
    self.by-version."postcss-normalize-url"."3.0.7";
  by-version."postcss-normalize-url"."3.0.7" = self.buildNodePackage {
    name = "postcss-normalize-url";
    version = "3.0.7";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-normalize-url/-/postcss-normalize-url-3.0.7.tgz";
      sha256 = "0vx8yq9kvicbgvnqxw29zskjr9g8j8ij0dxahafm7zynd2ayrwxq";
    };
    bin = false;
    deps = {
      "is-absolute-url" = self.by-spec."is-absolute-url"."^2.0.0";
      "normalize-url" = self.by-spec."normalize-url"."^1.4.0";
      "postcss" = self.by-spec."postcss"."^5.0.14";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.2.3";
    };
  };
  by-spec."postcss-ordered-values"."^2.1.0" =
    self.by-version."postcss-ordered-values"."2.2.1";
  by-version."postcss-ordered-values"."2.2.1" = self.buildNodePackage {
    name = "postcss-ordered-values";
    version = "2.2.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-ordered-values/-/postcss-ordered-values-2.2.1.tgz";
      sha256 = "1ixifilad54d28k029yppf878wmbvpcwip0fqda8h03caxr03fjs";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.4";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.0.1";
    };
  };
  by-spec."postcss-reduce-idents"."^2.2.2" =
    self.by-version."postcss-reduce-idents"."2.3.0";
  by-version."postcss-reduce-idents"."2.3.0" = self.buildNodePackage {
    name = "postcss-reduce-idents";
    version = "2.3.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-reduce-idents/-/postcss-reduce-idents-2.3.0.tgz";
      sha256 = "0csxacl5qg3h3cdjx3zrzypfwdvrcpcdpxgi04kcgz3vfs3i7mga";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.4";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.0.2";
    };
  };
  by-spec."postcss-reduce-initial"."^1.0.0" =
    self.by-version."postcss-reduce-initial"."1.0.0";
  by-version."postcss-reduce-initial"."1.0.0" = self.buildNodePackage {
    name = "postcss-reduce-initial";
    version = "1.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-reduce-initial/-/postcss-reduce-initial-1.0.0.tgz";
      sha256 = "18ls1jpaarpdx1z2vawsxjniasrwm3rrm36nqdzdkqp1m80isw9c";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.4";
    };
  };
  by-spec."postcss-reduce-transforms"."^1.0.3" =
    self.by-version."postcss-reduce-transforms"."1.0.3";
  by-version."postcss-reduce-transforms"."1.0.3" = self.buildNodePackage {
    name = "postcss-reduce-transforms";
    version = "1.0.3";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-reduce-transforms/-/postcss-reduce-transforms-1.0.3.tgz";
      sha256 = "1ds661qi7crayssbm0a45zfq3b2zfsi91n063jmkwh46p1gbk50f";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.8";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.0.1";
    };
  };
  by-spec."postcss-selector-parser"."^2.0.0" =
    self.by-version."postcss-selector-parser"."2.1.0";
  by-version."postcss-selector-parser"."2.1.0" = self.buildNodePackage {
    name = "postcss-selector-parser";
    version = "2.1.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-selector-parser/-/postcss-selector-parser-2.1.0.tgz";
      sha256 = "0palc59d9jzvilbk8pi1bk5748g0jw9f3b0p2jv79fzaf58zacym";
    };
    bin = false;
    deps = {
      "flatten" = self.by-spec."flatten"."^1.0.2";
      "indexes-of" = self.by-spec."indexes-of"."^1.0.1";
      "uniq" = self.by-spec."uniq"."^1.0.1";
    };
  };
  by-spec."postcss-svgo"."^2.1.1" =
    self.by-version."postcss-svgo"."2.1.3";
  by-version."postcss-svgo"."2.1.3" = self.buildNodePackage {
    name = "postcss-svgo";
    version = "2.1.3";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-svgo/-/postcss-svgo-2.1.3.tgz";
      sha256 = "01qn3x110xyigy2g6ihg09aillwpzpi383yxra1nnrfrd80cmgbz";
    };
    bin = false;
    deps = {
      "is-svg" = self.by-spec."is-svg"."^2.0.0";
      "postcss" = self.by-spec."postcss"."^5.0.14";
      "postcss-value-parser" = self.by-spec."postcss-value-parser"."^3.2.3";
      "svgo" = self.by-spec."svgo"."^0.6.1";
    };
  };
  by-spec."postcss-unique-selectors"."^2.0.2" =
    self.by-version."postcss-unique-selectors"."2.0.2";
  by-version."postcss-unique-selectors"."2.0.2" = self.buildNodePackage {
    name = "postcss-unique-selectors";
    version = "2.0.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-unique-selectors/-/postcss-unique-selectors-2.0.2.tgz";
      sha256 = "13rai59bfh1ck4y6xh5p72ccv08qd0r41xpycfhi6h4lvvimpbwm";
    };
    bin = false;
    deps = {
      "alphanum-sort" = self.by-spec."alphanum-sort"."^1.0.1";
      "postcss" = self.by-spec."postcss"."^5.0.4";
      "uniqs" = self.by-spec."uniqs"."^2.0.0";
    };
  };
  by-spec."postcss-value-parser"."^3.0.1" =
    self.by-version."postcss-value-parser"."3.3.0";
  by-spec."postcss-value-parser"."^3.0.2" =
    self.by-version."postcss-value-parser"."3.3.0";
  by-spec."postcss-value-parser"."^3.1.1" =
    self.by-version."postcss-value-parser"."3.3.0";
  by-spec."postcss-value-parser"."^3.1.2" =
    self.by-version."postcss-value-parser"."3.3.0";
  by-spec."postcss-value-parser"."^3.1.3" =
    self.by-version."postcss-value-parser"."3.3.0";
  by-spec."postcss-value-parser"."^3.2.3" =
    self.by-version."postcss-value-parser"."3.3.0";
  by-version."postcss-value-parser"."3.3.0" = self.buildNodePackage {
    name = "postcss-value-parser";
    version = "3.3.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-value-parser/-/postcss-value-parser-3.3.0.tgz";
      sha256 = "05ywinjc506h503mblz19ylc8n5ys8gjcgwj3h7zl7dqf0pdnlcn";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."postcss-zindex"."^2.0.1" =
    self.by-version."postcss-zindex"."2.1.1";
  by-version."postcss-zindex"."2.1.1" = self.buildNodePackage {
    name = "postcss-zindex";
    version = "2.1.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/postcss-zindex/-/postcss-zindex-2.1.1.tgz";
      sha256 = "1q3hjd5f3mjpy9apnqhl9grsbarsfmznishhk7lm1p7gq5r89r8f";
    };
    bin = false;
    deps = {
      "postcss" = self.by-spec."postcss"."^5.0.4";
      "uniqs" = self.by-spec."uniqs"."^2.0.0";
    };
  };
  by-spec."prepend-http"."^1.0.0" =
    self.by-version."prepend-http"."1.0.4";
  by-version."prepend-http"."1.0.4" = self.buildNodePackage {
    name = "prepend-http";
    version = "1.0.4";
    src = fetchurl {
      url = "https://registry.npmjs.org/prepend-http/-/prepend-http-1.0.4.tgz";
      sha256 = "1lx9bq1mi0fn2cqnyqq62yz2sh88fs45h0cssbv9w1mp5kqiizhq";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."q"."^1.1.2" =
    self.by-version."q"."1.4.1";
  by-version."q"."1.4.1" = self.buildNodePackage {
    name = "q";
    version = "1.4.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/q/-/q-1.4.1.tgz";
      sha256 = "05a1x0k3k0f4vpqxfp3qbd4ziwz7nlrw1cv4hla5gd6vns744nsl";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."query-string"."^4.1.0" =
    self.by-version."query-string"."4.2.2";
  by-version."query-string"."4.2.2" = self.buildNodePackage {
    name = "query-string";
    version = "4.2.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/query-string/-/query-string-4.2.2.tgz";
      sha256 = "1r62kyni24b95npha9z0lln34l63z76y3npdcx3wpw7g1sdfr0cz";
    };
    bin = false;
    deps = {
      "object-assign" = self.by-spec."object-assign"."^4.1.0";
      "strict-uri-encode" = self.by-spec."strict-uri-encode"."^1.0.0";
    };
  };
  by-spec."read-file-stdin"."^0.2.0" =
    self.by-version."read-file-stdin"."0.2.1";
  by-version."read-file-stdin"."0.2.1" = self.buildNodePackage {
    name = "read-file-stdin";
    version = "0.2.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/read-file-stdin/-/read-file-stdin-0.2.1.tgz";
      sha256 = "0qpx8qs225lndx80hlvq1wzxj1fkl99vxn9irq2wfj1knlasnpw2";
    };
    bin = false;
    deps = {
      "gather-stream" = self.by-spec."gather-stream"."^1.0.0";
    };
  };
  by-spec."reduce-css-calc"."^1.2.0" =
    self.by-version."reduce-css-calc"."1.2.4";
  by-version."reduce-css-calc"."1.2.4" = self.buildNodePackage {
    name = "reduce-css-calc";
    version = "1.2.4";
    src = fetchurl {
      url = "https://registry.npmjs.org/reduce-css-calc/-/reduce-css-calc-1.2.4.tgz";
      sha256 = "13fy8qnva6lybr8dfia5fpqmag2wzs73i9f7v1wvkljkb19ha9ym";
    };
    bin = false;
    deps = {
      "balanced-match" = self.by-spec."balanced-match"."^0.1.0";
      "reduce-function-call" = self.by-spec."reduce-function-call"."^1.0.1";
    };
  };
  by-spec."reduce-function-call"."^1.0.1" =
    self.by-version."reduce-function-call"."1.0.1";
  by-version."reduce-function-call"."1.0.1" = self.buildNodePackage {
    name = "reduce-function-call";
    version = "1.0.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/reduce-function-call/-/reduce-function-call-1.0.1.tgz";
      sha256 = "1blbg032hxdy61q3n0p2bdniyjgk8cwkxnmabx3a2rj931iv36gi";
    };
    bin = false;
    deps = {
      "balanced-match" = self.by-spec."balanced-match"."~0.1.0";
    };
  };
  by-spec."sax"."~1.2.1" =
    self.by-version."sax"."1.2.1";
  by-version."sax"."1.2.1" = self.buildNodePackage {
    name = "sax";
    version = "1.2.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/sax/-/sax-1.2.1.tgz";
      sha256 = "0dm2280fpinj0xn65ibwf5kaz1lsg50yyfg907ydcny22f5wizjz";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."sort-keys"."^1.0.0" =
    self.by-version."sort-keys"."1.1.2";
  by-version."sort-keys"."1.1.2" = self.buildNodePackage {
    name = "sort-keys";
    version = "1.1.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/sort-keys/-/sort-keys-1.1.2.tgz";
      sha256 = "13jp2vbbxij83kqqs2flv7dj80kj3r8h4p6p5lg4j9gidvn2szbs";
    };
    bin = false;
    deps = {
      "is-plain-obj" = self.by-spec."is-plain-obj"."^1.0.0";
    };
  };
  by-spec."source-map"."^0.5.3" =
    self.by-version."source-map"."0.5.6";
  by-spec."source-map"."^0.5.5" =
    self.by-version."source-map"."0.5.6";
  by-version."source-map"."0.5.6" = self.buildNodePackage {
    name = "source-map";
    version = "0.5.6";
    src = fetchurl {
      url = "https://registry.npmjs.org/source-map/-/source-map-0.5.6.tgz";
      sha256 = "0wg945jzmg2mgf9vb3wq9xw7m0v7jnrm1anf4g4papr58xx44vav";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."sprintf-js"."~1.0.2" =
    self.by-version."sprintf-js"."1.0.3";
  by-version."sprintf-js"."1.0.3" = self.buildNodePackage {
    name = "sprintf-js";
    version = "1.0.3";
    src = fetchurl {
      url = "https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz";
      sha256 = "10qsmbfw9hv4hahsvq79py6v0dddhckwynji2vsr1p18qfy2dyrs";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."strict-uri-encode"."^1.0.0" =
    self.by-version."strict-uri-encode"."1.1.0";
  by-version."strict-uri-encode"."1.1.0" = self.buildNodePackage {
    name = "strict-uri-encode";
    version = "1.1.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/strict-uri-encode/-/strict-uri-encode-1.1.0.tgz";
      sha256 = "0l1h4cl8cqgwvrq85sn1akbg0xiryb2j9rbxxhp703m9599n9al9";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."strip-ansi"."^3.0.0" =
    self.by-version."strip-ansi"."3.0.1";
  by-version."strip-ansi"."3.0.1" = self.buildNodePackage {
    name = "strip-ansi";
    version = "3.0.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/strip-ansi/-/strip-ansi-3.0.1.tgz";
      sha256 = "0fkrbfwig3d1i8s01pbj08pq1z6sn9xqvkjdz0a9b58q85d3i78w";
    };
    bin = false;
    deps = {
      "ansi-regex" = self.by-spec."ansi-regex"."^2.0.0";
    };
  };
  by-spec."supports-color"."^2.0.0" =
    self.by-version."supports-color"."2.0.0";
  by-version."supports-color"."2.0.0" = self.buildNodePackage {
    name = "supports-color";
    version = "2.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/supports-color/-/supports-color-2.0.0.tgz";
      sha256 = "1lwscnhhmxpi3fbclkva5zg411cw9p0mgabbk3mic3sfshjlnpbj";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."supports-color"."^3.1.2" =
    self.by-version."supports-color"."3.1.2";
  by-version."supports-color"."3.1.2" = self.buildNodePackage {
    name = "supports-color";
    version = "3.1.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/supports-color/-/supports-color-3.1.2.tgz";
      sha256 = "0rcnkhz61bz7dv1zqy70m47d2vxhkg2cvby50biaripggzrf1lrq";
    };
    bin = false;
    deps = {
      "has-flag" = self.by-spec."has-flag"."^1.0.0";
    };
  };
  by-spec."svgo"."^0.6.1" =
    self.by-version."svgo"."0.6.6";
  by-version."svgo"."0.6.6" = self.buildNodePackage {
    name = "svgo";
    version = "0.6.6";
    src = fetchurl {
      url = "https://registry.npmjs.org/svgo/-/svgo-0.6.6.tgz";
      sha256 = "11k78nlz694smwjkp64plzmm6bab2p5865jrpb64f1gsg19ndd3w";
    };
    bin = false;
    deps = {
      "coa" = self.by-spec."coa"."~1.0.1";
      "colors" = self.by-spec."colors"."~1.1.2";
      "csso" = self.by-spec."csso"."~2.0.0";
      "js-yaml" = self.by-spec."js-yaml"."~3.6.0";
      "mkdirp" = self.by-spec."mkdirp"."~0.5.1";
      "sax" = self.by-spec."sax"."~1.2.1";
      "whet.extend" = self.by-spec."whet.extend"."~0.9.9";
    };
  };
  by-spec."uniq"."^1.0.1" =
    self.by-version."uniq"."1.0.1";
  by-version."uniq"."1.0.1" = self.buildNodePackage {
    name = "uniq";
    version = "1.0.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/uniq/-/uniq-1.0.1.tgz";
      sha256 = "1z59sibwr7kf5pb63n0i8f22xq25jlkg4h6ijs8alb42a255jw9f";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."uniqid"."^1.0.0" =
    self.by-version."uniqid"."1.0.0";
  by-version."uniqid"."1.0.0" = self.buildNodePackage {
    name = "uniqid";
    version = "1.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/uniqid/-/uniqid-1.0.0.tgz";
      sha256 = "16d98qsh6gnzvgk7kh8x20ar612gihd87d8vjj32fdablq5majsc";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."uniqs"."^2.0.0" =
    self.by-version."uniqs"."2.0.0";
  by-version."uniqs"."2.0.0" = self.buildNodePackage {
    name = "uniqs";
    version = "2.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/uniqs/-/uniqs-2.0.0.tgz";
      sha256 = "1xvm9nk15a1w66ip6yqpzwc66qlz6gc279046kah5ynybl4bq7hs";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."whet.extend"."~0.9.9" =
    self.by-version."whet.extend"."0.9.9";
  by-version."whet.extend"."0.9.9" = self.buildNodePackage {
    name = "whet.extend";
    version = "0.9.9";
    src = fetchurl {
      url = "https://registry.npmjs.org/whet.extend/-/whet.extend-0.9.9.tgz";
      sha256 = "0bgm8impvrfy3x45ji6vbkwxwka9x2xxih6z23qp6dxwmmbpykvy";
    };
    bin = false;
    deps = {
    };
  };
  by-spec."write-file-stdout"."0.0.2" =
    self.by-version."write-file-stdout"."0.0.2";
  by-version."write-file-stdout"."0.0.2" = self.buildNodePackage {
    name = "write-file-stdout";
    version = "0.0.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/write-file-stdout/-/write-file-stdout-0.0.2.tgz";
      sha256 = "1ngsa5dd89spzzb86f33dcyk8z6s0b2n9x7i2rqd844rxizxqik7";
    };
    bin = false;
    deps = {
    };
  };
}
