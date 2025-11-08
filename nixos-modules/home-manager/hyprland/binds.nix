{inputs, ...} : 
{
  
  wayland.windowManager.hyprland.settings = {
      "$mainMod" = "SUPER";
      
      bind =
        [
          "$mainMod, F, exec, firefox"
	        "$mainMod, K, exec, kitty"
          "$mainMod, Q, killactive"
          "$mainMod CTRL, L, exec, hyprctl dispatch exit"
	        "$mainMod CTRL, V, exec, code"
          ", Print, exec, grimblast copy area"
        ];
    };
  
}
