{
  pkgs,
  lib,
  inputs,
  hostName,
  config,
  ...
}:
let
  key-prefix =
    if (hostName == "nixos") then
      "github"
    else if (hostName == "lenovo-laptop") then
      "laptop-github"
    else
      (toString hostName);
  uname = config.home.username;
  github-key = "/home/${uname}/.ssh/${key-prefix}-ssh";
in
{

  home.packages = with pkgs; [ git ];

  programs.git = {
    enable = true;
    settings = {

      user.name =
        if (hostName == "homelab" || hostName == "error") then "Ifeatu Dunu - Homelab" else "Ifeatu Dunu";
      user.email = "tonez3d@gmail.com";
      safe.directory = [ "/etc/nixos" ];
      init.defaultBranch = "main";
      core.sshCommand = "ssh -i ${github-key} -o IdentitiesOnly=yes";

    };

  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."github.com" = {
      IdentityFile = github-key;
      IdentitiesOnly = true;
    };
  };
}

#option for gitu gitlfs ?
