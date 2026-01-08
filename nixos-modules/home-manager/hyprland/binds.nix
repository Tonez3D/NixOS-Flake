{inputs, ...} : 

{
  
  wayland.windowManager.hyprland.settings = {

    "$mainMod" = "SUPER";
      
    bind = [
      "$mainMod, F, exec, firefox"
	    "$mainMod, K, exec, kitty"
      "$mainMod, Q, killactive"
      "$mainMod, Z, exec, rofi -show drun"
      "$mainMod, O, exec, obsidian"
      "$mainMod SHIFT, F, fullscreen, 1"
      "$mainMod CTRL, L, exec, hyprctl dispatch exit"
	    "$mainMod CTRL, V, exec, code"
      ", Print, exec, grimblast copy area"

      ", tablet:1, mouse, 1"


      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, workspace, 11"
      "$mainMod SHIFT, 2, workspace, 12"
      "$mainMod SHIFT, 3, workspace, 13"
      "$mainMod SHIFT, 4, workspace, 14"
      "$mainMod SHIFT, 5, workspace, 15"
      "$mainMod SHIFT, 6, workspace, 16"
      "$mainMod SHIFT, 7, workspace, 17"
      "$mainMod SHIFT, 8, workspace, 18"
      "$mainMod SHIFT, 9, workspace, 19"
      "$mainMod SHIFT, 0, workspace, 20"


    ];

  };

}
