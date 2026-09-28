{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ tailscale ];
  services.tailscale = {
    enable = true;
    port = 6885;
  };
  networking.firewall.trustedInterfaces = [
    "tailscale0"
  ];
}
