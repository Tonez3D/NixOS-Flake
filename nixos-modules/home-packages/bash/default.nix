{ hostName, lib, ... }:
{

  programs.bash = {
    enable = true;
    # initExtra, not bashrcExtra: bash also sources .bashrc for non-interactive
    # SSH commands, and bashrcExtra runs before Home Manager's interactive
    # guard. Anything printed there corrupts `nix-store --serve`, which breaks
    # remote nixos-rebuild. Starship's init comes from programs.starship on the
    # hosts that enable it.
    initExtra = ''
      fastfetch --logo none
      command -v fzf >/dev/null && eval "$(fzf --bash)"
    '';
  };

}
