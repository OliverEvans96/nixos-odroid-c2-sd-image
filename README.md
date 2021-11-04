# ODROID C2 NixOS SD Image

Previously, building a custom NixOS SD image for the ODROID C2 required creating an image, then manually patching it with the ODROID version of U-Boot.
This repo simplifies this process into a single `nix build`.

## Instructions
1. Generate patched image (`nix build`)
2. Flash SD card (`sudo dd if=result/nixos-sd-image-21.05.3848.f001876680c-aarch64-linux.img of=/dev/sdX status=progress conv=fsync`)

## Helpful Links
- https://github.com/lucernae/nixos-pi
- https://nix.dev/tutorials/installing-nixos-on-a-raspberry-pi
- https://nixos.wiki/wiki/NixOS_on_ARM
- https://nixos.wiki/wiki/NixOS_on_ARM/ODROID-C2

