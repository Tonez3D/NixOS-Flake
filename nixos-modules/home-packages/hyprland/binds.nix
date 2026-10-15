{ inputs, lib, ... }:

let
  lua = lib.generators.mkLuaInline;
  bind = key: action: {
    _args = [
      key
      (lua action)
    ];
  };
  exec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';
  mvws = ws: ''hl.dsp.focus({ workspace = "${ws}"})'';
  mvwd = ws: ''hl.dsp.window.move({ workspace = "${ws}"})'';
  mvwddr = dr: ''hl.dsp.window.move({ direction = "${dr}"})'';
  fs = mode: ''hl.dsp.window.fullscreen({ mode = "${mode}"})'';
  focusdr = dr: ''hl.dsp.focus({ direction = "${dr}"})'';
  mod_key = "SUPER";
in
{
  wayland.windowManager.hyprland.settings = {

    mod = {
      _var = "SUPER";
    };

    bind = [

      #Applications
      (bind "${mod_key} + B" (exec "firefox"))
      (bind "${mod_key} + T" (exec "kitty"))
      (bind "${mod_key} + Z" (exec "rofi -show drun"))
      (bind "${mod_key} + O" (exec "obsidian"))
      (bind "${mod_key} + V" (exec "code"))

      (bind "${mod_key} + SHIFT + Q" (exec "hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"))
      (bind "${mod_key} + Q" (exec "hyprctl activewindow | grep pid | tr -d 'pid:' | pkill"))

      (bind "${mod_key} + F" (fs "1"))
      #"$mainMod CTRL, L, exec, pidof hyprlock || hyprlock"
      #"$mainMod ALT, T, workspaceopt, allfloat"
      (bind "${mod_key} + P" (exec "grimblast save active"))
      #"$mainMod, P, exec, grimblast save active"
      #"$mainMod, F, fullscreen, 1"

      #", tablet:1, mouse, 1"

      # Switch to another workspace
      (bind "${mod_key} + 1" (mvws "1"))
      (bind "${mod_key} + 2" (mvws "2"))
      (bind "${mod_key} + 3" (mvws "3"))
      (bind "${mod_key} + 4" (mvws "4"))
      (bind "${mod_key} + 5" (mvws "5"))
      (bind "${mod_key} + 6" (mvws "6"))
      (bind "${mod_key} + 7" (mvws "7"))
      (bind "${mod_key} + 8" (mvws "8"))

      #
      (bind "${mod_key} + CTRL +  1" (mvws "1"))
      (bind "${mod_key} + CTRL +  2" (mvws "2"))
      (bind "${mod_key} + CTRL +  3" (mvws "3"))
      (bind "${mod_key} + CTRL +  4" (mvws "4"))
      (bind "${mod_key} + CTRL +  5" (mvws "5"))
      (bind "${mod_key} + CTRL +  6" (mvws "6"))
      (bind "${mod_key} + CTRL +  7" (mvws "7"))
      (bind "${mod_key} + CTRL +  8" (mvws "8"))

      #
      (bind "${mod_key} + SHIFT + 1" (mvwd "1"))
      (bind "${mod_key} + SHIFT + 2" (mvwd "2"))
      (bind "${mod_key} + SHIFT + 3" (mvwd "3"))
      (bind "${mod_key} + SHIFT + 4" (mvwd "4"))
      (bind "${mod_key} + SHIFT + 5" (mvwd "5"))
      (bind "${mod_key} + SHIFT + 6" (mvwd "6"))
      (bind "${mod_key} + SHIFT + 7" (mvwd "7"))
      (bind "${mod_key} + SHIFT + 8" (mvwd "8"))

      # Only if multimoniter support
      #"$mainMod SHIFT, 1, workspace, 11"
      #"$mainMod SHIFT, 2, workspace, 12"
      #"$mainMod SHIFT, 3, workspace, 13"
      #"$mainMod SHIFT, 4, workspace, 14"
      #"$mainMod SHIFT, 5, workspace, 15"
      #"$mainMod SHIFT, 6, workspace, 16"
      #"$mainMod SHIFT, 7, workspace, 17"
      #"$mainMod SHIFT, 8, workspace, 18"
      #"$mainMod SHIFT, 9, workspace, 19"
      #"$mainMod SHIFT, 0, workspace, 20"

      #"$mainMod, right, workspace, m+1"
      #"$mainMod, left, workspace, m-1"
      #"$mainMod ALT, right, movetoworkspace, r+1"
      #"$mainMod ALT, left, movetoworkspace, r-1"

      #",XF86AudioPlay, exec, playerctl play-pause" #
      #",XF86AudioPause, exec, playerctl pause"                                                                                                               # Audio pause
      #",XF86AudioNext, exec, playerctl next"                                                                                                           # Audio next
      #",XF86AudioPrev, exec, playerctl previous"
      #(bind "XF86AudioUp" (exec "playerctl"))
      (bind "XF86MonBrightnessUp" (exec "brightnessctl -q s +10%"))
      (bind "XF86MonBrightnessDown" (exec "brightnessctl -q s 10%-"))
    ];
  };
}
