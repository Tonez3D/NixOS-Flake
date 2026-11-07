{
  description = "Nixos config flake";

  nixConfig = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    briefing-site = {
      url = "git+ssh://git@github.com/Tonez3D/Briefing";
      flake = false;
    };

    private-flake = {
      #url = "git+file:///home/heifee/private-flake";
      url = "git+ssh://git@github.com/Tonez3D/private-flake.git?ref=main";
      flake = false;
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #sops-nix = {
    #  url = "github:Mic92/sops-nix";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    config-install = {
      url = "git+ssh://git@github.com/Tonez3D/nix-system-install.git?ref=main";
    };

    cuttlefish = {
      #url = "git+file:///home/heifee/Dev/cuttlefish";
      url = "git+ssh://git@github.com/Tonez3D/cuttlefish-flake.git?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";

    };

  };

  outputs =
    {
      self,
      nixpkgs,
      sops-nix,
      cuttlefish,
      briefing-site,
      agenix,
      private-flake,
      disko,
      config-install,
      zen-browser,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      cluster-details = import "${inputs.private-flake}/cluster-details.nix";

      crossPkgs = pkgs.pkgsCross.aarch64-multiplatform;

      #Disable the tests
      imageioOverlay = final: prev: {
        python313 = prev.python313.override {
          packageOverrides = pyfinal: pyprev: {
            imageio = pyprev.imageio.overridePythonAttrs (_: {
              doCheck = false;
            });
          };
        };
      };

      # Expose nixpkgs-unstable as `pkgs.unstable`, and take the packages we
      # want to track upstream straight from it.
      unstableOverlay = final: prev: {
        unstable = import inputs.nixpkgs-unstable {
          inherit (prev.stdenv.hostPlatform) system;
          config.allowUnfree = true;
        };

        inherit (final.unstable) claude-code;
      };

      overlayModule =
        { config, lib, ... }:
        {
          home-manager.sharedModules = lib.optionals (!config.home-manager.useGlobalPkgs) [
            {
              nixpkgs.overlays = [
                imageioOverlay
                unstableOverlay
              ];
            }
          ];
        };
    in
    {

      formatter.x86_64-linux = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      #formatter.aarch64-linux = crossPkgs.nixfmt-tree;

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cluster-details briefing-site; };

        modules = [
          cuttlefish.nixosModules.default
          ./desktop/configuration.nix
          inputs.home-manager.nixosModules.default
          agenix.nixosModules.default
          overlayModule
        ];
      };

      nixosConfigurations.lenovo-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cluster-details briefing-site; };

        modules = [
          cuttlefish.nixosModules.default
          ./lenovo-laptop/configuration.nix
          inputs.home-manager.nixosModules.default
          agenix.nixosModules.default
          overlayModule
        ];
      };

      nixosConfigurations.homelab = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cluster-details briefing-site; };

        modules = [
          cuttlefish.nixosModules.default
          ./home-lab/configuration.nix
          inputs.home-manager.nixosModules.default
          disko.nixosModules.disko
          agenix.nixosModules.default
          overlayModule
        ];
      };

      #packages.x86_64-linux = inputs.config-install.lib.iso-installer self.nixosConfigurations ["homelab"];
      nixosConfigurations.error = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cluster-details briefing-site; };

        modules = [
          ./error/configuration.nix
          cuttlefish.nixosModules.default
          inputs.home-manager.nixosModules.default
          disko.nixosModules.disko
          agenix.nixosModules.default
        ];
      };

      packages.x86_64-linux = inputs.config-install.lib.iso-installer self.nixosConfigurations [
        "error"
      ];
    };
}
