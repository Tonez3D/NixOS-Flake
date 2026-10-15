{
  pkgs,
  lib,
  hostName,
  inputs,
  ...
}:
let
  kubeMasterIP = "192.168.1.219";
  kubeMasterHostname = "lotm.fool";
  kubeMasterAPIServerPort = 6443;
in
{
  imports = [
    ./nodes.nix
    ./minikube.nix

  ];

  networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

  environment.systemPackages = with pkgs; [
    kubernetes
    kompose
    kubectl
    docker
  ];
  virtualisation.docker.enable = true;
  services.kubernetes = {
    roles = [
      "master"
      "node"
    ];
    masterAddress = kubeMasterHostname;
    apiserverAddress = "https://${kubeMasterHostname}:${toString kubeMasterAPIServerPort}";
    easyCerts = true;
    apiserver = {
      securePort = kubeMasterAPIServerPort;
      advertiseAddress = kubeMasterIP;
    };

    addons.dns.enable = true;

    kubelet.extraOpts = "--fail-swap-on=false";
    proxy = {
      enable = true;
      bindAddress = "0.0.0.0";

    };
  };
}
