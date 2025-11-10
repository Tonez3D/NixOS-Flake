{ ... } : 

{

  wayland.windowManager.hyprland.systemd.variables = ["--all"];

  wayland.windowManager.hyprland.settings = {
    general = {

      layout = "dwindle";
      border_size = 3;
      snap = {

        enabled = true;

      };

      resize_on_border = true;

      gaps_in = 2;
      gaps_out = 5;

    };

    input = {
      kb_layout = "us";

      tablet = {
        transform =0;
        output = "HDMI-A-1";
      };
    };
  };
}