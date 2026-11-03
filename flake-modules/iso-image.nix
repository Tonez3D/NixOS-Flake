{
  config,
  pkgs,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  isoImage = {
    isoName = lib.mkForce "nixos-custom-${config.system.nixos.label}-${pkgs.stdenv.hostPlatform.system}.iso";
    volumeID = "NIXOS_CUSTOM";
    makeEfiBootable = true;
    makeUsbBootable = true;
    squashfsCompression = "zstd -Xcompression-level 6";
  };

  networking.hostName = "nixos-live";

  hardware.enableRedistributableFirmware = true;

  nixpkgs.config.allowUnfree = true;

  boot.supportedFilesystems = [
    "btrfs"
    "xfs"
    "ext4"
    "vfat"
    "ntfs"
  ];

  networking.wireless.enable = lib.mkForce false;

  environment.etc."iso-config".source = ./.;
}
