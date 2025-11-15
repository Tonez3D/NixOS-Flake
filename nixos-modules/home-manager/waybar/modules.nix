
{


  "clock" = {
    format = ''
      {:%I
      %M}'';
    tooltip-format = ''
      <big>{:%Y %B}</big>
      <tt><small>{calendar}</small></tt>'';
  };

  "lock" = {
    format = "";
  };

  "network" = {
    format-wifi = "󰤨";
    format-ethernet = "󰤨";
    format-alt = "󰤨";
    format-disconnected = "󰤭";
    tooltip-format = "{ipaddr}/{ifname} via {gwaddr} ({signalStrength}%)";
  };

  "pulseaudio" = {
    scroll-step = 5;
          tooltip = false;
          format = "{icon}";
          format-icons = {default = ["" "" "墳"];};
          on-click = "killall pavucontrol || pavucontrol";
  };

  "hyprland/workspaces" = {
    on-click = "activate";
          format = "";
          active-only = false;
          format-icons = {
            default = "";
            active = " 󰮯";
          };
          persistent-workspaces = 5;
  };

  "custom/search" = {
    format = " Apps";
    tooltip = false;
    on-click = "killall rofi || rofi -show drun";
  };

  "hyprland/window" = {
    rewrite = {};
    seperate-outputs = true;
  };

  "bluetooth" = {};

  "power" = {
    tooltip = false;
          on-click = "wlogout &";
          format = "襤";
          };


  "battery" = {
    states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "";
          format-plugged = "";
          format-alt = "{icon}";
          format-icons = ["" "" "" "" "" "" "" "" "" "" "" ""];
        
  };

  

}