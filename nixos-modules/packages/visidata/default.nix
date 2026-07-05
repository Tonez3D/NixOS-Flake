{pkgs, ...}: {
  environment.systemPackages = with pkgs; [ visidata ];
}