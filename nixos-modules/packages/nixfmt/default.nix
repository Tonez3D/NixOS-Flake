{
  pkgs,
  lib,
  config,
  ...
}:
{

  environment.systemPackages =  [ pkgs.nixfmt ];
}
