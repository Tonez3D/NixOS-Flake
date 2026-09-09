{pkgs, ...} : {

  virtualisation.virtualbox.enable = true;
  virtualisation.virtualbox.host.package = pkgs.virtualbox;
}

