{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../nixos-modules/home-packages/home-lab-pkgs.nix

  ];

  config = {

    home.stateVersion = "26.05"; 

    nixpkgs.config.allowUnfree = true;

    home.sessionVariables = {
      # EDITOR = "emacs";
    };
  };
}
