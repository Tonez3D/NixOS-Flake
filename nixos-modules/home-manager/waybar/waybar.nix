{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = let
      modconfig = import ./modules.nix;
      conf = {
        layer = "top";
        position = "top";
        width = 1920;
        hieght = 2;
        spacing = 4;
        #margin-left = 0;
        #margin-right = 2;

        modules-left = [
          "custom/search"
          "logout"
          "hyprland/workspaces"
          #"custom/lock"
          #"custom/lock"
          #"battery"
        ];

        modules-center = [ "active" ];

        modules-right = [ "network" "battery" "pulseaudio"
        "clock" ];
      };
    in { mainBar = conf // modconfig; };

    style = import ./style.nix;
  };
}
