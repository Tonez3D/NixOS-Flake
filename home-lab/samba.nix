{ config, lib, pkgs, ... }: 
let
  shareUser = "homelab"; 
  sharePath = "/mnt/share";
in {

  services.tailscale.enable = true;

  services.samba = {
    enable = true;
    openFirewall = true; 
    nmbd.enable = false;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "The Knowledge Moor";
        "netbios name" = "tkm-smb";
        "security" = "user";
        
        "interfaces" = "0.0.0.0 ::";
        "bind interfaces only" = "no";
        #"hosts allow" = "100.118.0.0/16"; # Tailscale's CGNAT IPv4 range
	"hosts allow" = "100.64.0.0/10 127.0.0.1 localhost"; 
        "hosts deny" = "0.0.0.0/0";        

        "server min protocol" = "SMB3";
	"disable netbios" = "yes";
      };

      "PrivateShare" = {
        "path" = sharePath;
        "browseable" = "yes";
	"writeable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "valid users" = shareUser;
	"csc policy"="manual";
        "force user" = shareUser;
      };
    };
  };

  networking.firewall = {
    enable = true;
allowedTCPPorts = [ 445 688 844 ];
    trustedInterfaces = [ "tailscale0" ];
  };

  systemd.tmpfiles.rules = [
    "d ${sharePath} 0770 ${shareUser} users"
  ];
}

