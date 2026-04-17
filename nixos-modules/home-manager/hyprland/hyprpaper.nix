{ ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      wallpaper = [{
        monitor = "";
        path = "/../../../assets/54xhll4sbo.jpg";
      }];
    };
  };
}
