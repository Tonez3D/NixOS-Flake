{pkgs, ... } : {
   environment.systemPackages = [
    pkgs.forgejo
    pkgs.forgejo-cli
  ];
  services.forgejo.enable = true;
}