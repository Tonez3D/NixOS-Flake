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
    ./glab
    ./firefox
    ./open-tablet-driver
    ./brightnessctl
  ];
}
