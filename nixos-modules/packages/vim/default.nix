{ pkgs,config,lib, inputs, ... }:
{
    environment.systemPackages = with pkgs; [vim];
	programs.vim = {
	enable = true;
};

}
