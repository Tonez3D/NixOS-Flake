{ lib, pkgs, config, ... }:
{

  services.avahi.enable = true;

  networking.networkmanager.unmanaged = [
  "interface-name:enp4s0f3u1" # Change this to your exact USB adapter interface name
];

  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ "/etc/secrets/wifi-secrets.env" ];
    profiles = {
      "home-wifi" = {
        connection = {
          id = "home-wifi";
          type = "wifi";
        };
        wifi = {
          ssid = "$HOME_WIFI_SSID";
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";
          psk = "$HOME_WIFI_PSK";
        };
      };

      "pi-share" = {
        connection = {
          id = "PiEthernetShare";
          type = "ethernet";
          interface-name = "enp4s0f3u1"; # Change to your exact Ethernet interface name
        };
        ipv4 = {
          method = "link-local"; # This automatically enables NAT, routing, and DHCP
        };
        ipv6 = {
          method = "ignored";
        };
      };

      "phone-hotspot" = {
        connection = {
          id = "phone-hotspot";
          type = "wifi";
        };
        wifi = {
          ssid = "$HOTSPOT_SSID";
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";
          psk = "$HOTSPOT_PSK";
        };
      };

      "school-wifi" = {
        connection = {
          id = "school-wifi";
          type = "wifi";
        };
        wifi = {
          ssid = "eduroam";
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";
        };
        "802-1x" = {
          eap = "peap";
          identity = "$SCHOOL_WIFI_USERNAME";
          password = "$SCHOOL_WIFI_PSK";
          phase2-auth = "mschapv2";
        };
      };
    };
  };








 #1. Enable networkd
  networking.useDHCP = false; # Disable global DHCP to avoid collisions
  networking.useNetworkd = true;

  # 2. Assign a static IP to your ethernet interface (e.g., eth0 or enp3s0)
  # 1. Update the match pattern to your exact USB interface name
  systemd.network.networks."10-lan" = {
    matchConfig.Name = "enp4s0f3u1"; 
    networkConfig = {
      Address = "192.168.7.1/24"; 
      DHCPServer = true;
    };
    dhcpServerConfig = {
      PoolSize = 50;              
      PoolOffset = 10;            
      EmitDNS = true;
      DNS = [ "1.1.1.1" "8.8.8.8" ]; 
    };
    linkConfig.RequiredForOnline = "no"; 
  };

  # 2. Update the internal interface in your NAT config
  networking.nat = {
    enable = true;
    externalInterface = "wlp2s0"; # Keep this as your internet/Wi-Fi source
    internalInterfaces = [ "enp4s0f3u1" ]; # Change this to match
  };

  # 4. Enable IP Forwarding and NAT (Internet Connection Sharing)
  #networking.nat = {
  #  enable = true;
  #  externalInterface = "wlp2s0"; # The interface that connects to YOUR internet
  #  internalInterfaces = [ "enp4s0f3u1" ];
  #};

  # 5. Allow DHCP and DNS traffic through the firewall
  networking.firewall.allowedUDPPorts = [ 53 67 ];

  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;

}

