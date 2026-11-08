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
    ./samba.nix
    # ./disko.nix
    # ../nixos-modules/kernel/patches/dirty-flag.nix
  ];
  _module.args = { inherit hostName; };

  #networking.firewall.trustedInterfaces = [ "ztfl6pg5zr" ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "homelab"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  programs.ssh = {
    knownHosts = {
      "github.com" = {
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
        hostNames = [ "github.com" ];
      };
      "personal" = {
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMAGsoEN/KRWCxv3bJAdGgHxfQep0nnIfcEE54OIsD0y hiefee";
        hostNames = [
          "lenovo-laptop"
          "nixos"
          "error"
          "homelab"
        ];
      };
    };
    startAgent = true;
  };
  services.gnome.gcr-ssh-agent.enable = false;

  services.openssh = {
    enable = true;
  };
  users.users."homelab".openssh = {
    authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINfi4u0rZj7jdFMOkGmGbwFJXOH/kErjMa1US5YywkuY tonez3d@gmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFABx8yt6E4tlqX0/vGELPKcuooKUwfPC7E4xhKroYZm tonez3d@gmail.com"
    ];
  };
  # Set your time zone.
  time.timeZone = "America/Chicago";
  nix.buildMachines = [
    {
      hostName = "100.118.87.0";
      system = "x86_64-linux";
      protocol = "ssh-ng";
      maxJobs = 2;
      speedFactor = 2;
      supportedFeatures = [
        "big-parallel"
        "kvm"
      ];
      mandatoryFeatures = [ ];
    }
  ];

  nix.distributedBuilds = true;
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.homelab = {
    isNormalUser = true;
    description = "homelab";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [ ];
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [ "homelab" ];

    # substituters = [
    #   "https://cache.nixos.org"
    # ];

  };

  ### SECTION [Home Manager] ###
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      hostName = hostName;
    };
    users = {
      "homelab" = import ./home.nix;
    };
    sharedModules = [ ];

  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #  environment.systemPackages = with pkgs; [
  #neovim
  #git
  #zerotierone
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #    wget
  #  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
