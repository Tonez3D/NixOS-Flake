{ pkgs, ... }:
{
  imports = [
    ./default.nix
    ./discord
    ./blender
    ./krita
    ./obsidian
    ./gowall
    ./hyprland
    ./kicad
    ./kitty
    ./gowall
    ./jetbrains
    ./proton-vpn
    ./wallust
    ./waybar
    ./rofi
    ./jetbrains
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
    ./zen
  ];

  custom-spotify.enable = false;

}
