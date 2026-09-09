{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    ./binds.nix
    ./plugins.nix
    ./hyprpaper.nix
    #./hyprbar.nix
    ./monitor.nix
    ./borders.nix
    ./general.nix
    ./workspace.nix
    ./hyprlock.nix
    ./inputs.nix
    ./window-rules.nix
    #./hellwal-colors.nix
    ./exec-once.nix
    ./hypridle.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true; 
    xwayland.enable = true;
    #plugins = [
    #  pkgs.waypaper
    #  pkgs.waybar
    #  pkgs.hypridle
    #  pkgs.hyprlock
    #  pkgs.awww
    #]; 
  };
}
