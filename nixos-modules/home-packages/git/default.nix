{pkgs, lib, inputs, config, ...} : {
      home.packages = with pkgs; [git];

programs.git = {
      enable = true;
      extraConfig = {
        user.name = "Tonez3D-Homelab";
        user.email = "tonez3d@gmail.com";
        safe.directory = [ "/etc/nixos" ];
        init.defaultBranch = "main";
      };
    };
}
