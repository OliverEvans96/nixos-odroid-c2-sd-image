{ pkgs, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-aarch64.nix>
  ];

  # Do not compress the image as we want to use it straight away
  sdImage.compressImage = false;

  services.openssh = {
    enable = true;
    permitRootLogin = "prohibit-password";
  };

  users.users.root.openssh.authorizedKeys.keyFiles = [
   "/home/oliver/.ssh/id_rsa.pub"
  ];
}
