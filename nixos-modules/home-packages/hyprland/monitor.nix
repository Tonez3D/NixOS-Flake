{
  config,
  hostName,
  inputs,
  lib,
  ...
}:
let
  lua = lib.generators.mkLuaInline;
  bind = configs: {
    _args = [
      (lua configs)
    ];
  };
  monitor =
    o: m: p: s:
    ''{ output = "${o}", mode = "${m}", position = "${p}", scale = "${s}", }'';
in
{

  wayland.windowManager.hyprland.settings = (
    lib.mkMerge [

      (lib.mkIf (hostName == "lenovo-laptop") {

        monitor = [
          (bind (monitor "eDP-1" "1920x1080@60" "0x0" "1"))
          (bind (monitor "HDMI-A-1" "1920x1080@60" "+1920x0" "1"))
        ];

      })

      (lib.mkIf (hostName == "nixos") {

        monitor = [
          (bind (monitor "DP-1" "2560x1440@60" "0x0" "1"))
          (bind (monitor "HDMI-A-1" "1920x1080@60" "+0x1440" "1"))
          (bind (monitor "DP-2" "1360x768@60" "+2560x700" "1"))
        ];

      })

    ]
  );

}
