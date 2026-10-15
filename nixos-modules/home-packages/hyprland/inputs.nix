{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    config = {
      input = {

        kb_layout = "us";
        numlock_by_default = true;

        touchpad = {
          drag_3fg = 1;
        };

        tablet = {
          transform = 0;
          output = "HDMI-A-1";
        };
      };
    };
  };
}
