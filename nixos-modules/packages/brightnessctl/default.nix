{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [ brightnessctl ];

}
