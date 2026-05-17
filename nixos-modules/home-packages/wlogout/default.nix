{ ... }: {
  imports = [ ./style.nix ];
  programs.wlogout = {
    enable = true;
    layout = [{
      label = "logout";
      aciton = "hyprctl dispatch exit 0";
      text = "Exit";
      #keybind = "";
    }];
  };
}
