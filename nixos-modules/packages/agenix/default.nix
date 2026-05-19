{ config, pkgs, lib, inputs, ... }: {
  environment.systemPackages = [
    inputs.agenix.packages."${pkgs.system}".default
    pkgs.agenix-cli
    pkgs.age
  ];
}
