{ ... } :

{


  wayland.windowManager.hyprland.settings = {
    exec-once = "waybar"; #&& hyprbar";
  };

  programs.waybar = {
    enable = true; 
    # settings = [{
    #   layer = "top";
    #   position = "left";
    #   mod = "dock";
    #   exclusive = true;
    #   passtrough = false;
    #   gtk-layer-shell = true;
      
    #   width = 2;
    #   modules-left = [
        
    #     "custom/divider"
        
    #     "custom/divider"
    #     "cpu"
    #     "custom/divider"
    #     "memory"
    #   ];
    #   modules-center = [ "hyprland/window" ];
    #   modules-right = [
    #     "tray"
    #     "network"
    #     "custom/divider"
        
    #     "custom/divider"
    #     "pulseaudio"
    #     "custom/divider"
        
    #     "custom/divider"
    #     "clock"
    #   ];
    #   "hyprland/window" = { format = "{}"; };
      
    #   cpu = {
    #     interval = 10;
    #     format = "󰻠 {}%";
    #     max-length = 10;
    #     on-click = "";
    #   };
    #   memory = {
    #     interval = 30;
    #     format = "  {}%";
    #     format-alt = " {used:0.1f}G";
    #     max-length = 10;
    #   };


    #   tray = {
    #     icon-size = 13;
    #     tooltip = false;
    #     spacing = 10;
    #   };
    #   network = {
    #     format = "󰖩 {essid}";
    #     format-disconnected = "󰖪 disconnected";
    #   };
    #   clock = {
    #     format = " {:%I:%M %p   %m/%d} ";
    #     tooltip-format = ''
    #       <big>{:%Y %B}</big>
    #       <tt><small>{calendar}</small></tt>'';
    #   };
    #   pulseaudio = {
    #     format = "{icon} {volume}%";
    #     tooltip = false;
    #     format-muted = " Muted";
    #     on-click = "pamixer -t";
    #     on-scroll-up = "pamixer -i 5";
    #     on-scroll-down = "pamixer -d 5";
    #     scroll-step = 5;
    #     format-icons = {
    #       headphone = "";
    #       hands-free = "";
    #       headset = "";
    #       phone = "";
    #       portable = "";
    #       car = "";
    #       default = [ "" "" "" ];
    #     };
    #   };
    #   "pulseaudio#microphone" = {
    #     format = "{format_source}";
    #     tooltip = false;
    #     format-source = " {volume}%";
    #     format-source-muted = " Muted";
    #     on-click = "pamixer --default-source -t";
    #     on-scroll-up = "pamixer --default-source -i 5";
    #     on-scroll-down = "pamixer --default-source -d 5";
    #     scroll-step = 5;
    #   };
    #   "custom/divider" = {
    #     format = " | ";
    #     interval = "once";
    #     tooltip = false;
    #   };
    #   "custom/endright" = {
    #     format = "_";
    #     interval = "once";
    #     tooltip = false;
    #   };
    # }]; 
     
    settings = let 
      modconfig = import ./modules.nix;
      conf = {layer = "top";
        position = "left";
        width = 50;
        spacing = 7;
        #margin-left = 0;
        #margin-right = 2;

        modules-left = [
          "custom/search"
          
          #"custom/lock"
          #"battery"
        ];

        modules-center = ["hyprland/workspaces"];

        modules-right = ["pulseaudio" "network" "clock" "power"];
        };
    in {
      mainBar = conf // modconfig;
    };


    style = import ./style.nix;
  };
}