{
  pkgs,
  lib,
  config,
  ...
}:
{
  boot.kernelPackages = pkgs.linuxPackages;
}
