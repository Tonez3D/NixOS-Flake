{
  pkgs,
  lib,
  config,
  ...
}:
{
  systemd.services.munin-auto-start = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    description = "Munin";

    script = "/home/ifeatud/Dev/socket_unix/MUNIN_POINTING";
    serviceConfig = {
      Type = "simple";
      #ExecStart = "";
      RestartSec = 10;
      RestartSteps = 4;
      RestartMaxDelaySec = 160;
    };
  };
}
