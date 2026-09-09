{ pkgs, lib, ... }:
{

  imports = [
    ./wifi.nix
    ./udev.nix
  ];

}
