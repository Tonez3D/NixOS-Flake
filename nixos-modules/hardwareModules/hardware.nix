{pkgs, lib, ... } : {
  
  imports = [
    ./bluetooth.nix
  ];

  bluetooth.enable = 
    lib.mkDefault true;

}