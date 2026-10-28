{...} : {
  virtualisation.docker = {
  enable = false; # Disables the system-wide (rootful) Docker daemon
  rootless = {
    enable = true;
    setSocketVariable = true; # Automatically exports DOCKER_HOST for your user
  };
};
}