{ config, lib, pkgs, ... }:

let
  ttys = [ 1 2 3 ];
  bootTty = 1; 

  greeterCmd = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --cmd start-hyprland";

  mkConfig = n: {
    text = ''
      [terminal]
      vt = ${toString n}
      switch = ${lib.boolToString (n == bootTty)}

      [default_session]
      user = "greeter"
      command = "${greeterCmd}"
    '';
  };

  mkService = n:
    let tty = "tty${toString n}";
    in {
      description = "greetd on ${tty}";
      documentation = [ "man:greetd(1)" ];
      wantedBy = [ "graphical.target" ];
      wants = [ "systemd-user-sessions.service" ];
      after = [
        "systemd-user-sessions.service"
        "plymouth-quit-wait.service"
        "getty@${tty}.service"
      ];
      conflicts = [ "getty@${tty}.service" ];

      restartIfChanged = false;

      serviceConfig = {
        Type = "idle"; 
        ExecStart = "${pkgs.greetd}/bin/greetd --config /etc/greetd/${tty}.toml";
        Restart = "always";
        RestartSec = "1s";
        StandardInput = "tty";
        StandardOutput = "tty";
        StandardError = "journal";
        TTYPath = "/dev/${tty}";
        TTYReset = "yes";
        TTYVHangup = "yes";
        TTYVTDisallocate = "yes";
        UtmpIdentifier = tty;
        UtmpMode = "user";
      };
    };
in
{
  security.pam.services.greetd = {
    startSession = true;
    enableGnomeKeyring = config.services.gnome.gnome-keyring.enable;
  };

  environment.etc = lib.listToAttrs (map
    (n: lib.nameValuePair "greetd/tty${toString n}.toml" (mkConfig n))
    ttys);

  systemd.services = lib.listToAttrs (lib.concatMap
    (n:
      let tty = "tty${toString n}";
      in [
        (lib.nameValuePair "greetd-${tty}" (mkService n))
        (lib.nameValuePair "autovt@${tty}" { enable = false; })
      ])
    ttys);

  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
  };
  users.groups.greeter = { };

  services.greetd.enable = false;
  services.xserver.displayManager.lightdm.enable = false;
}
