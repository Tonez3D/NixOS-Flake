{ hostName, lib, ... }: {

  programs.bash = (lib.mkMerge [
    (lib.mkIf (hostName == "nixos") {
      enable = true;
      bashrcExtra = ''
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/github-ssh > /dev/null
        eval "$(starship init bash)"
      '';
    })
    (lib.mkIf (hostName == "lenovo-laptop") {
      enable = true;
      bashrcExtra = ''
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/laptop-github-ssh > /dev/null
        eval "$(starship init bash)"
      '';
    })
  ]);

}
