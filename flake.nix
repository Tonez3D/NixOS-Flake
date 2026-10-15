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

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    private-flake = {

      url = "git+ssh://git@github.com/Tonez3D/private-flake.git?ref=main";
      flake = false;
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
      private-flake,
      ...
    }@inputs:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      cluster-details = import "${inputs.private-flake}/cluster-details.nix";

    in
    {

      formatter.x86_64-linux = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cluster-details; };

        modules = [
          ./desktop/configuration.nix
          inputs.home-manager.nixosModules.default
          sops-nix.nixosModules.sops
          agenix.nixosModules.default
        ];
      };

      nixosConfigurations.lenovo-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cluster-details; };

        modules = [
          ./lenovo-laptop/configuration.nix
          inputs.home-manager.nixosModules.default
          agenix.nixosModules.default
          sops-nix.nixosModules.sops
        ];
      };

      nixosConfigurations.homelab-1 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs cluster-details; };

        modules = [
          ./home-lab/configuration.nix
          inputs.home-manager.nixosModules.default
          agenix.nixosModules.default
          sops-nix.nixosModules.sops
        ];
      };
    };
}
