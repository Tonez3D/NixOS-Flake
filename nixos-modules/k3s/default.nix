{
  cluster-details,
  lib,
  hostName,
  ...
}:
{
  imports = [ ./cuttlefish.nix ];

  cuttlefish = (
    lib.mkMerge [
      { details = cluster-details; }
      (lib.mkIf (hostName == "nixos") {
        node = "fool";
        tokenFile = "/etc/secrets/cf-serToken";
        bootstrap = true;
      })
      (lib.mkIf (hostName == "homelab-1") {
        node = "ever-night";
        tokenFile = "/etc/secrets/cf-serToken";
      })
      (lib.mkIf (hostName == "laptop") {
        node = "error";
        tokenFile = "/etc/secrets/cf-serToken";
      })
    ]
  );
}
