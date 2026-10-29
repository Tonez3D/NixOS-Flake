{pkgs, ...}:
{
  disko.devices.disk.main = {
    device = "/dev/nvme0n1";   # see "choosing the disk" below
    type = "disk";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          size = "1G"; type = "EF00";
          content = { type = "filesystem"; format = "vfat"; mountpoint = "/boot"; mountOptions = [ "umask=0077" ]; };
        };
        root = {
          size = "100%";
          content = { type = "filesystem"; format = "btrfs"; mountpoint = "/"; };
        };

      };
    };
  };

  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}