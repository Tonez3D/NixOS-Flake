{
  pkgs,
  config,
  lib,
  ...
}:
{

  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/mnt/knowledge-moor" = {
    device = "//100.118.88.69/PrivateShare";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "user"
      "users"
      "credentials=/etc/secrets/samba-secrets.env"
      "gid=${toString config.users.groups.hermit.gid}"
      "nofail"
    ];
  };
}
