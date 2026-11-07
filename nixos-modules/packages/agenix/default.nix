{
  config,
  pkgs,
  lib,
  inputs,
  hostName,
  ...
}:
{
  environment.systemPackages = [
    inputs.agenix.packages."${pkgs.system}".default
    pkgs.agenix-cli
    pkgs.age
    pkgs.awscli2
    pkgs.nodejs_24
  ];

  age = {
    identityPaths = [
      "/home/heifee/.ssh/github-ssh"
      "/home/ifeatud/.ssh/laptop-github-ssh"
      "/home/homelab/.ssh/homelab-key"
      "/home/error/.ssh/error-key"
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

      cuttlefish-tailscale = {
        file = ../../../secrets/cuttlefish-tailscale.age;
        name = "cuttlefish-tailscale.env";
        owner = "root";
        mode = "0400";
      };

      cuttlefish-server-token = {
        file = ../../../secrets/cuttlefish-server.age;

        name = "cf-serToken";
        owner = "root";
        group = "networkmanager";
        mode = "0400";
      };

      cuttlefish-worker-token = {
        file = ../../../secrets/cuttlefish-worker.age;

        name = "cf-workToken";
        owner = "root";
        group = "networkmanager";
        mode = "0400";
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

      share = {
        file = ../../../secrets/samba.age;

        name = "samba-secrets.env";
        owner = "root";
        group = "hermit";
        mode = "600";
      };
    }
    # claude-work.age (secrets/secrets.nix) is only encrypted for nix-pc and
    # laptop's keys, so decrypting it anywhere else fails with "no identity
    # matched any of the recipients" (hit on error/homelab - neither key is
    # a recipient).
    // lib.optionalAttrs (hostName == "nixos" || hostName == "lenovo-laptop") {
      claude-wkey = {
        file = ../../../secrets/claude-work.age;

        name = "claude-work-key";
        owner = "root";

        mode = "600";
      };
    };
  };
}
