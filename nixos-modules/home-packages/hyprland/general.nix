{ ... }:

{

  wayland.windowManager.hyprland = {
    systemd.variables = [ "--all" ];
systemd.enable = false;
    configType = "lua";

    settings = {

      config = {
        general = {
          layout = "dwindle";
          gaps_in = 2;
          gaps_out = 1;
          border_size = 2;
          resize_on_border = true;
        };

        decoration = {
          rounding = 4;
          active_opacity = 1.0;
          inactive_opacity = 0.95;
        };
      };

      #  windowrule = [ "float = true, center = 1, size = 30 40, match:class ^(floating-window)" ];
      #
      #
      #  misc = {
      #    disable_hyprland_logo = true;
      #    disable_splash_rendering = true;
      #  };
    };
  };
}
