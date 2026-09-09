{ config, ... }:

{
  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ "/etc/secrets/wifi-secrets.env" ];
    profiles = {
      "HomeWifi" = {
        connection = {
          id = "HomeWifi";
          type = "wifi";
        };
        ipv4 = {

          method = "auto";
        };
        ipv6 = {
          method = "auto";
        };
        wifi = {
          ssid = "$HOME_WIFI_SSID";
        };
        wifi-security = {
          key-mgmt = "wpa-psk";
          psk = "$HOME_WIFI_PSK";
        };
      };
    };
  };
}
