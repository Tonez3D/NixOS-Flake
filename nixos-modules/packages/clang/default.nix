{ pkgs, inputs, ... }:
{
    environment.systemPackages = with pkgs; [clang];

}