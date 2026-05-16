{ pkgs, lib, config, ... }:

{
  options = {
    bluetooth.enable =
      lib.mkEnableOption "enables bluetooth device support using blueman";
  };

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
  };
}
