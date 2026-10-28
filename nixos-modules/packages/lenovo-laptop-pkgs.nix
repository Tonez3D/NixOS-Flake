{ pkgs, ... }:
{
  imports = [
    ./default.nix
    ./clang
    ./cmake
    ./gtk
    ./libGL
    ./hyprpolkit
    ./claude-code
    ./usb
    ./awww
    ./docker
    ./firefox
    ./open-tablet-driver
    ./brightnessctl
  ];
}
