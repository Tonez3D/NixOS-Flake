{ pkgs, config, ... }:
let
  gen-lock-quote = pkgs.writeScriptBin "lock-quote" ''
    #!/usr/bin/env bash
    files = (/var/quotes/*)
    sed -n "$((RANDOM % $(wc -l < filename.txt) + 1))p" filename.txt

  '';
in
{
  home.packages = [ gen-lock-quote ];
}
