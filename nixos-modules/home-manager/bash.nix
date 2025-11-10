{ ... } : 

{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      eval "$(ssh-agent -s)"
      ssh-add ~/.ssh/github-ssh
      '';
  };
}