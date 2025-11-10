{pkgs, lib, config, ...} : 

{
  
  options = {

    nvidia-gpu.enable = 
      lib.mkEnableOption "enabless nvidia gpu support";

  };

  config = lib.mkIf config.nvidia-gpu.enable {

    # Nvidia Driver's T-T
    hardware.graphics.enable = true;

    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      modesetting.enable = true;

      powerManagement.enable = true;

      powerManagement.finegrained = false;

      open = true;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

  };
}