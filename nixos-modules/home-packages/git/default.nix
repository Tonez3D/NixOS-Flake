{
  pkgs,
  lib,
  inputs,
  hostName,
  config,
  ...
}:
{
  home.packages = with pkgs; [ git ];

  programs.git = {
    enable = true;
    settings = {
      user.name = (
        lib.mkMerge [
          (lib.mkIf (hostName == "nixos") "Tonez3D")
          (lib.mkIf (hostName == "lenovo-laptop") "Tonez3D")
          (lib.mkIf (hostName == "homelab") "Tonez3D-Homelab")
        ]
      );
      user.email = "tonez3d@gmail.com";
      safe.directory = [ "/etc/nixos" ];
      init.defaultBranch = "main";
    };
  };
}

#option for gitu gitlfs ?
