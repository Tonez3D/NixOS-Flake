# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:
let 
    hostName = config.networking.hostName;
    
  in 
{

  imports = [
    ./hardware-configuration.nix
    ../nixos-modules/packages/home-lab-pkgs.nix
    ../nixos-modules/kernel/kernel-version.nix
        ../nixos-modules/networking
        ../users
    ../nixos-modules/shares/share.nix
    ./disko.nix
    # ../nixos-modules/kernel/patches/dirty-flag.nix

  ];
  _module.args = {inherit hostName;};


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "error"; 
  # Enable networking
  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    #settings = { };
  };
  
 
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.error = {
    isNormalUser = true;
    description = "error";

    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "hermit"
      "usb"
      "plugdev"
      "docker"
      "dialout"
    ];

    openssh = {
      authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINfi4u0rZj7jdFMOkGmGbwFJXOH/kErjMa1US5YywkuY tonez3d@gmail.com"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFABx8yt6E4tlqX0/vGELPKcuooKUwfPC7E4xhKroYZm tonez3d@gmail.com"
      ];
    };
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    trusted-users = [ "error" ];
  };

  ### SECTION [Home Manager] ###
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      hostName = config.networking.hostName;
    };
    users = {
      "error" = import ./home.nix;
    };
    sharedModules = [ ];

  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05"; # Did you read the comment?

}
