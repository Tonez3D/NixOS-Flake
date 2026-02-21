{pkgs, ...}: {

  services.udev.packages = [
  (pkgs.writeTextFile {
    name = "pico-debug-rules";
    text = ''
      # Raspberry Pi Picoprobe / CMSIS-DAP (VID: 2e8a, PID: 000c)
      ACTION=="add",SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="000c", MODE="0666"
      ACTION=="add",SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="000c", MODE="0666"

      ACTION=="add",SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="000f", MODE="0666"
    '';
    destination = "/etc/udev/rules.d/99-pico-debug.rules";
  })
];
}