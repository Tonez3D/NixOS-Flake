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
    ./docker
    ./firefox
    ./open-tablet-driver
    ./brightnessctl
  ];
}
