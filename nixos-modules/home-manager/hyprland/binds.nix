{ inputs, ... }:

{

  wayland.windowManager.hyprland.settings = {

    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, B, exec, firefox"
      "$mainMod, RETURN, exec, kitty"
      "$mainMod, Q, killactive"
      "$mainMod SHIFT, Q, exec, hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"
      "$mainMod, Z, exec, rofi -show drun"
      "$mainMod, O, exec, obsidian"
      "$mainMod SHIFT, F, fullscreen, 1"
      "$mainMod CTRL, L, exec, pidof hyprlock || hyprlock"
      "$mainMod CTRL, V, exec, code"
      "$mainMod ALT, T, workspaceopt, allfloat"
      "$mainMod , P, exec, grimblast save active"

      #", tablet:1, mouse, 1"

      # Switch to another workspace
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Only if multimoniter support
      "$mainMod SHIFT, 1, workspace, 11"
      "$mainMod SHIFT, 2, workspace, 12"
      "$mainMod SHIFT, 3, workspace, 13"
      "$mainMod SHIFT, 4, workspace, 14"
      "$mainMod SHIFT, 5, workspace, 15"
      "$mainMod SHIFT, 6, workspace, 16"
      "$mainMod SHIFT, 7, workspace, 17"
      "$mainMod SHIFT, 8, workspace, 18"
      "$mainMod SHIFT, 9, workspace, 19"
      "$mainMod SHIFT, 0, workspace, 20"

      "$mainMod CTRL, right, workspace, m+1"
      "$mainMod CTRL, left, workspace, m-1"

      #gesture = 3, horizontal, workspace

      "$mainMod ALT, right, movetoworkspace, r+1"
      "$mainMod ALT, left, movetoworkspace, r-1"

      "$mainMod CTRL, 1, movetoworkspace, 1 " # Move active window to workspace 1
      "$mainMod CTRL, 2, movetoworkspace, 2 " # Move active window to workspace 2
      "$mainMod CTRL, 3, movetoworkspace, 3 " # Move active window to workspace 3
      "$mainMod CTRL, 4, movetoworkspace, 4 " # Move active window to workspace 4
      "$mainMod CTRL, 5, movetoworkspace, 5 " # Move active window to workspace 5
      "$mainMod CTRL, 6, movetoworkspace, 6 " # Move active window to workspace 6
      "$mainMod CTRL, 7, movetoworkspace, 7 " # Move active window to workspace 7
      "$mainMod CTRL, 8, movetoworkspace, 8 " # Move active window to workspace 8
      "$mainMod CTRL, 9, movetoworkspace, 9 " # Move active window to workspace 9
      "$mainMod CTRL, 0, movetoworkspace, 10" # Move active window to workspace 10

      #",XF86AudioPlay, exec, playerctl play-pause" # 
      #",XF86AudioPause, exec, playerctl pause"                                                                                                               # Audio pause
      #",XF86AudioNext, exec, playerctl next"                                                                                                           # Audio next
      #",XF86AudioPrev, exec, playerctl previous"   
      ", XF96AudioUp, exec, playerctl "
      ",XF86MonBrightnessUp, exec, brightnessctl -q s +10%" # Increase brightness by 10%
      ",XF86MonBrightnessDown, exec, brightnessctl -q s 10%-" # Audio previous

    ];

  };

}
