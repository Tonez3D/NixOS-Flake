{ pkgs, ... }: {
  imports = [
    ./default.nix
    ./clang
    ./cmake
    ./gtk
    ./nixfmt
    #./rofi
    ./libGL
    ./wev
    ./killall
    ./swww
    ./zip
    ./neovim
    ./open-tablet-driver
    ./brightnessctl
  ];
}
