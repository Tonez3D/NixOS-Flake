{ config, lib, pkgs, ... }:
{
  flake.nixosModules.laptopLenovoConfig = {



    home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      hostName = config.networking.hostName;
    };
    users = { "ifeatud" = config = {

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "25.05"; # Please read the comment before changing.

    nixpkgs.config.allowUnfree = true;

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = with pkgs;
      import ../packages/home-packages.nix { inherit pkgs; };

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };

    wayland.windowManager.hyprland.enable = true; # enable Hyprland
    wayland.windowManager.hyprland.xwayland.enable = true;

    programs.kitty = {
      enable = true;
      settings = { 
        neofetch = "fastfetch"; 
        dynamic_background_opacity = true;
        background_opacity = "0.7";
        background_blur = 1;
        };
    };

    programs.git = {
      enable = true;
      extraConfig = {
        user.name = "Tonez3D";
        user.email = "tonez3d@gmail.com";
        safe.directory = [ "/etc/nixos" ];
        init.defaultBranch = "main";
      };
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/root/etc/profile.d/hm-session-vars.sh
    #
    home.sessionVariables = {
      # EDITOR = "emacs";
    };

    # Let Home Manager install and manage itself.
    # programs.home-manager.enable = true;

  };
  };
   };
    sharedModules = [];

  };
    
}