{config, pkgs, ...} : {

  options = {
    hypr-land.enable;
    use-quick-shell.enable;
    waybar.enable;
    
  };

  config = lib.mkIf config.quick-shell.enable {

  };
}