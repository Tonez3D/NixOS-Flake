{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
{

  options = { 
    idea.enable = lib.mkEnableOption "Enable Idea Ultimate IDE" ;
  };

  config = lib.mkIf config.idea.enable { 
    home.packages = with pkgs; [ jetbrains.idea-ultimate ];
  };

}
