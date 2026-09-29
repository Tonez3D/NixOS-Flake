{ config, lib, pkgs, ... }: 
let
  # Replace 'yourusername' with your actual Linux user
  shareUser = "homelab"; 
  sharePath = "/mnt/share";
in {

  # 1. Enable Tailscale
  services.tailscale.enable = true;

  # 2. Configure Samba
  services.samba = {
    enable = true;
    openFirewall = true; # We handle the firewall explicitly for Tailscale below
    nmbd.enable = false;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "The Knowledge Moor";
        "netbios name" = "tkm-smb";
        "security" = "user";
        
        # Security constraints: Bind only to local loopback and tailscale0
        "interfaces" = "0.0.0.0 ::";
        "bind interfaces only" = "no";
        #"hosts allow" = "100.118.0.0/16"; # Tailscale's CGNAT IPv4 range
	"hosts allow" = "100.64.0.0/10 127.0.0.1 localhost"; 
        "hosts deny" = "0.0.0.0/0";        

        # Modern, secure SMB protocols
        "server min protocol" = "SMB3";
	"disable netbios" = "yes";
      };

      # Your private share definition
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

  # 3. Restrict Firewall to Tailscale Interface
  networking.firewall = {
    enable = true;
allowedTCPPorts = [ 445 ];
    # Only allow NetBIOS and SMB protocols on the tailscale0 interface
    trustedInterfaces = [ "tailscale0" ];
  };

  # 4. Automate Share Directory Creation
  systemd.tmpfiles.rules = [
    "d ${sharePath} 0770 ${shareUser} users"
  ];
}

