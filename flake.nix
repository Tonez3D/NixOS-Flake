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

    nixpkgs-25-11.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-25-11 = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs-25-11";
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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      sops-nix,
      agenix,
      nixpkgs-25-11,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      formatter.x86_64-linux = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./desktop/configuration.nix
          inputs.home-manager.nixosModules.default
          sops-nix.nixosModules.sops
          agenix.nixosModules.default
        ];
      };

      nixosConfigurations.lenovo-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./lenovo-laptop/configuration.nix
          inputs.home-manager.nixosModules.default
          agenix.nixosModules.default
          sops-nix.nixosModules.sops
          {
            _module.args.pkgs-25-11 = import nixpkgs-25-11 {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          }
        ];
      };

      nixosConfigurations.homelab-1 = nixpkgs-25-11.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./home-lab/configuration.nix
          inputs.home-manager-25-11.nixosModules.default
          agenix.nixosModules.default
          sops-nix.nixosModules.sops
        ];
      };
    };
}
