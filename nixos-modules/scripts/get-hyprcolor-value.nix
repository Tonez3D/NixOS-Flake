{ pkgs, config, ... }:
let
  gen-colors = pkgs.writeScriptBin "color-pallet" ''
    #!/usr/bin/env bash
    OUTPUT_TYPE=;

  '';
in
{
  home.packages = [ gen-colors ];
}
