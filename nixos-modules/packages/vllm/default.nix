{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.pkgsCuda.vllm ];
}
