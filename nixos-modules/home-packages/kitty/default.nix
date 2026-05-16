{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [ kitty ];
  programs.kitty = {
    enable = true;
    settings = {
      neofetch = "fastfetch";
      incude = "current-theme.conf";
      dynamic_background_opacity = true;
      background_opacity = "0.7";
      background_blur = 1;
    };
  };
}
