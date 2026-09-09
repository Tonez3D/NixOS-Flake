{ ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./agenix
    ./sops
    ./fzf
    ./valgrind
    ./gcc
    ./cron
    ./sqllite
    ./nixfmt
    ./gnumake
    ./killall
    ./rust
    ./sqllite
    ./vim
    ./zerotier-one
    ./direnv
    ./forgejo
  ];
}
