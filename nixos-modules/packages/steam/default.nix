{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = false;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
