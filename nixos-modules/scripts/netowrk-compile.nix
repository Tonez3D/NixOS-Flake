{ pkgs, config, ... }:
let
  gen-colors = pkgs.writeScriptBin "color-pallet" ''
    #!/usr/bin/env bash

    VERBOSE=false
    TOOLCHAIN=""
    PROJECT_PATH=""

    while getopts "vs:" flag; do
      case "${flag}" in
          v) VERBOSE=true ;;
          t) TOOLCHAIN="${OPTARG}" ;;
          p) PROJECT="${OPTARG}" ;; 
          *) echo "Invalid option"; exit 1 ;;
      esac
    done



  '';
in
{
  home.packages = [ gen-colors ];
}
