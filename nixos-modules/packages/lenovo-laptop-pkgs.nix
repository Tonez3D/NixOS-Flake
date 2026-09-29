{ pkgs, ... }:
{
  imports = [
    ./default.nix
    ./clang
    ./cmake
    ./gtk
    ./libGL
    ./hyprpolkit
    ./usb
    ./awww
    ./firefox
    ./open-tablet-driver
    ./brightnessctl
  ];
}
