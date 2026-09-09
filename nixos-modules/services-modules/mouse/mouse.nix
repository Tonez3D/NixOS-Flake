{
  pkgs,
  lib,
  config,
  ...
}:
{
  systemd.services.mouse = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    description = "Mouse";

    script = "/usr/local/bin";
    serviceConfig = {
      Type = "simple";
      #ExecStart = "";
      RestartSec = 10;
      RestartSteps = 4;
      RestartMaxDelaySec = 160;
    };
  };
}
{

} :
let 
  in
  {
    
  }