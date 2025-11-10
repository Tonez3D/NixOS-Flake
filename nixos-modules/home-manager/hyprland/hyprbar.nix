{ ... } : 

{
  wayland.windowManager.hyprland = {
    settings = {

      plugin.hyprbars = {
        enable = true;
        bar_height = 14;
        bar_padding = 1;
        #bar_color = "rbg(ffffff)";
        #title_color = "rbg(feefff)";
        bar_text_size = 10;
        #hyperbars-button = "rgb(ff4040), 10, U+32D2, hyrpctl dispatch fullscrren 1";
      };
      
    };

    extraConfig = ''
      exec-once = hyprbar
    '';

  };
}
