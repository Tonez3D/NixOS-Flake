{
  lib,
  pkgs,
  config,
  ...
}:
{

  services.avahi.enable = true;

  networking.networkmanager.unmanaged = [
    "interface-name:enp4s0f3u1"
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
          interface-name = "enp4s0f3u1";
        };
        ipv4 = {
          method = "link-local";
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

  networking.useDHCP = false;
  networking.useNetworkd = true;

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
      DNS = [
        "1.1.1.1"
        "8.8.8.8"
      ];
    };
    linkConfig.RequiredForOnline = "no";
  };

  networking.nat = {
    enable = true;
    externalInterface = "wlp2s0"; # Keep this as your internet/Wi-Fi source
    internalInterfaces = [ "enp4s0f3u1" ]; # Change this to match
  };

  networking.firewall.allowedUDPPorts = [
    53
    6885
  ];

  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;

}
