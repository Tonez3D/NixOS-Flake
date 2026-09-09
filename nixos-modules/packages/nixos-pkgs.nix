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
    ./awww
    ./firefo
    ./zip
    ./neovim
    ./open-tablet-driver
    ./brightnessctl
  ];
}
