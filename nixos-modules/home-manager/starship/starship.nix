{ ... } : {
  programs.starship = {
  enable = true;
  settings = {
    add_newline = true;
    command_timeout = 1300;
    scan_timeout = 50;
    format = "[](0x9A348E)$username$hostname$localip$shlvl$singularity$kubernetes[](fg:0x9A348E bg:0xDA627D)$directory$vcsh[](fg:0xDA627D bg:0xFCA17D)$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch[](fg:0x86BBD8 bg:0x06969A)$docker_context$package$buf[](fg:0xFCA17D bg:0x86BBD8)$c$cmake$cobol$container$daml$dart$deno$dotnet$elixir$elm$erlang$golang$haskell$helm$java$julia$kotlin$lua$nim$nodejs$ocaml$perl$php$pulumi$purescript$python$rlang$red$ruby$rust$scala$swift$terraform$vlang$vagrant$zig$nix_shell$conda$spack$memory_usage$aws$gcloud$openstack$azure$env_var$crystal$custom$sudo$cmd_duration$line_break$jobs$battery[](fg:0x06969A bg:0x33658A)$time$status$shell$character";
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