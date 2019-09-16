# This file has been generated by node2nix 1.7.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "abab-2.0.1" = {
      name = "abab";
      packageName = "abab";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/abab/-/abab-2.0.1.tgz";
        sha512 = "1zSbbCuoIjafKZ3mblY5ikvAb0ODUbqBnFuUb7f6uLeQhhGJ0vEV4ntmtxKLT2WgXCO94E07BjunsIw1jOMPZw==";
      };
    };
    "acorn-6.3.0" = {
      name = "acorn";
      packageName = "acorn";
      version = "6.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/acorn/-/acorn-6.3.0.tgz";
        sha512 = "/czfa8BwS88b9gWQVhc8eknunSA2DoJpJyTQkhheIf5E48u1N0R4q/YxxsAeqRrmK9TQ/uYfgLDfZo91UlANIA==";
      };
    };
    "acorn-globals-4.3.4" = {
      name = "acorn-globals";
      packageName = "acorn-globals";
      version = "4.3.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/acorn-globals/-/acorn-globals-4.3.4.tgz";
        sha512 = "clfQEh21R+D0leSbUdWf3OcfqyaCSAQ8Ryq00bofSekfr9W8u1jyYZo6ir0xu9Gtcf7BjcHJpnbZH7JOCpP60A==";
      };
    };
    "acorn-walk-6.2.0" = {
      name = "acorn-walk";
      packageName = "acorn-walk";
      version = "6.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/acorn-walk/-/acorn-walk-6.2.0.tgz";
        sha512 = "7evsyfH1cLOCdAzZAd43Cic04yKydNx0cF+7tiA19p1XnLLPU4dpCQOqpjqwokFe//vS0QqfqqjCS2JkiIs0cA==";
      };
    };
    "ajv-6.10.2" = {
      name = "ajv";
      packageName = "ajv";
      version = "6.10.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ajv/-/ajv-6.10.2.tgz";
        sha512 = "TXtUUEYHuaTEbLZWIKUr5pmBuhDLy+8KYtPYdcV8qC+pOZL+NKqYwvWSRrVXHn+ZmRRAu8vJTAznH7Oag6RVRw==";
      };
    };
    "array-equal-1.0.0" = {
      name = "array-equal";
      packageName = "array-equal";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/array-equal/-/array-equal-1.0.0.tgz";
        sha1 = "8c2a5ef2472fd9ea742b04c77a75093ba2757c93";
      };
    };
    "asn1-0.2.4" = {
      name = "asn1";
      packageName = "asn1";
      version = "0.2.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/asn1/-/asn1-0.2.4.tgz";
        sha512 = "jxwzQpLQjSmWXgwaCZE9Nz+glAG01yF1QnWgbhGwHI5A6FRIEY6IVqtHhIepHqI7/kyEyQEagBC5mBEFlIYvdg==";
      };
    };
    "assert-plus-1.0.0" = {
      name = "assert-plus";
      packageName = "assert-plus";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/assert-plus/-/assert-plus-1.0.0.tgz";
        sha1 = "f12e0f3c5d77b0b1cdd9146942e4e96c1e4dd525";
      };
    };
    "async-limiter-1.0.1" = {
      name = "async-limiter";
      packageName = "async-limiter";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/async-limiter/-/async-limiter-1.0.1.tgz";
        sha512 = "csOlWGAcRFJaI6m+F2WKdnMKr4HhdhFVBk0H/QbJFMCr+uO2kwohwXQPxw/9OCxp05r5ghVBFSyioixx3gfkNQ==";
      };
    };
    "asynckit-0.4.0" = {
      name = "asynckit";
      packageName = "asynckit";
      version = "0.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz";
        sha1 = "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79";
      };
    };
    "aws-sign2-0.7.0" = {
      name = "aws-sign2";
      packageName = "aws-sign2";
      version = "0.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/aws-sign2/-/aws-sign2-0.7.0.tgz";
        sha1 = "b46e890934a9591f2d2f6f86d7e6a9f1b3fe76a8";
      };
    };
    "aws4-1.8.0" = {
      name = "aws4";
      packageName = "aws4";
      version = "1.8.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/aws4/-/aws4-1.8.0.tgz";
        sha512 = "ReZxvNHIOv88FlT7rxcXIIC0fPt4KZqZbOlivyWtXLt8ESx84zd3kMC6iK5jVeS2qt+g7ftS7ye4fi06X5rtRQ==";
      };
    };
    "bcrypt-pbkdf-1.0.2" = {
      name = "bcrypt-pbkdf";
      packageName = "bcrypt-pbkdf";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.2.tgz";
        sha1 = "a4301d389b6a43f9b67ff3ca11a3f6637e360e9e";
      };
    };
    "browser-process-hrtime-0.1.3" = {
      name = "browser-process-hrtime";
      packageName = "browser-process-hrtime";
      version = "0.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/browser-process-hrtime/-/browser-process-hrtime-0.1.3.tgz";
        sha512 = "bRFnI4NnjO6cnyLmOV/7PVoDEMJChlcfN0z4s1YMBY989/SvlfMI1lgCnkFUs53e9gQF+w7qu7XdllSTiSl8Aw==";
      };
    };
    "caseless-0.12.0" = {
      name = "caseless";
      packageName = "caseless";
      version = "0.12.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/caseless/-/caseless-0.12.0.tgz";
        sha1 = "1b681c21ff84033c826543090689420d187151dc";
      };
    };
    "combined-stream-1.0.8" = {
      name = "combined-stream";
      packageName = "combined-stream";
      version = "1.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz";
        sha512 = "FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==";
      };
    };
    "core-util-is-1.0.2" = {
      name = "core-util-is";
      packageName = "core-util-is";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.2.tgz";
        sha1 = "b5fd54220aa2bc5ab57aab7140c940754503c1a7";
      };
    };
    "cssom-0.3.8" = {
      name = "cssom";
      packageName = "cssom";
      version = "0.3.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/cssom/-/cssom-0.3.8.tgz";
        sha512 = "b0tGHbfegbhPJpxpiBPU2sCkigAqtM9O121le6bbOlgyV+NyGyCmVfJ6QW9eRjz8CpNfWEOYBIMIGRYkLwsIYg==";
      };
    };
    "cssstyle-1.4.0" = {
      name = "cssstyle";
      packageName = "cssstyle";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/cssstyle/-/cssstyle-1.4.0.tgz";
        sha512 = "GBrLZYZ4X4x6/QEoBnIrqb8B/f5l4+8me2dkom/j1Gtbxy0kBv6OGzKuAsGM75bkGwGAFkt56Iwg28S3XTZgSA==";
      };
    };
    "dashdash-1.14.1" = {
      name = "dashdash";
      packageName = "dashdash";
      version = "1.14.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/dashdash/-/dashdash-1.14.1.tgz";
        sha1 = "853cfa0f7cbe2fed5de20326b8dd581035f6e2f0";
      };
    };
    "data-urls-1.1.0" = {
      name = "data-urls";
      packageName = "data-urls";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/data-urls/-/data-urls-1.1.0.tgz";
        sha512 = "YTWYI9se1P55u58gL5GkQHW4P6VJBJ5iBT+B5a7i2Tjadhv52paJG0qHX4A0OR6/t52odI64KP2YvFpkDOi3eQ==";
      };
    };
    "deep-is-0.1.3" = {
      name = "deep-is";
      packageName = "deep-is";
      version = "0.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/deep-is/-/deep-is-0.1.3.tgz";
        sha1 = "b369d6fb5dbc13eecf524f91b070feedc357cf34";
      };
    };
    "delayed-stream-1.0.0" = {
      name = "delayed-stream";
      packageName = "delayed-stream";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz";
        sha1 = "df3ae199acadfb7d440aaae0b29e2272b24ec619";
      };
    };
    "domexception-1.0.1" = {
      name = "domexception";
      packageName = "domexception";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/domexception/-/domexception-1.0.1.tgz";
        sha512 = "raigMkn7CJNNo6Ihro1fzG7wr3fHuYVytzquZKX5n0yizGsTcYgzdIUwj1X9pK0VvjeihV+XiclP+DjwbsSKug==";
      };
    };
    "ecc-jsbn-0.1.2" = {
      name = "ecc-jsbn";
      packageName = "ecc-jsbn";
      version = "0.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ecc-jsbn/-/ecc-jsbn-0.1.2.tgz";
        sha1 = "3a83a904e54353287874c564b7549386849a98c9";
      };
    };
    "escodegen-1.12.0" = {
      name = "escodegen";
      packageName = "escodegen";
      version = "1.12.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/escodegen/-/escodegen-1.12.0.tgz";
        sha512 = "TuA+EhsanGcme5T3R0L80u4t8CpbXQjegRmf7+FPTJrtCTErXFeelblRgHQa1FofEzqYYJmJ/OqjTwREp9qgmg==";
      };
    };
    "esprima-3.1.3" = {
      name = "esprima";
      packageName = "esprima";
      version = "3.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/esprima/-/esprima-3.1.3.tgz";
        sha1 = "fdca51cee6133895e3c88d535ce49dbff62a4633";
      };
    };
    "estraverse-4.3.0" = {
      name = "estraverse";
      packageName = "estraverse";
      version = "4.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/estraverse/-/estraverse-4.3.0.tgz";
        sha512 = "39nnKffWz8xN1BU/2c79n9nB9HDzo0niYUqx6xyqUnyoAnQyyWpOTdZEeiCch8BBu515t4wp9ZmgVfVhn9EBpw==";
      };
    };
    "esutils-2.0.3" = {
      name = "esutils";
      packageName = "esutils";
      version = "2.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/esutils/-/esutils-2.0.3.tgz";
        sha512 = "kVscqXk4OCp68SZ0dkgEKVi6/8ij300KBWTJq32P/dYeWTSwK41WyTxalN1eRmA5Z9UU/LX9D7FWSmV9SAYx6g==";
      };
    };
    "extend-3.0.2" = {
      name = "extend";
      packageName = "extend";
      version = "3.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/extend/-/extend-3.0.2.tgz";
        sha512 = "fjquC59cD7CyW6urNXK0FBufkZcoiGG80wTuPujX590cB5Ttln20E2UB4S/WARVqhXffZl2LNgS+gQdPIIim/g==";
      };
    };
    "extsprintf-1.3.0" = {
      name = "extsprintf";
      packageName = "extsprintf";
      version = "1.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/extsprintf/-/extsprintf-1.3.0.tgz";
        sha1 = "96918440e3041a7a414f8c52e3c574eb3c3e1e05";
      };
    };
    "fast-deep-equal-2.0.1" = {
      name = "fast-deep-equal";
      packageName = "fast-deep-equal";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-2.0.1.tgz";
        sha1 = "7b05218ddf9667bf7f370bf7fdb2cb15fdd0aa49";
      };
    };
    "fast-json-stable-stringify-2.0.0" = {
      name = "fast-json-stable-stringify";
      packageName = "fast-json-stable-stringify";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.0.0.tgz";
        sha1 = "d5142c0caee6b1189f87d3a76111064f86c8bbf2";
      };
    };
    "fast-levenshtein-2.0.6" = {
      name = "fast-levenshtein";
      packageName = "fast-levenshtein";
      version = "2.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz";
        sha1 = "3d8a5c66883a16a30ca8643e851f19baa7797917";
      };
    };
    "forever-agent-0.6.1" = {
      name = "forever-agent";
      packageName = "forever-agent";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/forever-agent/-/forever-agent-0.6.1.tgz";
        sha1 = "fbc71f0c41adeb37f96c577ad1ed42d8fdacca91";
      };
    };
    "form-data-2.3.3" = {
      name = "form-data";
      packageName = "form-data";
      version = "2.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/form-data/-/form-data-2.3.3.tgz";
        sha512 = "1lLKB2Mu3aGP1Q/2eCOx0fNbRMe7XdwktwOruhfqqd0rIJWwN4Dh+E3hrPSlDCXnSR7UtZ1N38rVXm+6+MEhJQ==";
      };
    };
    "getpass-0.1.7" = {
      name = "getpass";
      packageName = "getpass";
      version = "0.1.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/getpass/-/getpass-0.1.7.tgz";
        sha1 = "5eff8e3e684d569ae4cb2b1282604e8ba62149fa";
      };
    };
    "har-schema-2.0.0" = {
      name = "har-schema";
      packageName = "har-schema";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/har-schema/-/har-schema-2.0.0.tgz";
        sha1 = "a94c2224ebcac04782a0d9035521f24735b7ec92";
      };
    };
    "har-validator-5.1.3" = {
      name = "har-validator";
      packageName = "har-validator";
      version = "5.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/har-validator/-/har-validator-5.1.3.tgz";
        sha512 = "sNvOCzEQNr/qrvJgc3UG/kD4QtlHycrzwS+6mfTrrSq97BvaYcPZZI1ZSqGSPR73Cxn4LKTD4PttRwfU7jWq5g==";
      };
    };
    "html-encoding-sniffer-1.0.2" = {
      name = "html-encoding-sniffer";
      packageName = "html-encoding-sniffer";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/html-encoding-sniffer/-/html-encoding-sniffer-1.0.2.tgz";
        sha512 = "71lZziiDnsuabfdYiUeWdCVyKuqwWi23L8YeIgV9jSSZHCtb6wB1BKWooH7L3tn4/FuZJMVWyNaIDr4RGmaSYw==";
      };
    };
    "http-signature-1.2.0" = {
      name = "http-signature";
      packageName = "http-signature";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/http-signature/-/http-signature-1.2.0.tgz";
        sha1 = "9aecd925114772f3d95b65a60abb8f7c18fbace1";
      };
    };
    "iconv-lite-0.4.24" = {
      name = "iconv-lite";
      packageName = "iconv-lite";
      version = "0.4.24";
      src = fetchurl {
        url = "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz";
        sha512 = "v3MXnZAcvnywkTUEZomIActle7RXXeedOR31wwl7VlyoXO4Qi9arvSenNQWne1TcRwhCL1HwLI21bEqdpj8/rA==";
      };
    };
    "ip-regex-2.1.0" = {
      name = "ip-regex";
      packageName = "ip-regex";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ip-regex/-/ip-regex-2.1.0.tgz";
        sha1 = "fa78bf5d2e6913c911ce9f819ee5146bb6d844e9";
      };
    };
    "is-typedarray-1.0.0" = {
      name = "is-typedarray";
      packageName = "is-typedarray";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-typedarray/-/is-typedarray-1.0.0.tgz";
        sha1 = "e479c80858df0c1b11ddda6940f96011fcda4a9a";
      };
    };
    "isstream-0.1.2" = {
      name = "isstream";
      packageName = "isstream";
      version = "0.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/isstream/-/isstream-0.1.2.tgz";
        sha1 = "47e63f7af55afa6f92e1500e690eb8b8529c099a";
      };
    };
    "jsbn-0.1.1" = {
      name = "jsbn";
      packageName = "jsbn";
      version = "0.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsbn/-/jsbn-0.1.1.tgz";
        sha1 = "a5e654c2e5a2deb5f201d96cefbca80c0ef2f513";
      };
    };
    "json-schema-0.2.3" = {
      name = "json-schema";
      packageName = "json-schema";
      version = "0.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-schema/-/json-schema-0.2.3.tgz";
        sha1 = "b480c892e59a2f05954ce727bd3f2a4e882f9e13";
      };
    };
    "json-schema-traverse-0.4.1" = {
      name = "json-schema-traverse";
      packageName = "json-schema-traverse";
      version = "0.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz";
        sha512 = "xbbCH5dCYU5T8LcEhhuh7HJ88HXuW3qsI3Y0zOZFKfZEHcpWiHU/Jxzk629Brsab/mMiHQti9wMP+845RPe3Vg==";
      };
    };
    "json-stringify-safe-5.0.1" = {
      name = "json-stringify-safe";
      packageName = "json-stringify-safe";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz";
        sha1 = "1296a2d58fd45f19a0f6ce01d65701e2c735b6eb";
      };
    };
    "jsprim-1.4.1" = {
      name = "jsprim";
      packageName = "jsprim";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsprim/-/jsprim-1.4.1.tgz";
        sha1 = "313e66bc1e5cc06e438bc1b7499c2e5c56acb6a2";
      };
    };
    "levn-0.3.0" = {
      name = "levn";
      packageName = "levn";
      version = "0.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/levn/-/levn-0.3.0.tgz";
        sha1 = "3b09924edf9f083c0490fdd4c0bc4421e04764ee";
      };
    };
    "lodash-4.17.15" = {
      name = "lodash";
      packageName = "lodash";
      version = "4.17.15";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash/-/lodash-4.17.15.tgz";
        sha512 = "8xOcRHvCjnocdS5cpwXQXVzmmh5e5+saE2QGoeQmbKmRS6J3VQppPOIt0MnmE+4xlZoumy0GPG0D0MVIQbNA1A==";
      };
    };
    "lodash.sortby-4.7.0" = {
      name = "lodash.sortby";
      packageName = "lodash.sortby";
      version = "4.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash.sortby/-/lodash.sortby-4.7.0.tgz";
        sha1 = "edd14c824e2cc9c1e0b0a1b42bb5210516a42438";
      };
    };
    "mime-db-1.40.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.40.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.40.0.tgz";
        sha512 = "jYdeOMPy9vnxEqFRRo6ZvTZ8d9oPb+k18PKoYNYUe2stVEBPPwsln/qWzdbmaIvnhZ9v2P+CuecK+fpUfsV2mA==";
      };
    };
    "mime-types-2.1.24" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.24";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.24.tgz";
        sha512 = "WaFHS3MCl5fapm3oLxU4eYDw77IQM2ACcxQ9RIxfaC3ooc6PFuBMGZZsYpvoXS5D5QTWPieo1jjLdAm3TBP3cQ==";
      };
    };
    "nwsapi-2.1.4" = {
      name = "nwsapi";
      packageName = "nwsapi";
      version = "2.1.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/nwsapi/-/nwsapi-2.1.4.tgz";
        sha512 = "iGfd9Y6SFdTNldEy2L0GUhcarIutFmk+MPWIn9dmj8NMIup03G08uUF2KGbbmv/Ux4RT0VZJoP/sVbWA6d/VIw==";
      };
    };
    "oauth-sign-0.9.0" = {
      name = "oauth-sign";
      packageName = "oauth-sign";
      version = "0.9.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/oauth-sign/-/oauth-sign-0.9.0.tgz";
        sha512 = "fexhUFFPTGV8ybAtSIGbV6gOkSv8UtRbDBnAyLQw4QPKkgNlsH2ByPGtMUqdWkos6YCRmAqViwgZrJc/mRDzZQ==";
      };
    };
    "optionator-0.8.2" = {
      name = "optionator";
      packageName = "optionator";
      version = "0.8.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/optionator/-/optionator-0.8.2.tgz";
        sha1 = "364c5e409d3f4d6301d6c0b4c05bba50180aeb64";
      };
    };
    "parse5-5.1.0" = {
      name = "parse5";
      packageName = "parse5";
      version = "5.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/parse5/-/parse5-5.1.0.tgz";
        sha512 = "fxNG2sQjHvlVAYmzBZS9YlDp6PTSSDwa98vkD4QgVDDCAo84z5X1t5XyJQ62ImdLXx5NdIIfihey6xpum9/gRQ==";
      };
    };
    "performance-now-2.1.0" = {
      name = "performance-now";
      packageName = "performance-now";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/performance-now/-/performance-now-2.1.0.tgz";
        sha1 = "6309f4e0e5fa913ec1c69307ae364b4b377c9e7b";
      };
    };
    "pn-1.1.0" = {
      name = "pn";
      packageName = "pn";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/pn/-/pn-1.1.0.tgz";
        sha512 = "2qHaIQr2VLRFoxe2nASzsV6ef4yOOH+Fi9FBOVH6cqeSgUnoyySPZkxzLuzd+RYOQTRpROA0ztTMqxROKSb/nA==";
      };
    };
    "prelude-ls-1.1.2" = {
      name = "prelude-ls";
      packageName = "prelude-ls";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/prelude-ls/-/prelude-ls-1.1.2.tgz";
        sha1 = "21932a549f5e52ffd9a827f570e04be62a97da54";
      };
    };
    "psl-1.4.0" = {
      name = "psl";
      packageName = "psl";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/psl/-/psl-1.4.0.tgz";
        sha512 = "HZzqCGPecFLyoRj5HLfuDSKYTJkAfB5thKBIkRHtGjWwY7p1dAyveIbXIq4tO0KYfDF2tHqPUgY9SDnGm00uFw==";
      };
    };
    "punycode-1.4.1" = {
      name = "punycode";
      packageName = "punycode";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/punycode/-/punycode-1.4.1.tgz";
        sha1 = "c0d5a63b2718800ad8e1eb0fa5269c84dd41845e";
      };
    };
    "punycode-2.1.1" = {
      name = "punycode";
      packageName = "punycode";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz";
        sha512 = "XRsRjdf+j5ml+y/6GKHPZbrF/8p2Yga0JPtdqTIY2Xe5ohJPD9saDJJLPvp9+NSBprVvevdXZybnj2cv8OEd0A==";
      };
    };
    "qs-6.5.2" = {
      name = "qs";
      packageName = "qs";
      version = "6.5.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/qs/-/qs-6.5.2.tgz";
        sha512 = "N5ZAX4/LxJmF+7wN74pUD6qAh9/wnvdQcjq9TZjevvXzSUo7bfmw91saqMjzGS2xq91/odN2dW/WOl7qQHNDGA==";
      };
    };
    "request-2.88.0" = {
      name = "request";
      packageName = "request";
      version = "2.88.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/request/-/request-2.88.0.tgz";
        sha512 = "NAqBSrijGLZdM0WZNsInLJpkJokL72XYjUpnB0iwsRgxh7dB6COrHnTBNwN0E+lHDAJzu7kLAkDeY08z2/A0hg==";
      };
    };
    "request-promise-core-1.1.2" = {
      name = "request-promise-core";
      packageName = "request-promise-core";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/request-promise-core/-/request-promise-core-1.1.2.tgz";
        sha512 = "UHYyq1MO8GsefGEt7EprS8UrXsm1TxEvFUX1IMTuSLU2Rh7fTIdFtl8xD7JiEYiWU2dl+NYAjCTksTehQUxPag==";
      };
    };
    "request-promise-native-1.0.7" = {
      name = "request-promise-native";
      packageName = "request-promise-native";
      version = "1.0.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/request-promise-native/-/request-promise-native-1.0.7.tgz";
        sha512 = "rIMnbBdgNViL37nZ1b3L/VfPOpSi0TqVDQPAvO6U14lMzOLrt5nilxCQqtDKhZeDiW0/hkCXGoQjhgJd/tCh6w==";
      };
    };
    "safe-buffer-5.2.0" = {
      name = "safe-buffer";
      packageName = "safe-buffer";
      version = "5.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.0.tgz";
        sha512 = "fZEwUGbVl7kouZs1jCdMLdt95hdIv0ZeHg6L7qPeciMZhZ+/gdesW4wgTARkrFWEpspjEATAzUGPG8N2jJiwbg==";
      };
    };
    "safer-buffer-2.1.2" = {
      name = "safer-buffer";
      packageName = "safer-buffer";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz";
        sha512 = "YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg==";
      };
    };
    "saxes-3.1.11" = {
      name = "saxes";
      packageName = "saxes";
      version = "3.1.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/saxes/-/saxes-3.1.11.tgz";
        sha512 = "Ydydq3zC+WYDJK1+gRxRapLIED9PWeSuuS41wqyoRmzvhhh9nc+QQrVMKJYzJFULazeGhzSV0QleN2wD3boh2g==";
      };
    };
    "source-map-0.6.1" = {
      name = "source-map";
      packageName = "source-map";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz";
        sha512 = "UjgapumWlbMhkBgzT7Ykc5YXUT46F0iKu8SGXq0bcwP5dz/h0Plj6enJqjz1Zbq2l5WaqYnrVbwWOWMyF3F47g==";
      };
    };
    "sshpk-1.16.1" = {
      name = "sshpk";
      packageName = "sshpk";
      version = "1.16.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/sshpk/-/sshpk-1.16.1.tgz";
        sha512 = "HXXqVUq7+pcKeLqqZj6mHFUMvXtOJt1uoUx09pFW6011inTMxqI8BA8PM95myrIyyKwdnzjdFjLiE6KBPVtJIg==";
      };
    };
    "stealthy-require-1.1.1" = {
      name = "stealthy-require";
      packageName = "stealthy-require";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/stealthy-require/-/stealthy-require-1.1.1.tgz";
        sha1 = "35b09875b4ff49f26a777e509b3090a3226bf24b";
      };
    };
    "symbol-tree-3.2.4" = {
      name = "symbol-tree";
      packageName = "symbol-tree";
      version = "3.2.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/symbol-tree/-/symbol-tree-3.2.4.tgz";
        sha512 = "9QNk5KwDF+Bvz+PyObkmSYjI5ksVUYtjW7AU22r2NKcfLJcXp96hkDWU3+XndOsUb+AQ9QhfzfCT2O+CNWT5Tw==";
      };
    };
    "tough-cookie-2.4.3" = {
      name = "tough-cookie";
      packageName = "tough-cookie";
      version = "2.4.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/tough-cookie/-/tough-cookie-2.4.3.tgz";
        sha512 = "Q5srk/4vDM54WJsJio3XNn6K2sCG+CQ8G5Wz6bZhRZoAe/+TxjWB/GlFAnYEbkYVlON9FMk/fE3h2RLpPXo4lQ==";
      };
    };
    "tough-cookie-2.5.0" = {
      name = "tough-cookie";
      packageName = "tough-cookie";
      version = "2.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tough-cookie/-/tough-cookie-2.5.0.tgz";
        sha512 = "nlLsUzgm1kfLXSXfRZMc1KLAugd4hqJHDTvc2hDIwS3mZAfMEuMbc03SujMF+GEcpaX/qboeycw6iO8JwVv2+g==";
      };
    };
    "tough-cookie-3.0.1" = {
      name = "tough-cookie";
      packageName = "tough-cookie";
      version = "3.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/tough-cookie/-/tough-cookie-3.0.1.tgz";
        sha512 = "yQyJ0u4pZsv9D4clxO69OEjLWYw+jbgspjTue4lTQZLfV0c5l1VmK2y1JK8E9ahdpltPOaAThPcp5nKPUgSnsg==";
      };
    };
    "tr46-1.0.1" = {
      name = "tr46";
      packageName = "tr46";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/tr46/-/tr46-1.0.1.tgz";
        sha1 = "a8b13fd6bfd2489519674ccde55ba3693b706d09";
      };
    };
    "tunnel-agent-0.6.0" = {
      name = "tunnel-agent";
      packageName = "tunnel-agent";
      version = "0.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.6.0.tgz";
        sha1 = "27a5dea06b36b04a0a9966774b290868f0fc40fd";
      };
    };
    "tweetnacl-0.14.5" = {
      name = "tweetnacl";
      packageName = "tweetnacl";
      version = "0.14.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/tweetnacl/-/tweetnacl-0.14.5.tgz";
        sha1 = "5ae68177f192d4456269d108afa93ff8743f4f64";
      };
    };
    "type-check-0.3.2" = {
      name = "type-check";
      packageName = "type-check";
      version = "0.3.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/type-check/-/type-check-0.3.2.tgz";
        sha1 = "5884cab512cf1d355e3fb784f30804b2b520db72";
      };
    };
    "uri-js-4.2.2" = {
      name = "uri-js";
      packageName = "uri-js";
      version = "4.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/uri-js/-/uri-js-4.2.2.tgz";
        sha512 = "KY9Frmirql91X2Qgjry0Wd4Y+YTdrdZheS8TFwvkbLWf/G5KNJDCh6pKL5OZctEW4+0Baa5idK2ZQuELRwPznQ==";
      };
    };
    "uuid-3.3.3" = {
      name = "uuid";
      packageName = "uuid";
      version = "3.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/uuid/-/uuid-3.3.3.tgz";
        sha512 = "pW0No1RGHgzlpHJO1nsVrHKpOEIxkGg1xB+v0ZmdNH5OAeAwzAVrCnI2/6Mtx+Uys6iaylxa+D3g4j63IKKjSQ==";
      };
    };
    "verror-1.10.0" = {
      name = "verror";
      packageName = "verror";
      version = "1.10.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/verror/-/verror-1.10.0.tgz";
        sha1 = "3a105ca17053af55d6e270c1f8288682e18da400";
      };
    };
    "w3c-hr-time-1.0.1" = {
      name = "w3c-hr-time";
      packageName = "w3c-hr-time";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/w3c-hr-time/-/w3c-hr-time-1.0.1.tgz";
        sha1 = "82ac2bff63d950ea9e3189a58a65625fedf19045";
      };
    };
    "w3c-xmlserializer-1.1.2" = {
      name = "w3c-xmlserializer";
      packageName = "w3c-xmlserializer";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/w3c-xmlserializer/-/w3c-xmlserializer-1.1.2.tgz";
        sha512 = "p10l/ayESzrBMYWRID6xbuCKh2Fp77+sA0doRuGn4tTIMrrZVeqfpKjXHY+oDh3K4nLdPgNwMTVP6Vp4pvqbNg==";
      };
    };
    "webidl-conversions-4.0.2" = {
      name = "webidl-conversions";
      packageName = "webidl-conversions";
      version = "4.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-4.0.2.tgz";
        sha512 = "YQ+BmxuTgd6UXZW3+ICGfyqRyHXVlD5GtQr5+qjiNW7bF0cqrzX500HVXPBOvgXb5YnzDd+h0zqyv61KUD7+Sg==";
      };
    };
    "whatwg-encoding-1.0.5" = {
      name = "whatwg-encoding";
      packageName = "whatwg-encoding";
      version = "1.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-encoding/-/whatwg-encoding-1.0.5.tgz";
        sha512 = "b5lim54JOPN9HtzvK9HFXvBma/rnfFeqsic0hSpjtDbVxR3dJKLc+KB4V6GgiGOvl7CY/KNh8rxSo9DKQrnUEw==";
      };
    };
    "whatwg-mimetype-2.3.0" = {
      name = "whatwg-mimetype";
      packageName = "whatwg-mimetype";
      version = "2.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-mimetype/-/whatwg-mimetype-2.3.0.tgz";
        sha512 = "M4yMwr6mAnQz76TbJm914+gPpB/nCwvZbJU28cUD6dR004SAxDLOOSUaB1JDRqLtaOV/vi0IC5lEAGFgrjGv/g==";
      };
    };
    "whatwg-url-7.0.0" = {
      name = "whatwg-url";
      packageName = "whatwg-url";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-url/-/whatwg-url-7.0.0.tgz";
        sha512 = "37GeVSIJ3kn1JgKyjiYNmSLP1yzbpb29jdmwBSgkD9h40/hyrR/OifpVUndji3tmwGgD8qpw7iQu3RSbCrBpsQ==";
      };
    };
    "wordwrap-1.0.0" = {
      name = "wordwrap";
      packageName = "wordwrap";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/wordwrap/-/wordwrap-1.0.0.tgz";
        sha1 = "27584810891456a4171c8d0226441ade90cbcaeb";
      };
    };
    "ws-7.1.2" = {
      name = "ws";
      packageName = "ws";
      version = "7.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ws/-/ws-7.1.2.tgz";
        sha512 = "gftXq3XI81cJCgkUiAVixA0raD9IVmXqsylCrjRygw4+UOOGzPoxnQ6r/CnVL9i+mDncJo94tSkyrtuuQVBmrg==";
      };
    };
    "xml-name-validator-3.0.0" = {
      name = "xml-name-validator";
      packageName = "xml-name-validator";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/xml-name-validator/-/xml-name-validator-3.0.0.tgz";
        sha512 = "A5CUptxDsvxKJEU3yO6DuWBSJz/qizqzJKOMIfUJHETbBw/sFaDxgd6fxm1ewUaM0jZ444Fc5vC5ROYurg/4Pw==";
      };
    };
    "xmlchars-2.2.0" = {
      name = "xmlchars";
      packageName = "xmlchars";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/xmlchars/-/xmlchars-2.2.0.tgz";
        sha512 = "JZnDKK8B0RCDw84FNdDAIpZK+JuJw+s7Lz8nksI7SIuU3UXJJslUthsi+uWBUYOwPFwW7W7PRLRfUKpxjtjFCw==";
      };
    };
  };
