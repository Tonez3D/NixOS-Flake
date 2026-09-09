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
