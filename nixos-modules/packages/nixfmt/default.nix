{
  pkgs,
  lib,
  config,
  pkgs-25-11,
  ...
}:
{

  environment.systemPackages = (
    lib.mkMerge [
      (lib.mkIf (config.networking.hostName == "lenovo-laptop") [ pkgs-25-11.nixfmt ])
      (lib.mkIf (config.networking.hostName == "nixos") [ pkgs-25-11.nixfmt ])
      (lib.mkIf (config.networking.hostName == "homelab-1") [ pkgs.nixfmt ])
    ]
  );
}
