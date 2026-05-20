{pkgs, ... } : {
   environment.systemPackages = [
    pkgs.forgejo
    pkgs.forgejo-cli
  ];
  services.forgejo.enable = true;
}

#fj pr create --title "My Feature" --body "Description of changes"