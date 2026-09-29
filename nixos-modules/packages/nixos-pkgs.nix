{ pkgs, ... }: {
  imports = [
    ./default.nix
    ./clang
    ./cmake
    ./gtk
    ./nixfmt
    ./tailscale
    ./libGL
    ./hyprpolkit
    ./killall
    ./awww
    ./zip
    ./neovim
    ./open-tablet-driver
    ./brightnessctl
  ];
}