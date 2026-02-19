{ config, hostName, inputs, lib, ... }:

{

  wayland.windowManager.hyprland.settings = (lib.mkMerge [

    (lib.mkIf (hostName == "lenovo-laptop") {

      monitor =
        [ "eDP-1, 1920x1080@60, 0x0, 1" "HDMI-A-1, 1920x1080@60, +1920x0, 1" ];

    })

    (lib.mkIf (hostName == "nixos") {

      monitor =
        [ "DP-1, 2560x1440@160, 0x0, 1" "HDMI-A-1, 1920x1080@60, 0x1440, 1" ];

    })

  ]);

}
