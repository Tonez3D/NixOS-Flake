{ hostName, lib, ... }: {

  programs.bash = (lib.mkMerge [
    (lib.mkIf (hostName == "nixos") {
      enable = true;
      bashrcExtra = ''
        eval "$(ssh-agent -s)" > /dev/null 2>&1
        ssh-add ~/.ssh/github-ssh > /dev/null 2>&1
        kitty set-colors -a ~/.config/kitty/themes/wall-colors.conf
        fastfetch --logo-type kitty-direct 
        eval "$(starship init bash)"
      '';
    })
    (lib.mkIf (hostName == "lenovo-laptop") {
      enable = true;
      bashrcExtra = ''
        eval "$(ssh-agent -s)" > /dev/null 2>&1
        ssh-add ~/.ssh/laptop-github-ssh > /dev/null 2>&1
        fastfetch --logo-type kitty-direct 
        eval "$(starship init bash)"
      '';
    })
  ]);

}
