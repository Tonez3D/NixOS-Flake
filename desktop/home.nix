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
    #./wallust/defualt.nix
    #./fastfetch/default.nix
    #./hyprland/default.nix
    #./wlogout/config.nix
    #../packages/rofi.nix
  ];

  config = {

    home.stateVersion = "25.05"; # Please read the the Home Manager release notes before changing.

    nixpkgs.config.allowUnfree = true;

    # The home.packages option allows you to install Nix packages into your
    # environment.
    #home.packages = with pkgs; import [../packages/home-packages.nix] { inherit pkgs; };

    home.sessionVariables = {
      # EDITOR = "emacs";
    };

    # Let Home Manager install and manage itself.
    # programs.home-manager.enable = true;
  };
}
