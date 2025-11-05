{pkgs, lib, config, ... } : {
  
  imports = [
    ./bluetooth.nix
    ./nvidia-gpu.nix
    ./drawing-tablet.nix
  ];

  
    
      bluetooth.enable = 
        lib.mkDefault true;

      nvidia-gpu.enable = 
        lib.mkDefault false;

      drawing-tablet.enable = 
        lib.mkDefault false;
    

}