{pkgs, ...} : {
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
}