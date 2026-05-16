{ inputs, pkgs, config, lib, ... }: {
  imports = [
    ./binds.nix
    ./plugins.nix
    ./hyprpaper.nix
    ./hyprbar.nix
    ./monitor.nix
    ./borders.nix
    ./general.nix
    ./workspace.nix
    ./hyprlock.nix
    #./hellwal-colors.nix
    ./exec-once.nix
    ./hypridle.nix
  ];

  home.packages = with pkgs; [ hyprpolkitagent ];

  wayland.windowManager.hyprland.enable = true; # enable Hyprland
  wayland.windowManager.hyprland.xwayland.enable = true;

}
