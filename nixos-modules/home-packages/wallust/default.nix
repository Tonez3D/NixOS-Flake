{ pkgs, ... }:
let
  kitty-colors = import ./kitty-template.nix;
  waybar-colors = import ./waybar-template.nix;
  rofi-colors = import ./rofi-template.nix;
  starship-colors = import ./starship-template.nix;
  config-toml = import ./config.nix;
in {

  home.packages = with pkgs; [ wallust ];

  home.file = {
    ".config/wallust/templates/colors-kitty.conf".text = "${kitty-colors}";
    ".config/wallust/templates/colors-waybar.css".text = "${waybar-colors}";
    ".config/wallust/templates/colors-rofi.css".text = "${rofi-colors}";
    ".config/wallust/templates/colors-starship.css".text = "${starship-colors}";
    ".config/wallust/wallust.toml".text = "${config-toml}";
  };

}
