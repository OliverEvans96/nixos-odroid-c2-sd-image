{ pkgs, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-aarch64.nix>
  ];

  # Do not compress the image as we want to use it straight away
  sdImage.compressImage = false;

  environment.systemPackages = with pkgs; [
    htop
  ];
}
