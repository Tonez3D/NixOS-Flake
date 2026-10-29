{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    ../nixos-modules/packages/lenovo-laptop-pkgs.nix
    ../nixos-modules/networking
    #../nixos-modules/services-modules/munin-auto-start.nix
    ./hardware-configuration.nix
    ../nixos-modules/shares/share.nix
    ../nixos-modules/hardware-modules
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

  
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # List by default
      zlib
      zstd
      stdenv.cc.cc
      curl
      openssl
      attr
      libssh
      bzip2
      libxml2
      acl
      libsodium
      util-linux
      xz
      systemd


      # My own additions
      libXcomposite
      libXtst
      libXrandr
      libXext
      libX11
      libXfixes
      libGL
      libva
      pipewire
      libxcb
      libXdamage
      libxshmfence
      libXxf86vm
      libelf


      # Required
      glib
      gtk2


      # Inspired by steam
      # https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/st/steam/package.nix#L36-L85
      networkmanager
      vulkan-loader
      libgbm
      libdrm
      libxcrypt
      coreutils
      pciutils
      zenity
      # glibc_multi.bin # Seems to cause issue in ARM


      # # Without these it silently fails
      libXinerama
      libXcursor
      libXrender
      libXScrnSaver
      libXi
      libSM
      libICE
      gnome2.GConf
      nspr
      nss
      cups
      libcap
      SDL2
      libusb1
      dbus-glib
      ffmpeg
      # Only libraries are needed from those two
      libudev0-shim


      # needed to run unity
      gtk3
      icu
      libnotify
      gsettings-desktop-schemas
      # https://github.com/NixOS/nixpkgs/issues/72282
      # https://github.com/NixOS/nixpkgs/blob/2e87260fafdd3d18aa1719246fd704b35e55b0f2/pkgs/applications/misc/joplin-desktop/default.nix#L16
      # log in /home/leo/.config/unity3d/Editor.log
      # it will segfault when opening files if you don’t do:
      # export XDG_DATA_DIRS=/nix/store/0nfsywbk0qml4faa7sk3sdfmbd85b7ra-gsettings-desktop-schemas-43.0/share/gsettings-schemas/gsettings-desktop-schemas-43.0:/nix/store/rkscn1raa3x850zq7jp9q3j5ghcf6zi2-gtk+3-3.24.35/share/gsettings-schemas/gtk+3-3.24.35/:$XDG_DATA_DIRS
      # other issue: (Unity:377230): GLib-GIO-CRITICAL **: 21:09:04.706: g_dbus_proxy_call_sync_internal: assertion 'G_IS_DBUS_PROXY (proxy)' failed


      # Verified games requirements
      libXt
      libXmu
      libogg
      libvorbis
      SDL
      SDL2_image
      glew_1_10
      libidn
      tbb


      # Other things from runtime
      flac
      freeglut
      libjpeg
      libpng
      libpng12
      libsamplerate
      libmikmod
      libtheora
      libtiff
      pixman
      speex
      SDL_image
      SDL_ttf
      SDL_mixer
      SDL2_ttf
      SDL2_mixer
      libappindicator-gtk2
      libdbusmenu-gtk2
      libindicator-gtk2
      libcaca
      libcanberra
      libgcrypt
      libvpx
      librsvg
      libXft
      libvdpau
      # ...
      # Some more libraries that I needed to run programs
      pango
      cairo
      atk
      gdk-pixbuf
      fontconfig
      freetype
      dbus
      alsa-lib
      expat
      # for blender
      libxkbcommon


      libxcrypt-legacy # For natron
      libGLU # For natron


      # Appimages need fuse, e.g. https://musescore.org/fr/download/musescore-x86_64.AppImage
      fuse
      e2fsprogs


      # darktable nightly AppImage https://github.com/darktable-org/darktable/releases
      gmp


      # RapidRaw
      harfbuzz
      libgpg-error
      # https://github.com/xournalpp/xournalpp/releases/download/v1.2.4/xournalpp-1.2.4-x86_64.AppImage
      fribidi
      librsvg
      # https://github.com/nix-community/nix-ld/issues/95#issuecomment-3041993870
      (runCommand "librsvg" {} ''
        mkdir -p $out/lib/gdk-pixbuf-2.0/2.10.0/loaders
        ln -s "${librsvg}/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader_svg.so" "$out/lib/libpixbufloader-svg.so"
      '')


      # pdfmastereditor
      sane-backends
      pkcs11helper


      # Qt6 requires this (e.g. used in zxlive)
      libpulseaudio
      krb5
      libxcb-cursor
      xcbutilwm
      xcbutil
      xcbutilimage
      xcbutilkeysyms
      xcbutilrenderutil
    ];
  };

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


  nix.buildMachines = [{
    hostName = "100.118.87.0";
    system = "x86_64-linux";
    sshKey = "/root/.ssh/laptop-key";
    protocol = "ssh-ng";
    maxJobs = 2;
    speedFactor = 2;
    supportedFeatures = [ "big-parallel" "kvm" ];
    mandatoryFeatures = [ ];
  }];

  nix.distributedBuilds = true;

  #programs.brightnessctl.enable = true;
  hardware.acpilight.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).

  users.users = {
    
    ifeatud = {
    isNormalUser = true;
    description = "Ifeatu Dunu";
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
  };

    watts = {
      isNormalUser = true;
      description = "Work User";
      extraGroups = [
        "networkmanager"
        "wheel"
        "usb"
        "plugdev"
        "video"
        "dialout"
      ];
    };
  };

  ### SECTION [Home Manager] ###
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";

    extraSpecialArgs = {
      inherit inputs;
      hostName = config.networking.hostName;
    };

    users = {
      "ifeatud" =  { pkgs, ... }: {
        imports = [ ./home.nix ];
      };
      "watts" = { pkgs, ... }: {
        imports = [ ./home.nix ];
      };
    };

    
    sharedModules = [ ];
  };

  
  
  #services.greetd = {
  #  enable = true;
  #  settings = {
  #    default_session = {
  #      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd start-hyprland";
  #      user = "greeter";
  #    };
  #  };
  #};

  services.gnome.gnome-keyring.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  hardware.graphics.enable = true;

  xdg.portal = let hypr = [ inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland ]; in  {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-termfilechooser xdg-desktop-portal-gtk ] ++ hypr;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
'';


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

 }
