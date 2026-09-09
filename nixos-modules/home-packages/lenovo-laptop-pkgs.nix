{ pkgs, ... }:
{
  imports = [
    ./default.nix
    ./discord
    #./blender
    ./krita
    ./obsidian
    ./gowall
    ./hyprland
    ./kicad
    ./kitty
    ./gowall
    ./jetbrains
    ./wallust
    ./waybar
    ./rofi
    ./nemo
    ./grimblast
    ./pavucontrol
    ./playerctl
    ./vscode
    ./starship
    ./spotify
    ./waypaper
    ./pointers/bibata.nix
    ../scripts/generate-color-pallet.nix
    ../scripts/get-wallpaper.nix
  ];

  custom-spotify.enable = false;

}
