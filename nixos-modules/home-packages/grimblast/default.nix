{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
{
  home.packages = with pkgs; [ grimblast ];
}
