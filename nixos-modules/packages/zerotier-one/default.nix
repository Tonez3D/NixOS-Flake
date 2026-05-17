{
  pkgs,
  config,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [ zerotierone ];
  services.zerotierone = {
    enable = true;
  };

  networking.firewall.trustedInterfaces = [ "ztfl6pg5zr" ];
}
