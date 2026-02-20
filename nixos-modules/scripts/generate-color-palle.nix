{pkgs, config, ...} : 
let 
  gen-colors = pkgs.writeScriptBin "new-color-pallet" ''
    #!/usr/bin/env bash
    wallpaperPath=$(waypaper --list | grep -o '"wallpaper": "[^"]*"' | cut -d: -f2 | tr -d '"')

    echo $wallpaperPath
    wallust run --backend full --colorspace lab "$wallpaperPath"
  '';
in {
  home.packages = [gen-colors];
}