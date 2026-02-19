{
  "clock" = {
    format = "{:%I:%M}";
  };

  "network" = {
    format-wifi = "󰤨";
    on-click = "kitty --class floating-window -e nmtui";
    format-ethernet = "󰤨";
    format-alt = "󰤨";
    format-disconnected = "󰤭";
    tooltip-format = "{ipaddr}/{ifname} via {gwaddr} ({signalStrength}%)";
  };

  "hyprland/workspaces" = {
    on-click = "activate";
    format = "{}";
    active-only = false;
    format-icons = {
      default = "";
      active = " 󰮯";
    };
    persistent-workspaces = { "1" = [ ]; };
  };

  


  "custom/search" = {
    format = " ";
    tooltip = false;
    on-click = "killall rofi || rofi -show drun";
  };

  "pulseaudio" = {
    scroll-step = 5;
    tooltip = false;
    format = "{icon}";
    format-mute = "";
    format-icons = { default = [  "" "" ]; };
    on-click = "killall pavucontrol || pavucontrol";
  };

  "hyprland/window" = {
    rewrite = { };
    seperate-outputs = true;
  };

  "bluetooth" = { };

  "custom/power" = {
    format = "Power";
    tooltip = false;
    on-click = "wlogout &";
  };

  "logout" = {
    format = "LOG";
  };

  "battery" = {
    states = {
      warning = 30;
      critical = 15;
    };
    format = "{icon}";
    format-charging = "";
    format-plugged = "";
    format-alt = "{icon}";
    format-icons = [ "" "`" "" ""];
    tooltip-format = "{capacity}%";
  };
}
