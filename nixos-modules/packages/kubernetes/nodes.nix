{
  config,
  hostName,
  lib,
  ...
}:
{
  services.kubernetes = (
    lib.mkMerge [
      (lib.mkIf (hostName == "nixos") {
        roles = [
          "master"
          "node"
        ];
      })
      (lib.mkIf (hostName == "lenovo-laptop") { roles = [ "node" ]; })
      (lib.mkIf (hostName == "homelab-1") { roles = [ "node" ]; })
    ]
  );
}
