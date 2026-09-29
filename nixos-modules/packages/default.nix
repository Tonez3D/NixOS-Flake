{ pkgs, ... }:
{
  imports = [
    ./agenix
    ./sops
    ./fzf
    ./valgrind
    ./gcc
    ./cron
    ./tmux
    ./nixfmt
    ./gnumake
    ./killall
    ./tailscale
    ./rust
    ./neovim
    ./kubernetes
    ./vim
    ./zip
    ./unzip
    ./zerotier-one
    ./direnv
    ./tree
  ];
}
