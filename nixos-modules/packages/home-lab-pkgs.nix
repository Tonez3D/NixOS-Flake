{ pkgs, ... }:
{
  imports = [
    ./neovim
    ./default.nix
    ./tmux
    ./kubernetes
    ./tree
    ./tailscale
  ];
}
