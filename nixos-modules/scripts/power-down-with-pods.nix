{pkgs, ...} :
  let
  ee = pkgs.writeScriptBin "power-pod" ''
    #!/usr/bin/env bash
    $MODE=$1

    if [$MODE == 0]; then
      elif [$MODE == 1]; then
    pafi
  '';
in {
{
  home.packages = [ ee];
}

}