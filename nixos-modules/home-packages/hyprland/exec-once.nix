{ pkgs, lib, ... }:
let
  lua = lib.generators.mkLuaInline;
  on = event: body: {
    _args = [
      event
      (lua ''function() ${body} end'')
    ];
  };
  exec = cmd: ''hl.exec_cmd("${cmd}")'';
in
{

  wayland.windowManager.hyprland.settings.on = [(
      on "hyprland.start" ''
        ${exec "waybar"}
        ${exec "hyprlock"}
        ${exec "awww-daemon"}
        ${exec "awww init"}
        ${exec "hyprlock"}
        ${exec "waybar --restore"}
      ''
    )
  ];
    
    ##[
    ##"hyprbar"
    ##"hyprlock"
    ##"waybar"
    ##"awww-daemon"
    ##"awww init"
    ###"hyprpaper"
    ###"swww img /etc/nixos/assets/54xhll4sbo.jpg"
    ##"waypaper --restore"
  #];
}
