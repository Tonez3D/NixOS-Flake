{ pkgs, inputs, ... }:
{

  home.packages = with pkgs; [ hypridle ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";
        unlock_cmd = "pkill --signal SIGUSR1 hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 210; # 3.5 Minutes
          on-timeout = "loginctl lock-session";
        }
      ];
    };
  };
}
