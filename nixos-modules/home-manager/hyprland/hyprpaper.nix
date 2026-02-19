{ ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      # Preload the image(s)
      #preload = [
      #  "../../../assets/54xhll4sbo.jpg"
      #];

      # Set wallpaper(s) (monitor,path)
      wallpaper = [{
        monitor = "";
        path = "/../../../assets/54xhll4sbo.jpg";
      }];
    };
  };
}
