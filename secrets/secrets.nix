let
  nix-pc = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFABx8yt6E4tlqX0/vGELPKcuooKUwfPC7E4xhKroYZm tonez3d@gmail.com";
  homelab = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwfxlppSc6OXM8JIZb5gybwWXm0//ykPPwunDRzIFkN homelab@nixos";
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINfi4u0rZj7jdFMOkGmGbwFJXOH/kErjMa1US5YywkuY tonez3d@gmail.com";
  error = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP77eiXAOS7J3h3/k21iSHfdNeNZpp2wxdiUjTyepfgd error@error";
  all = [ nix-pc homelab laptop error];
in
{
  "timeslot.age" = {
    publicKeys = all;
  };

  "work.age" = {
    publicKeys = all;
  };

  "claude-work.age" = {
    publicKeys = [
      nix-pc
      laptop
    ];
    armor = true;
  };

  "claude-personal.age" = {
    publicKeys = all;
    armor = true;
  };

  "wifi-secrets.age" = {
    publicKeys = all;
  };

  "cluster-secrets.age" = {
    publicKeys = all;
  };

  "cuttlefish-server.age" = {
    publicKeys = all;
  };

  "cuttlefish-worker.age" = {
    publicKeys = all;
  };

  "tailscale.age" = {
    publicKeys = all;mor = true;
  };

  "samba.age" = {
    publicKeys = all;
  };
}
