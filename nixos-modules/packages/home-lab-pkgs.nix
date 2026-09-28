{ pkgs, ... }:
{
  imports = [
    ./neovim
    ./default.nix
    ./tmux
#    ./kubernetes
    ./tailscale
  ];
}
