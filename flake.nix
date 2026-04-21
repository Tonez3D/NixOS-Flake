{
  description = "Nixos config flake for my computers";

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

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      #      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    #awww = { url = "git+https://codeberg.org/LGFae/awww"; };

    #matugen = { url = "github:InioX/Matugen?ref=refs/tags/v3.1.0"; };

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

  outputs = inputs@{flake-parts, self, nixpkgs, sops-nix, ... }: flake-parts.lib.mkFlake {inherit inputs;} {


    imports = [];

    perSystem = { config, self', inputs', pkgs, system, ...} : {};

    flake = {

    };

    systems = [ "x86_64-linux" ];

    #let
    #  system = "x86_64-linux";
    #  pkgs = nixpkgs.legacyPackages.${system};
    #in {
    #formatter.x86_64-linux = nixpkgs.legacyPackages.${system}.nixfmt-tree;
    #nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    #  specialArgs = { inherit inputs; };
    #  modules = [
    #    ./desktop/configuration.nix
    #    inputs.home-manager.nixosModules.default
    #    sops-nix.nixosModules.sops
    #  ];
    #};
#
    #nixosConfigurations.lenovo-laptop = nixpkgs.lib.nixosSystem {
    #  specialArgs = { inherit inputs; };
    #  modules = [
    #    ./lenovo-laptop/configuration.nix
    #    inputs.home-manager.nixosModules.default
    #    #inputs.stylix.nixosModules.stylix
    #    #sops-nix.nixosModules.sops
    #  ];
    #};
    #  # TODO: Add Homelab flake
    #};
  };
}
