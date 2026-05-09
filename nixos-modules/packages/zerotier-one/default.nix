{ pkgs, inputs, ... }:
{
     environment.systemPackages = with pkgs; [zerotierone];
services.zerotierone = {
  enable = true;
};
}