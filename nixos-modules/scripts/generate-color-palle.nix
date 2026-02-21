{pkgs, config, ...} : 
let 
  gen-colors = pkgs.writeScriptBin "new-color-pallet" ''
    #!/usr/bin/env bash
    wallpaperPath=$(waypaper --list | grep -o '"wallpaper": "[^"]*"' | cut -d: -f2 | tr -d '"')

    echo $wallpaperPath
    wallust run --backend full --colorspace lab "$(swww query | grep -o '/etc.*' -m 1)"
    hyprctl dispatch exec pkill waybar
    hyprctl dispatch exec waybar
  '';
in {
  home.packages = [gen-colors];
}