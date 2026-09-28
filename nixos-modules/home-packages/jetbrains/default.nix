{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
{

 # imports = [
 #   ./clion.nix
 #   ./rust-rover.nix
 # ];

  home.packages = with pkgs; [ proton-vpn
  jetbrains-toolbox ];
}
