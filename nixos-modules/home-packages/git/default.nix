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
          (lib.mkIf (hostName == "nixos") "Ifeatu Dunu")
          (lib.mkIf (hostName == "lenovo-laptop") "Ifeatu Dunu")
          (lib.mkIf (hostName == "homelab") "Ifeatu Dunu-Homelab")
        ]
      );
      user.email = "tonez3d@gmail.com";
      safe.directory = [ "/etc/nixos" ];
      init.defaultBranch = "main";
    };
  };
}

#option for gitu gitlfs ?
