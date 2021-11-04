# ODROID C2 NixOS SD Image

Currently, building a custom NixOS SD image for the ODROID C2 requires creating an image, then manually patching it with the ODROID version of U-Boot.
This repo simplifies this process into a single `nix build`.

## Helpful Links
- https://github.com/lucernae/nixos-pi
- https://nix.dev/tutorials/installing-nixos-on-a-raspberry-pi
- https://nixos.wiki/wiki/NixOS_on_ARM
- https://nixos.wiki/wiki/NixOS_on_ARM/ODROID-C2

## Instructions
1. `nix build`
