# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../nixos-modules/packages/lenovo-laptop-pkgs.nix
    ../nixos-modules/networking
    #../nixos-modules/services-modules/munin-auto-start.nix
    ./hardware-configuration.nix
    ./share.nix
    ../nixos-modules/hardware-modules
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.default
    ../nixos-modules/fonts
    ../nixos-modules/udev
    ../nixos-modules/kernel/kernel-version.nix
    ../users
  ];

  ### SECTION [Bootloader] ###
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ### SECTION [Nix Settings] ###
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [ "ifeatud" ];

    # substituters = [
    #   "https://cache.nixos.org"
    # ];

  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  zramSwap.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = false;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  ### SECTION [Networking] ###
  networking.hostName = "lenovo-laptop"; # Define your hostname.
  # Enable networking
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  ### SECTION [Hardware] ###
  bluetooth.enable = true;
  drawing-tablet.enable = false;
  nvidia-gpu.enable = false;

  ### SECTION [Locale Settings] ###

  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  programs.nix-ld.enable = true;

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

  #networking.firewall.trustedInterfaces = [ "ztfl6pg5zr" ];
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  services.desktopManager.gnome.enable = true;

  services.displayManager.defaultSession = "hyprland";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

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

  #programs.light.enable = true;
  #programs.brightnessctl.enable = true;
  hardware.acpilight.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ifeatud = {
    isNormalUser = true;
    description = "Ifeatu Dunu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "hermit"
      "dialout"
    ];
  };

  ### SECTION [Home Manager] ###
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      hostName = config.networking.hostName;
    };
    users = {
      "ifeatud" = import ./home.nix;
    };
    sharedModules = [ ];
  };

  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  services.getty = {
    autologinUser = "ifeatud";
  };
  environment.loginShellInit = ''
    Hyprland
  '';
  #services.greetd = {
  #  enable = true;
  #  settings = {
  #    initial_session = {
  #      command = "${pkgs.hyprland}/bin/Hyprland";
  #      user = "ifeatud";
  #    };
  #  };
  #};

  #services.xserver.displayManager.lightdm.enable = true;
  services.gnome.gnome-keyring.enable = true;
  #services.gnome.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  hardware.graphics.enable = true;

  systemd.services.munin-auto-start.enable = false;

  xdg.portal = {
    enable = true;
    #extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
