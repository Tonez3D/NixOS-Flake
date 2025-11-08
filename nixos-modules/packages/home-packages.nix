{pkgs, ... } : 
with pkgs; [
  vscode
  discord
  obsidian
  git
  gitu
  google-chrome
  spotify
  kicad
  dunst
  gnuradio
  jetbrains.rust-rover
  jetbrains.idea-ultimate
  jetbrains.clion
  rofi
  blender
  
  # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
]

