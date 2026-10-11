{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
{
  imports = [./idea-ultimate.nix];

  home.packages = with pkgs; [jetbrains-toolbox ];
}
