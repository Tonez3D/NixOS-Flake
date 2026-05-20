{pkgs, ...} : {
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl1", MODE="0666"
    ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d3", MODE:="0666", ENV{ID_MM_DEVICE_IGNORE}="1", ENV{ID_MM_PORT_IGNORE}="1"
    ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d4", MODE:="0666", ENV{ID_MM_DEVICE_IGNORE}="1", ENV{ID_MM_PORT_IGNORE}="1"

  '';
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