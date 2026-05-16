{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ gtk3 gtk4 ];

}
