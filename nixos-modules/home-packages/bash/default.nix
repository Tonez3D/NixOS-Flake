{ hostName, lib, ... }:
{

 

  programs.bash = {
    enable = true;
        bashrcExtra = ''
          eval "$(ssh-agent -s)" > /dev/null 2>&1
          ssh-add ~/.ssh/* > /dev/null 2>&1
          fastfetch --logo-type kitty-direct 
          eval "$(starship init bash)"
          eval "$(fzf --bash)"
        '';
  };

}
