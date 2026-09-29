{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ tailscale ];
  services.tailscale = {
    enable = true;
    authKeyFile = "/etc/secrets/tailscale-authkey";
  };
  networking.firewall.trustedInterfaces = [
    "tailscale0"
  ];
}
