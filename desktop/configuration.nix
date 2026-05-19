# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../nixos-modules/hardware-modules
    ../nixos-modules/packages/nixos-pkgs.nix
    ../nixos-modules/fonts
    ../nixos-modules/kernel/kernel-version.nix
    # ../nixos-modules/kernel/patches/dirty-flag.nix
    inputs.home-manager.nixosModules.default
  ];

  programs.ssh.knownHosts = {
    "github.com" = {
      publicKey =
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      hostNames = [ "github.com" ];
    };
  };

  ### SECTION [Bootloader] ###

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users."heifee".openssh = {
    authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINfi4u0rZj7jdFMOkGmGbwFJXOH/kErjMa1US5YywkuY tonez3d@gmail.com"
    ];
  };

  ### SECTION [Nix Settings] ###
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "heifee" ];

  };
  nixpkgs.config.allowUnfree = true;

  ### SECTION [Networking] ###
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  programs.steam = {
    enable = true;
    gamescopeSession.enable = false;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  ### SECTION [Hardware] ###
  bluetooth.enable = true;
  drawing-tablet.enable = true;
  nvidia-gpu.enable = true;

  ### SECTION [Locale Settings] ###
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

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
  };
  ### SECTION [Services] ###
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable drivers?
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable blueman for managing bluetooth devices
  services.blueman.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  #  programs.direnv.enable = true;
  #programs.direnv.nix-direnv.enable = true;

  #services.xserver.displayManager.lightdm.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.heifee = {
    isNormalUser = true;
    description = "Ifeatu Dunu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs;
      [
        #kdePackages.kate
        #  thunderbird
      ];
  };

  ### SECTION [Home Manager] ###
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      hostName = config.networking.hostName;
    };
    users = { "heifee" = import ./home.nix; };
  };

  services.getty = { autologinUser = "heifee"; };
  environment.loginShellInit = ''
    Hyprland
  '';

  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  # Install firefox.
  programs.firefox.enable = true;

  xdg.portal = {
    enable = true;
    #extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

  systemd.tmpfiles.rules = [ "d /etc/nixos 0755 heifee nixos" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
