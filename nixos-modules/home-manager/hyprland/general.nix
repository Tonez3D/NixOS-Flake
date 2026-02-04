{ ... }:

{

  wayland.windowManager.hyprland.systemd.variables = [ "--all" ];

  wayland.windowManager.hyprland.settings = {
    general = {

      layout = "dwindle";
      border_size = 3;
      snap = {

        enabled = true;

      };

      resize_on_border = true;

      gaps_in = 0;
      gaps_out = 0;

    };
    #cursor = {
    #  enable_hyprcursor = false;
    #};

    input = {
      kb_layout = "us";
      numlock_by_default = true;

      tablet = {
        transform = 0;
        output = "HDMI-A-1";
      };
    };
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };
  };
}
