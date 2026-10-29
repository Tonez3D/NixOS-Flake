{pkgs, unstable-pkgs, ...} : {

  programs.claude-code = {
    enable = true;
    package = pkgs.claude-code;
    settings = {
      permissions = {
        additionalDirectories = [
          "/home/ifeatud/Dev/fyder-chat"
          "/home/ifeatud/Dev/fyder-cli"
          "/home/ifeatud/Dev/ProtoDocs"
        ];
            allow = [
      "Bash(git diff:*)"
            ];
        deny = [
          "Read(~/.ssh/**)"
          "Read(./.env)"
          "Read(./.env.*)"
        ];
            disableBypassPermissionsMode = "disable";
              statusLine = {
    command = "input=$(cat); echo \"[$(echo \"$input\" | jq -r '.model.display_name')] 📁 $(basename \"$(echo \"$input\" | jq -r '.workspace.current_dir')\")\"";
    padding = 0;
    type = "command";
  };
  theme = "dark";

      };
    };

  };
}