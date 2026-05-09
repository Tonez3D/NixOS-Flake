{pkgs, lib, inputs, config, ...} : {
      config.home.packages = with pkgs; [git];

config.programs.git = {
      enable = true;
      extraConfig = {
        user.name = "Tonez3D";
        user.email = "tonez3d@gmail.com";
        safe.directory = [ "/etc/nixos" ];
        init.defaultBranch = "main";
      };
    };
}
