let
  user1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFABx8yt6E4tlqX0/vGELPKcuooKUwfPC7E4xhKroYZm tonez3d@gmail.com";
in
{
  "secret1.age".publicKeys = [ user1 ];
  "armored-secret.age" = {
    publicKeys = [ user1 ];
    armor = true;
  };
  "timeslot-key-a.age" = {
    publicKeys = [ user1 ];
    armor = true;
  };
}