{ inputs, self, ... }: {

  systems = [
    "x86_64-linux"
  ];

  flake.nixosConfigurations.lenovo-laptop = inputs.nixpkgs.lib.nixosSystem {
    
    #imports = [
    #  "../../../hardware-configuration.nix"
    #];

    modules = [
      self.nixosModules.lenovoLaptopConfig
      ../../../hardware-configuration.nix
    
    self.nixosModules.zerotierOne

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