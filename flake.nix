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

        disko = {url = "github:nix-community/disko/latest";
     inputs.nixpkgs.follows = "nixpkgs"; };


    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
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
      unstable,
      agenix,
      zen-browser,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstable-pkgs  = unstable.legacyPackages.${system};
      crossPkgs = pkgs.pkgsCross.aarch64-multiplatform;
    in
    {

      formatter.x86_64-linux = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      formatter.aarch64-linux = crossPkgs.nixfmt-tree;

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
        ];
      };

      nixosConfigurations.homelab-1 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./home-lab/configuration.nix
          inputs.home-manager.nixosModules.default
          agenix.nixosModules.default
          sops-nix.nixosModules.sops
        ];
      };
    };
}
