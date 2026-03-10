{ ... } : {
  programs.starship = {
  enable = true;
  settings = {
    add_newline = true;
    command_timeout = 1300;
    scan_timeout = 50;
    format = "[](0x9A348E)$username$hostname"
            +"[ ](fg:0x9A348E bg:0xDA627D)$directory"
            +"([](fg:0x9A348E bg:0xDA627D)$git_branch)$line_break"
            +"[> ](fg:0x9A348E bg:0xDA627D)";
    right_format = "";
    character = {
      success_symbol = "[](bold green) ";
      error_symbol = "[✗](bold red) ";
    };
    git_branch = {
          format = "[$symbol$branch(:$remote_branch)]($style) ";
          symbol = " ";
          style = "bold purple bg:0xFCA17D";
          truncation_length = 9223372036854775807;
          truncation_symbol = "…";
          only_attached = false;
          always_show_remote = false;
          ignore_branches = [];
          disabled = false;
        };
  };
  };
}