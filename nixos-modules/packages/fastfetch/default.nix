
{pkgs, config, ... }: {
      
      config.home.packages = with pkgs; [fastfetch];



  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "/etc/nixos/assets/icons/Nix_Flake_ascii.txt";
                  
        #padding = {
        #  right = 1;
        #};
        #type = "none";
      };
      display = {
        color = "cyan";
        separator = " ";
      };
      modules = [
        {
          type = "os";
          key = "╭─ OS───────╮";
        }
        {
          type = "wm";
          key = "│  WM       │";
        }
        {
          type = "host";
          key = "│  Hostname │";
        }
        {
          type = "packages";
          key = "│ 󰏖 Packages │";
        }
        {
          type = "uptime";
          key = "╰─󰅐 Uptime───╯";
        }
        {
          type = "cpu";
          key = "╭─ CPU──────╮";
          format = "{1}";
        }
        {
          type = "gpu";
          key = "│ 󰢮 GPU      │";
          format = "{2}";
        }
        {
          type = "disk";
          key = "│ 󰥠 Disk     │";
        }
        {
          type = "memory";
          key = "╰─ Memory───╯";
        }
        {
          type = "colors";
          #key = "";
          format = " ";
        }
      ];
    };
  };

}
