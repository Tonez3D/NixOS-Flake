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

    home.stateVersion = "25.11"; # Please read the comment before changing.

    nixpkgs.config.allowUnfree = true;

    home.sessionVariables = {
      # EDITOR = "emacs";
    };
  };
}
