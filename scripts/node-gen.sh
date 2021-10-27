#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nodePackages.node2nix
node2nix -i node-packages.json \
  -o generated/node-packages.nix \
  -c generated/node-composition.nix \
  -e generated/node-env.nix \
  --nodejs-14
