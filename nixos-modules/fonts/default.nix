{ pkgs, ... }: {
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    roboto
    work-sans
    comic-neue
    source-sans
    twemoji-color-font
    comfortaa
    lato
    inter
    dejavu_fonts
    iosevka-bin
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.tinos
    #font-misc-cyrillic
    google-fonts
    victor-mono
    texlivePackages.hyphen-ethiopic
    #font-screen-cyrillic
    #font-winitzki-cyrillic
    font-awesome_4
    font-awesome_5
    material-icons
    material-design-icons
    material-symbols
  ];
  environment.systemPackages = with pkgs; [ fontfor fontforge ];

}
