{ pkgs, ... }: {
  imports = [
    ./default.nix
    ./clang
    ./cmake
    ./gtk
    ./libGL
    ./firefox
    ./hyprpolkit
    ./awww
    ./open-tablet-driver
    ./brightnessctl
  ];
}