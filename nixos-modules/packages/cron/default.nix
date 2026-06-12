{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.cron ];
}
