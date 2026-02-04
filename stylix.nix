{pkgs, ...} : 
  let

   back = ./assets/Screenshost123.png; 
    in

{
  stylix = {
    enable = true;
    #targets = {#kitty.enable = true;
    #rofi.enable = true;};
    autoEnable = false;
    image = back;
  };
}