{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ tailscale ];
  services.tailscale = {
    enable = true;
    port = 6885;
    authKeyFile = "/etc/secrets/tailscale-authkey";
  };
  networking.firewall.trustedInterfaces = [
    "tailscale0"
  ];
}
