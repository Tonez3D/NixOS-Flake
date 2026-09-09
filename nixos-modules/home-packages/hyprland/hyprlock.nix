{ pkgs, ... }:
{

  home.packages = with pkgs; [ hyprlock ];

  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = false;
        ignore_empty_input = true;
        fractional_scaling = 0;
      };

      background = [
        {
          #path = screenshot;

          color = "rgba(29, 32, 33, 255)";
          blur_passes = 2;
          vibrancy_darkness = 0.0;
        }
      ];

      shape = [

        # Background box
        {
          size = "800, 300";

          rounding = 4;
          border_size = 2;
          color = "rgba(102, 92, 84, 0.33)";
          border_color = "rgba(168, 153, 132, 0.95)";

          position = "0, 120";
          halign = "center";
          valign = "center";
        }
      ];

      image = [
        {
          #monitor = ;
          path = "/etc/nixos/assets/ELARA_Patch_2.0.png";
          size = 100;
          border_size = 2;
          border_color = "rgba(168, 153, 132, 0.95)";
          position = "50, -100";
          halign = "center";
          valign = "center";
        }

      ];

      label = [
        # Date
        {
          text = ''cmd[update:1000] echo "- $(date +'%A, %B %d') -" '';

          font_size = 25;
          font_family = "lato";

          shadow_passes = 3;
          color = "rgba(235, 219, 178, 0.9)";

          position = "0, -225";
          halign = "center";
          valign = "top";
        }
      ];

      input-field = [
        {
          size = "300, 50";
          rounding = 3;
          outline_thickness = 2;

          dots_spacing = 0.4;

          font_color = "rgba(235, 219, 178, 0.9)";
          font_family = "lato";

          outer_color = "rgba(168, 153, 132, 0.95)";
          inner_color = "rgba(102, 92, 84, 0.33)";
          check_color = "rgba(152, 151, 26, 0.95)";
          fail_color = "rgba(204, 36, 29, 0.95)";
          capslock_color = "rgba(215, 153, 33, 0.95)";
          bothlock_color = "rgba(215, 153, 33, 0.95)";

          hide_input = false;
          fade_on_empty = true;
          placeholder_text = ''<i><span foreground="##fbf1c7">Enter Password</span></i>'';

          position = "0, 50";
          halign = "center";
          valign = "bottom";
        }
      ];

      animation = [ "inputFieldColors, 0" ];
    };
  };
}
