{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ libGL libGLU ];

}
