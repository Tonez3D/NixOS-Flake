{ hostName, pkgs, ... }: {
  imports = [
    ./default.nix
    ./clang
    ./cmake
    ./gtk
    ./libGL
    ./claude-code
    ./firefox
    ./hyprpolkit
    ./awww
    ./open-tablet-driver
    ./brightnessctl
  ];
}
