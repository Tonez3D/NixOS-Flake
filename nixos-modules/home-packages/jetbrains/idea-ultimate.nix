{pkgs, lib, inputs, config, ...} : {
  home.packages = with pkgs; [jetbrains.idea-ultimate];
}