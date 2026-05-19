{ pkgs, inputs, lib, config, ... }: {

  options = {
    custom-spotify.enable =
      lib.mkEnableOption "enables bluetooth device support using blueman";
  };

  config.home.packages = [ pkgs.spotify ]
    ++ lib.optional config.custom-spotify.enable [ pkgs.spicetify-cli ];

}
