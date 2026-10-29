{pkgs, ...} : {

  programs.claude-code = {
    enable = true;
    package = pkgs.claude-code;
    settings = {
      permissions = {
        additionalDirectories = [
          "/home/ifeatud/Dev/cuttlefish"
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