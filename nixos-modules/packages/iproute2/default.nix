{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [ pkgs.iproute2 ];

  services.udev.extraRules = ''
    SUBSYSTEM=="net", ACTION=="add", KERNEL=="can*", \
      RUN+="${pkgs.iproute2}/bin/ip link set %k type can bitrate 1000000", \
      RUN+="${pkgs.iproute2}/bin/ip link set up %k"
  '';

}
