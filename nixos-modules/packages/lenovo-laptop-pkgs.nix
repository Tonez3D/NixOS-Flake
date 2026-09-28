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
    ./visidata
    ./zip
    ./neovim
    ./open-tablet-driver
    ./brightnessctl
  ];
}
