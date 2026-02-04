
{pkgs, inputs, ...} :

with pkgs; [
    # TODO: Breakout the system-pkgs

  vim
  #git
  cmake
  clang
  gcc
  rustup
  libusb1
  rustc
  age
  killall
  usbutils
  kitty
  gtk3
  lshw
  gtk4
  rofi-wayland
  upower
  godot-mono
  brightnessctl
  base16-schemes
  hyprpolkitagent
  mesa
  libGLU

  bibata-cursors
  zip
  hellwal
  #light
  wev
  libGL
  gnome-keyring
  adwaita-icon-theme
  opentabletdriver
  #agenix
  gparted
  uv
  waypaper
  #wev
  swww
  fastfetch
  fzf
  fontfor
  fontforge
  overskride
  neovim-unwrapped
  inputs.awww
]
