{ stdenv, config, lib, pkgs, pkgsCross }:
let
  configuration = (import ./sd-image.nix) { inherit lib config pkgs; }; 
  customNixos = import <nixpkgs/nixos> { 
    inherit configuration; 
    system = "aarch64-linux"; 
  };
  mySdImage = customNixos.config.system.build.sdImage;
  imageName = "nixos-sd-image-21.05.3926.5ebb1dca9bb-aarch64-linux.img";
in
stdenv.mkDerivation {
  pname = "my-sd-image";
  version = "0.1";
  src = ./src;

  nativeBuildInputs = with pkgs; [
    bash
    utillinux # losetup
  ];

  # Use sd_fusing script to write ODROID U-Boot on top of SD Image
  buildPhase = ''
    mkdir $out
    # TODO: sudo?
    cp ${mySdImage}/sd-image/${imageName} .
    loopdev=$(losetup --show -f ${imageName})
    cd ${pkgsCross.aarch64-multiplatform.ubootOdroidC2}
    bash $src/sd_fusing.sh $loopdev 
    losetup -d $lopdev
  '';

  installPhase = ''
    mv ${imageName} $out
  '';
}
