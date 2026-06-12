{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
{
  home.packages = with pkgs; [ jetbrains.rust-rover ];
}
