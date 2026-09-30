{}: {
let
  kubeMasterIP = "10.1.1.2";
  kubeMasterHostname = "lotm.fool";
  kubeMasterAPIServerPort = 6443;
in
{
  networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
  ];

  services.kubernetes = ( lib.mkMerge [
    (lib.mkIf (hostName == "nixos") {roles = ["master" "node"];})
    (lib.mkIf (hostName == "lenovo-laptop") {roles = ["node"];})
    (lib.mkIf (hostName == "homelab-1") {roles = ["master" "node"];})
  ]);
  services.kubernetes = {
    masterAddress = kubeMasterHostname;
    apiserverAddress = "https://${kubeMasterHostname}:${toString kubeMasterAPIServerPort}";
    easyCerts = false;
    apiserver = {
      securePort = kubeMasterAPIServerPort;
      advertiseAddress = kubeMasterIP;
    };

    addons.dns.enable = true;

    kubelet.extraOpts = "--fail-swap-on=false";
  };
}
}