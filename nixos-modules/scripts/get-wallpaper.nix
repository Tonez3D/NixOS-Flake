{ pkgs, config, ... }:
let
  gen-wallpaper = pkgs.writeScriptBin "current-wallpaper" ''
    #!/usr/bin/env bash
    echo $(awww query | grep -o '/etc.*' -m 1)
  '';
in
{
  home.packages = [ gen-wallpaper ];
}
