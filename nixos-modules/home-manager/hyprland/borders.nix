{ ... } : 
{
  wayland.windowManager.hyprland.settings = {


    plugin.borders-plus-plus = {
      add_borders = 1;
      border_size = [9];
      col.active_border = "rgb(00ffff)";
      natrual_roundoing = "yes";
    };

    decoration = {
      rounding = 20;
    };

    general = {
      layout = "dwindle";
      border_size = 3;
      snap = {
        enabled = true;
      };
      gaps_in = 2;
      gaps_out = 5;
    };
    
  };
}