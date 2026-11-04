{} : {
  systems = [
    { nixosConfig = {
      machineName = "" ;
      clusters = {
        cuttlefish.enable = true;

      };
      rice = {
        hyprland = {
          enable = true;
        };
      };
      } 
    };
  ]
}