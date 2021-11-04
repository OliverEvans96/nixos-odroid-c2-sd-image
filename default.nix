let pkgs = import <nixpkgs> {};
in pkgs.callPackage (import ./build-and-patch.nix) {}
