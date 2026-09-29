{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  imports = [
    ../nixos-modules/home-packages/nixos-pkgs.nix
  ];

  config = {

    home.stateVersion = "25.05"; # Please read the the Home Manager release notes before changing.

    nixpkgs.config.allowUnfree = true;

    home.sessionVariables = {
      # EDITOR = "emacs";
    };
  };
}
