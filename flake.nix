{
  description = "Nixos config flake";

  nixConfig = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
    ];
    
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

  };

  outputs = { self, nixpkgs, ... }@inputs: 
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        
        specialArgs = {inherit inputs;};
	 
	      modules = [
          ./desktop/configuration.nix
          inputs.home-manager.nixosModules.default
        ];

      };

		  nixosConfigurations.lenovo-nixos = nixpkgs.lib.nixosSystem { 

        specialArgs = {inherit inputs; };

        modules = [
          ./lenovo-laptop/configuration.nix
          inputs.home-manager.nixosModules.default
        ];

      };

    };
  

}
