{
  description = "Nixos config flake";

  nixConfig = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
      "https://cache.nixos-cuda.org"
      "https://hyprland.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    private-flake = {

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
      url = "git+file:///home/heifee/Dev/config-install";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      sops-nix,
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
      # systemInstaller = target: nixpkgs.lib.nixosSystem {
      # inherit system;
      # specialArgs = { inherit target; };
      # modules = [ ./installer.nix ];
      #};

      crossPkgs = pkgs.pkgsCross.aarch64-multiplatform;
    in
    {

      formatter.x86_64-linux = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      #formatter.aarch64-linux = crossPkgs.nixfmt-tree;

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cluster-details; };

        modules = [
          ./desktop/configuration.nix
          inputs.home-manager.nixosModules.default
          agenix.nixosModules.default
        ];
      };

      nixosConfigurations.lenovo-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cluster-details; };

        modules = [
          ./lenovo-laptop/configuration.nix
          inputs.home-manager.nixosModules.default
          agenix.nixosModules.default
        ];
      };

      nixosConfigurations.homelab-1 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cluster-details; };

        modules = [
          ./home-lab/configuration.nix
          inputs.home-manager.nixosModules.default
          disko.nixosModules.disko
          agenix.nixosModules.default
        ];
      };

      packages.x86_64-linux = inputs.config-install.lib.iso-installer self.nixosConfigurations [
        "homelab-1"
      ];
    };
}
