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
    ./tailscale
    ./killall
    ./usb
    ./tree
    ./awww
    ./firefox
    ./iproute2
    ./zip
    ./neovim
    ./open-tablet-driver
    ./brightnessctl
  ];
}
