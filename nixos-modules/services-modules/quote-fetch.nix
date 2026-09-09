{ pkgs, ... }:
{
  systemd.services.fetchQuotes = {
    wanyedBy = [ ];
    wants = [ ];
    after = [ "network.target" ];
    description = "";
    serviceConfig = {
      ExecStart = "";
      ExecStop = "";
    };
  };
}
