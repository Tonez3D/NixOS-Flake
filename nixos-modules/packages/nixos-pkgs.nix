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
    ./swww
    ./firefo
    ./zip
    ./neovim
    ./open-tablet-driver
    ./brightnessctl
  ];
}
