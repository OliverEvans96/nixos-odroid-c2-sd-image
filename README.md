# ODROID C2 NixOS SD Image

Currently, building a custom NixOS SD image for the ODROID C2 requires creating an image, then manually patching it with the ODROID version of U-Boot.
This repo attempts to simplify this process into a single `nix build`.
**It's not working yet**.

## Helpful Links
- https://github.com/lucernae/nixos-pi
- https://nix.dev/tutorials/installing-nixos-on-a-raspberry-pi
- https://nixos.wiki/wiki/NixOS_on_ARM
- https://nixos.wiki/wiki/NixOS_on_ARM/ODROID-C2

## Instructions
1. `nix build`

## Current Error
```
builder for '/nix/store/8a97igbhbpdpf168jpr4svddgmvsvkh7-my-sd-image-0.1.drv' failed with exit code 1; last 8 log lines:
  unpacking sources
  unpacking source archive /nix/store/z409bi45nwp5p8b56viq1js6485651js-src
  source root is src
  patching sources
  configuring
  no configure script, doing nothing
  building
  losetup: cannot find an unused loop device
```
