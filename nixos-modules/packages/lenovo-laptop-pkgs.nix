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
        ./firefox

    ./zip
    ./neovim
    ./open-tablet-driver
    ./brightnessctl
  ];
}
