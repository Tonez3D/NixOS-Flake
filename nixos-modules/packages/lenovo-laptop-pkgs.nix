{ pkgs, ... }:
{
  imports = [
    ./default.nix
    ./clang
    ./cmake
    ./gtk
    ./libGL
    ./hyprpolkit
    ./wev
    ./killall
    ./usb
    ./swww
    ./firefox
    ./iproute2
    ./zip
    ./neovim
    ./open-tablet-driver
    ./brightnessctl
  ];
}
