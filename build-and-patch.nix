{ stdenv, config, lib, pkgs, pkgsCross }:
let
  configuration = (import ./sd-image.nix) { inherit lib config pkgs; }; 
  customNixos = import <nixpkgs/nixos> { 
    inherit configuration; 
    system = "aarch64-linux"; 
  };
  customSdImage = customNixos.config.system.build.sdImage;
  imgName = "nixos-sd-image-21.05.3926.5ebb1dca9bb-aarch64-linux.img";
  imgPath = "${customSdImage}/sd-image/${imgName}";
in
stdenv.mkDerivation {
  pname = "odroid-c2-sd-image";
  version = "0.1";
  src = ./src;

  nativeBuildInputs = with pkgs; [
    bash
  ];

  # Use sd_fusing script to write ODROID U-Boot on top of SD Image
  buildPhase = ''
    BUILD=$PWD
    cp ${imgPath} .
    chmod u+w ${imgName}

    cd ${pkgsCross.aarch64-multiplatform.ubootOdroidC2}
    bash $src/sd_fusing.sh $BUILD/${imgName}
  '';

  installPhase = ''
    mkdir $out
    cp $BUILD/${imgName} $out
  '';

}
