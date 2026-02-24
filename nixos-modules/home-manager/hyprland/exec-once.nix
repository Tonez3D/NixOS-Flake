{ ... }: 

{
  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprbar"
    "hyprlock"
    "waybar"
    "swww-daemon"
    "swww init"
    #"hyprpaper"
    #"swww img /etc/nixos/assets/54xhll4sbo.jpg"
    "waypaper --restore"
  ];
}
