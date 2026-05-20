let
  nix-pc =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFABx8yt6E4tlqX0/vGELPKcuooKUwfPC7E4xhKroYZm tonez3d@gmail.com";
  homelab =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwfxlppSc6OXM8JIZb5gybwWXm0//ykPPwunDRzIFkN homelab@nixos";
    laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINfi4u0rZj7jdFMOkGmGbwFJXOH/kErjMa1US5YywkuY tonez3d@gmail.com";
in {
  "timeslot-key-a.age" = {
    publicKeys = [ nix-pc homelab laptop ];
    armor = true;
  };
  "timeslot-key-b.age" = {
    publicKeys = [ nix-pc homelab laptop ];
    armor = true;
  };
  "home-wifi-ssid.age" = {
    publicKeys = [ nix-pc homelab laptop ];
    armor = true;
  };
  "home-wifi-psk.age" = {
    publicKeys = [ nix-pc homelab laptop ];
    armor = true;
  };
  "wifi-secrets.age" = {
    publicKeys = [ nix-pc homelab laptop ];
    armor = true;
  };
}