in
{
  foundation-sites = nodeEnv.buildNodePackage {
    name = "foundation-sites";
    packageName = "foundation-sites";
    version = "6.5.3";
    src = fetchurl {
      url = "https://registry.npmjs.org/foundation-sites/-/foundation-sites-6.5.3.tgz";
      sha512 = "ZwI0idjHHjezh6jRjpPxkczvmtUuJ1uGatZHpyloX0MvsFHfM0BFoxrqdXryXugGPdmb+yJi3JYMnz6+5t3K1A==";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "The most advanced responsive front-end framework in the world.";
      homepage = http://foundation.zurb.com/sites;
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
  jsdom = nodeEnv.buildNodePackage {
    name = "jsdom";
    packageName = "jsdom";
    version = "15.1.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/jsdom/-/jsdom-15.1.1.tgz";
      sha512 = "cQZRBB33arrDAeCrAEWn1U3SvrvC8XysBua9Oqg1yWrsY/gYcusloJC3RZJXuY5eehSCmws8f2YeliCqGSkrtQ==";
    };
    dependencies = [
      sources."abab-2.0.1"
      sources."acorn-6.3.0"
      sources."acorn-globals-4.3.4"
      sources."acorn-walk-6.2.0"
      sources."ajv-6.10.2"
      sources."array-equal-1.0.0"
      sources."asn1-0.2.4"
      sources."assert-plus-1.0.0"
      sources."async-limiter-1.0.1"
      sources."asynckit-0.4.0"
      sources."aws-sign2-0.7.0"
      sources."aws4-1.8.0"
      sources."bcrypt-pbkdf-1.0.2"
      sources."browser-process-hrtime-0.1.3"
      sources."caseless-0.12.0"
      sources."combined-stream-1.0.8"
      sources."core-util-is-1.0.2"
      sources."cssom-0.3.8"
      sources."cssstyle-1.4.0"
      sources."dashdash-1.14.1"
      sources."data-urls-1.1.0"
      sources."deep-is-0.1.3"
      sources."delayed-stream-1.0.0"
      sources."domexception-1.0.1"
      sources."ecc-jsbn-0.1.2"
      sources."escodegen-1.12.0"
      sources."esprima-3.1.3"
      sources."estraverse-4.3.0"
      sources."esutils-2.0.3"
      sources."extend-3.0.2"
      sources."extsprintf-1.3.0"
      sources."fast-deep-equal-2.0.1"
      sources."fast-json-stable-stringify-2.0.0"
      sources."fast-levenshtein-2.0.6"
      sources."forever-agent-0.6.1"
      sources."form-data-2.3.3"
      sources."getpass-0.1.7"
      sources."har-schema-2.0.0"
      sources."har-validator-5.1.3"
      sources."html-encoding-sniffer-1.0.2"
      sources."http-signature-1.2.0"
      sources."iconv-lite-0.4.24"
      sources."ip-regex-2.1.0"
      sources."is-typedarray-1.0.0"
      sources."isstream-0.1.2"
      sources."jsbn-0.1.1"
      sources."json-schema-0.2.3"
      sources."json-schema-traverse-0.4.1"
      sources."json-stringify-safe-5.0.1"
      sources."jsprim-1.4.1"
      sources."levn-0.3.0"
      sources."lodash-4.17.15"
      sources."lodash.sortby-4.7.0"
      sources."mime-db-1.40.0"
      sources."mime-types-2.1.24"
      sources."nwsapi-2.1.4"
      sources."oauth-sign-0.9.0"
      sources."optionator-0.8.2"
      sources."parse5-5.1.0"
      sources."performance-now-2.1.0"
      sources."pn-1.1.0"
      sources."prelude-ls-1.1.2"
      sources."psl-1.4.0"
      sources."punycode-2.1.1"
      sources."qs-6.5.2"
      (sources."request-2.88.0" // {
        dependencies = [
          sources."punycode-1.4.1"
          sources."tough-cookie-2.4.3"
        ];
      })
      sources."request-promise-core-1.1.2"
      (sources."request-promise-native-1.0.7" // {
        dependencies = [
          sources."tough-cookie-2.5.0"
        ];
      })
      sources."safe-buffer-5.2.0"
      sources."safer-buffer-2.1.2"
      sources."saxes-3.1.11"
      sources."source-map-0.6.1"
      sources."sshpk-1.16.1"
      sources."stealthy-require-1.1.1"
      sources."symbol-tree-3.2.4"
      sources."tough-cookie-3.0.1"
      sources."tr46-1.0.1"
      sources."tunnel-agent-0.6.0"
      sources."tweetnacl-0.14.5"
      sources."type-check-0.3.2"
      sources."uri-js-4.2.2"
      sources."uuid-3.3.3"
      sources."verror-1.10.0"
      sources."w3c-hr-time-1.0.1"
      sources."w3c-xmlserializer-1.1.2"
      sources."webidl-conversions-4.0.2"
      sources."whatwg-encoding-1.0.5"
      sources."whatwg-mimetype-2.3.0"
      sources."whatwg-url-7.0.0"
      sources."wordwrap-1.0.0"
      sources."ws-7.1.2"
      sources."xml-name-validator-3.0.0"
      sources."xmlchars-2.2.0"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "A JavaScript implementation of many web standards";
      homepage = "https://github.com/jsdom/jsdom#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}