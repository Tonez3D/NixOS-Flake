{ config, inputs, ... }: {
  users.groups.hermit = {
    gid = 1300;
  };
  users.groups.paragon = { };
}
