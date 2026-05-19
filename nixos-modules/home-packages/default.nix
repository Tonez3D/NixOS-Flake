{ ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./git
    ./bash
    ./fastfetch
    #./starship
    ../scripts/get-lock-quote.nix
  ];
}
