{pkgs, inputs, ...} : {
      environment.systemPackages = with pkgs; [cmake];

  programs.git = {
      enable = true;
      extraConfig = {
        user.name = "Tonez3D";
        user.email = "tonez3d@gmail.com";
        safe.directory = [ "/etc/nixos" ];
        init.defaultBranch = "main";
      };
    };
}