{ pkgs, config, ... }:
let
  gen-lqoute = pkgs.writeScriptBin "qtd" ''
    #!/usr/bin/env bash
    files = (/home/[]/quotes/*)
    sed -n "$((RANDOM % $(wc -l < filename.txt) + 1))p" filename.txt

  '';
in { home.packages = [ gen-lqoute ]; }