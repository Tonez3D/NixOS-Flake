{ pkgs, inputs, ... }:
{

  home.packages = with pkgs; [ hypridle ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        unlock_cmd = "pkill --signal SIGUSR1 hyprlock";
        before_sleep_cmd = "";
        after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms({action = " disable "})";
      };
      listener = [
        {
          timeout = 210; # 3.5 Minutes
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 700;
          on-timeout = "brightnessctl 20%";
        }
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch 'hl.dsp.dpms({action = " enable "})";
        }
        {
          timeout = 1050;
          on-timeout = "systemctl hibernate";
        }
      ];
    };
  };
}
