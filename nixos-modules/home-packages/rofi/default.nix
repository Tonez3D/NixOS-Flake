{
  pkgs,
  config,
  programs,
  inputs,
  ...
}:

{

  home.packages = with pkgs; [ rofi-wayland ];
  programs.rofi =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {
      enable = true;

      cycle = true;

      modes = [
        "combi"
        "filebrowser"
        "keys"
      ];
      # Install the wayland variant of rofi
      package = pkgs.rofi-wayland;
      # Set terminal to kitty
      terminal = "${pkgs.kitty}/bin/kitty";
      location = "center";
      extraConfig = {
        show-icons = true;
        drun-display-format = "{icon} {name}";
        disable-history = false;
        hide-scrollbar = true;
        display-drun = "Apps";
      };

      theme = ./theme.rafi;
    };
}
