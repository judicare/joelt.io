{ nixpkgs, declInput }:

let
  pkgs = import nixpkgs {};

  job = branch: {
    enabled = 1;
    hidden = false;
    description = "Website";
    nixexprinput = "src";
    nixexprpath = "release.nix";
    checkinterval = 300;
    schedulingshares = 2;
    enableemail = false;
    emailoverride = "";
    keepnr = 5;
    inputs = {
      src = {
        type = "git";
        value = "git@github.com:pikajude/jude-web.git ${branch}";
        emailresponsible = false;
      };
      nixpkgs = {
        type = "git";
        value = "https://github.com/NixOS/nixpkgs.git";
        emailresponsible = false;
      };
    };
  };

  spec = {
    master = job "master";
  };

in { jobsets = pkgs.writeText "spec.json" (builtins.toJSON spec); }
