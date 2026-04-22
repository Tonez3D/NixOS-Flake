{self, ...}: {
  flake.nixosModules.zerotierOne = {
    services.zerotierone = {
      enable = true;
    };

    environment.systemPackages  = with self.pkgs; [
      zerotierone
    ];

  };
}