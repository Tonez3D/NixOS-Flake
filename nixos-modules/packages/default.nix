{ ... }: {
  imports = [ # Include the results of the hardware scan.
    ./agenix
    ./sops
    ./fzf
    ./valgrind
    ./gcc
    ./gnumake
    ./killall
    ./rust
    ./vim
    ./zerotier-one
    ./direnv
  ];
}
