{ pkgs, ... }:
let
  waypaper-config = ''
    [Settings]
    language = en
    folder = /mnt/knowledge-moor/Assets/Nix-Assets/wallpapers/
    monitors = All
    wallpaper = 
    show_path_in_tooltip = True
    backend = awww
    fill = fill
    sort = name
    color = #ffffff
    subfolders = False
    all_subfolders = False
    show_hidden = False
    show_gifs_only = False
    post_command = color-pallet
    number_of_columns = 3
    awww_transition_type = none
    awww_transition_step = 90
    awww_transition_angle = 0
    awww_transition_duration = 2
    awww_transition_fps = 60
    mpvpaper_sound = False
    mpvpaper_options = 
    use_xdg_state = False
  '';
in
{

  home.packages = with pkgs; [ waypaper ];
  home.file = {
    ".config/waypaper/config.ini".text = "${waypaper-config}";
  };
}
