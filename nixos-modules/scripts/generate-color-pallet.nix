{ pkgs, config, ... }:
let
  gen-colors = pkgs.writeScriptBin "color-pallet" ''
    #!/usr/bin/env bash
    sleep 1.75
    wallust run --backend resized --colorspace lch "$(swww query | grep -o '/etc.*' -m 1)"
    #ln -s "$(swww query | grep -o '/etc.*' -m 1)" ~/.config/hypr/wallpaper
    hyprctl dispatch exec pkill waybar
    hyprctl dispatch exec waybar
  '';
in
{
  home.packages = [ gen-colors ];
}
