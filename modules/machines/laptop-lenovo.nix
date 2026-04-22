{ inputs, self, ... }: {
  flake.nixosConfigurations.lenovo-laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.lenovoLaptopConfig
      self.nixosModules
    ];
  };
  #flake.nixosModules.lenovo-laptop = {pkgs, ... }: {
  #  boot.loader.grub.enable = true;
#
  #  environment.systemPackages = [
#
  #  ];
  #}; 
}