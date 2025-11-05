{pkgs, lib, config, ... } : 
{

  options = {
    drawing-tablet = {
      enable = 
        lib.mkEnableOption "t";
      # More options to be added
    };
  };

  config = lib.mkIf config.drawing-tablet.enable {
    
  };

}