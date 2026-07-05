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
    ./swww
    ./firefox
    ./iproute2
    ./visidata
    ./zip
    ./neovim
    ./open-tablet-driver
    ./brightnessctl
  ];
}
