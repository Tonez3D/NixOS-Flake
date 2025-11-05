{pkgs, lib, config, ...} : {
  
  options = {

    nvidia-gpu.enable = 
      lib.mkEnableOption "enabless nvidia gpu support";

  };

  config = lib.mkIf config.nvidia-gpu.enable {

    # Nvidia Driver's T-T
    hardware.graphics.enable = true;
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
    hardware.nvidia.open = true;

  };
}