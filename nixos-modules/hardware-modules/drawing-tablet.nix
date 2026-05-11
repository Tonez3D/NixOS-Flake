{ pkgs, lib, config, ... }:

{

  options = {
    drawing-tablet.enable = lib.mkEnableOption "t";

  };

  config = lib.mkIf config.drawing-tablet.enable {

  };

}
