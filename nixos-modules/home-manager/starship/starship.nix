{ ... }: {
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
  };
}
