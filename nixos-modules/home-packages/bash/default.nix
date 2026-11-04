{ hostName, lib, ... }:
{

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      fastfetch --logo none
      eval "$(starship init bash)"
      eval "$(fzf --bash)"
    '';
  };

}
