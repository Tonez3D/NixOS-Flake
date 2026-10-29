{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  environment.systemPackages = [
    inputs.agenix.packages."${pkgs.system}".default
    pkgs.agenix-cli
    pkgs.age
    pkgs.awscli2 pkgs.nodejs_24
  ];

  age = {
    identityPaths = [
      "/home/heifee/.ssh/github-ssh"
      "/home/ifeatud/.ssh/laptop-github-ssh"
      "/home/homelab/.ssh/homelab-key"
    ];
    secretsDir = "/etc/secrets";
    secrets = {
      networking = {
        file = ../../../secrets/wifi-secrets.age;

        name = "wifi-secrets.env";
        owner = "root";
        group = "networkmanager";
        mode = "600";
      };

      tailscale = {
        file = ../../../secrets/tailscale.age;

        name = "tailscale-authkey";
        owner = "root";
        mode = "600";
      };

      claude-pkey = {
        file = ../../../secrets/claude-personal.age;

        name = "claude-personal-key";
                owner = "root";

        mode = "600";
      };

      claude-wkey = {
        file = ../../../secrets/claude-work.age;

        name = "claude-work-key";
                owner = "root";

        mode = "600";
      };

      share = {
        file = ../../../secrets/samba.age;

        name = "samba-secrets.env";
        owner = "root";
        group = "hermit";
        mode = "600";
      };
    };
  };
}
