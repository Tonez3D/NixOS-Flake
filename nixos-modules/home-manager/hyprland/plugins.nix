{pkgs, ...} : 

{

  wayland.windowManager.hyprland.plugins = [
    pkgs.hyprlandPlugins.hyprbars
    pkgs.hyprlandPlugins.borders-plus-plus
  ];

}