{ ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./agenix
    ./sops
    ./fzf
    ./valgrind
    ./gcc
    ./nixfmt
    ./gnumake
    ./killall
    ./rust
    ./vim
    ./zerotier-one
    ./direnv
  ];
}
