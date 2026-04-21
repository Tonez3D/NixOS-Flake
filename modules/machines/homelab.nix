{inputs, ...}: { 
  flake = {
    nixosConfigurations.homelab = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
      ];
    };
  };
}