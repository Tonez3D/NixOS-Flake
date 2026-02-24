{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = let
      modconfig = import ./modules.nix;
      conf-0 = {
        layer = "top";
        position = "top";
        width = 2560;
        hieght = 2;
        spacing = 4;
        output = "DP-1";

        modules-left = [ "custom/search" "logout" "hyprland/workspaces" ];

        modules-center = [ "active" ];

        modules-right = [ "group/misc" "network" "battery" "pulseaudio" "clock" ];
      };
      conf-1 = {
        layer = "top";
        position = "top";
        width = 1920;
        hieght = 4;
        spacing = 4;
        output = [ "HDMI-A-1" "eDP-1" ];

        modules-left = [
          "custom/search"
          "logout"
          "hyprland/workspaces"
          #"custom/lock"
          #"custom/lock"
          #"battery"
        ];

        modules-center = [ "active" ];

        modules-right = [ "group/misc" "network" "battery" "pulseaudio" "clock" ];
      };
    in {
      mainBar = conf-0 // modconfig;
      sendaryBar = conf-1 // modconfig;
    };

    style = import ./style.nix;
  };
}
