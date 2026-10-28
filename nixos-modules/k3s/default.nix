{
  cluster-details,
  lib,
  cuttlefish,
  hostName,
  ...
}:
{
  #imports = [ ./cuttlefish.nix ];



          cuttlefish = {
            details = cluster-details;
            tokenFile = "/etc/secrets/cf-serToken";
            # With agenix:  tokenFile = config.age.secrets.cf-serToken.path;

            # Set on ONE server for its very first start only, then remove:
            # bootstrap = true;

            # Optional, the defaults match the architecture diagram:
            # cygnus.retentionHours = 8;
            # cygnus.idleUnloadMinutes = 20;   # 0 = keep models loaded
            # models.definitions.qwen.model = "Qwen/Qwen3.5-4B-Base";
            # topology = import ./cuttlefish-topology.nix;  # keep topology in this repo instead
          };

  #inputs.cuttlefish.enable = true;
  #cuttlefish = (
  #  lib.mkMerge [
  #    { details = cluster-details; }
  #    (lib.mkIf (hostName == "nixos") {
  #      node = "fool";
  #      tokenFile = "/etc/secrets/cf-serToken";
  #    })
  #    (lib.mkIf (hostName == "homelab-1") {
  #      node = "ever-night";
  #      tokenFile = "/etc/secrets/cf-serToken";
  #    })
  #    (lib.mkIf (hostName == "error") {
  #      node = "error";
  #      tokenFile = "/etc/secrets/cf-serToken";
  #    })
  #  ]
  #);
}#
