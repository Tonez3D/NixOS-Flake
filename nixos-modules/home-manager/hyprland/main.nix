{ pkgs, ... }:
{
  #systemd.user.services.hyprpolkitagent = {
  #  description = "Hyprpolkitagent - Polkit authentication agent";
  #  wantedBy = [ "graphical-session.target" ];
  #  wants = [ "graphical-session.target" ];
  #  after = [ "graphical-session.target" ];
  #  serviceConfig = {
  #    Type = "simple";
  #    ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
  #    Restart = "on-failure";
  #    RestartSec = 1;
  #    TimeoutStopSec = 10;
  #  };
  #};
}
