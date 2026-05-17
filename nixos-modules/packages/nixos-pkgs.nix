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
    ./zip
    ./neovim
    ./open-tablet-driver
    ./brightnessctl
  ];
}
