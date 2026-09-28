{ pkgs, ... }:
{
  imports = [
    ./neovim
    ./default.nix
    ./tmux
    ./tree
    ./tailscale
  ];
}
