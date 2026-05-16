{ ... }:
let bar-style = ./style.css;
in {
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

        modules-right = [ "group/combinded" ];
      };
      conf-1 = {
        layer = "top";
        position = "top";
        width = 1920;
        hieght = 8;
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

        modules-right = [ "group/combinded" ];
      };
      conf-2 = {
        layer = "top";
        position = "top";
        width = 1360;
        hieght = 3;
        spacing = 4;
        output = [ "DP-2" ];

        modules-left = [
          "custom/search"
          "logout"
          "hyprland/workspaces"
          #"custom/lock"
          #"custom/lock"
          #"battery"
        ];

        modules-center = [ "active" ];

        modules-right = [ "network" "battery" "pulseaudio" "clock" ];
      };
    in {
      mainBar = conf-0 // modconfig;
      sendaryBar = conf-1 // modconfig;
      sendayBar = conf-2 // modconfig;
    };

    style = "${bar-style}";
  };
}
