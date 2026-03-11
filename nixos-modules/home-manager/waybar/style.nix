''
  @import url("./colors.css");
  * {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: Material Design Icons, Lexend, JetBrains Mono Nerd Font;
  }

  window#waybar {
    
    color: #8A2BE2;
    padding-left: 2px;
  padding-right: 2px;
    
  }

  window#waybar>box {
   padding: 1px 1px;
  }

  window#waybar.hidden {
    opacity: 0.2;
  }

  .module{
    padding: 0px 8px;
  }

  #custom-search {
    background-image: url("/etc/nixos/assets/icons/Nix_snowflake.svg");
    background-size: 94%;
    background-position: center;
    background-repeat: no-repeat;
    padding-left: 20px;
  }

  box#workspaces {
    margin: 2px 50px 2px 2px;
    padding-left: 3px;
    padding-right: 3px;
    background-color: @background;
    border-radius: 4px;
    font-size: 11px;
  }

  #workspaces button {
    font-size: 16px;
    margin: 2px 2px 2px 2px;
    padding-left: 0px;
    padding-top: 0px;
    padding-bottom: 0px;
    background-color: @color5;
    border-radius: 3px;
    
    font-family: JetBrains Mono Nerd Font;
    transition: all 0.5s cubic-bezier(.55,0.68,.48,1.68);
    color: @background;
  }

  #workspaces button.urgent {
    color: @color13;
  }

  #workspaces button.active {
    background-color: @color3;
  }

  #misc {
    background-color: @background;
    border-radius: 4px;
  }

  #connections {
    background-color: @background;
    border-radius: 4px;
  }

  #combinded {
    background-color: @background;
    margin: 1px 1px;
    border-radius: 4px;
  }

  #waypaper {
    font-family: JetBrains Mono Nerd Font;
    color: @background;
    font-size: 24px;
    font-weight: 700;
  }

  #clock {
    font-weight: 700;
    font-size: 24px;
    font-family: "Iosevka Term";
  }

  #network {
    font-size: 24px;
  }

  #battery {
    font-family: "Material Symbols Rounded";
    font-size: 24px
  }

  #battery.warning {
    font-family: "Material Symbols Rounded";

    color: #A52A2A;
    background-color: inherit;
  }

  #battery.critical:not(.charging) {
    font-family: "Material Symbols Rounded";

    color: #7FFF00;
    background-color: inherit;
  }

  #pulseaudio {
    font-family: "Material Icons";
    font-size: 24px;
  }


  tooltip {
    font-family: 'Lato', sans-serif;
    border-radius: 15px;
    padding: 20px;
    margin: 30px;
  }

  tooltip label {
    font-family: 'Lato', sans-serif;
    padding: 20px;
  }
''
