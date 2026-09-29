{
  pkgs,
  lib,
  config,
  ...
}:
{

  environment.systemPackages = (
    lib.mkMerge [
      (lib.mkIf (config.networking.hostName == "lenovo-laptop") [ pkgs.nixfmt ])
      (lib.mkIf (config.networking.hostName == "nixos") [ pkgs.nixfmt ])
      (lib.mkIf (config.networking.hostName == "homelab-1") [ pkgs.nixfmt ])
    ]
  );
}
