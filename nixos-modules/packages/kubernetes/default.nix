{ pkgs, ... }: {
  imports = [
    ./minikube.nix
  ];
  environment.systemPackages = with pkgs; [
    kubernetes
    docker
  ];
  virtualisation.docker.enable = true;
  services.kubernetes = {
    proxy = {
      enable = true;
      bindAddress = "0.0.0.0";

    };
    masterAddress = "23.23.23.23";
  };
}
