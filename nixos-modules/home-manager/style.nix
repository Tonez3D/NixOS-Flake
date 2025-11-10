 ''
    * {
      /* `otf-font-awesome` is required to be installed for icons */
      font-family: Material Design Icons, Lexend, JetBrains Mono Nerd Font;
    }

    window#waybar {
      background-color: transparent;
      color: #8A2BE2;
      opacity: 0.9;
    }
    window#waybar>box {
     padding: 1px 5px;
    }

    window#waybar.hidden {
      opacity: 0.2;
    }


    .module{
      padding: 0px 8px;
    }

    #custom-search {
      background-image: url("https://upload.wikimedia.org/wikipedia/commons/2/28/Nix_snowflake.svg");
      background-size: 65%;
      background-position: center;
      background-repeat: no-repeat;
      padding-left: 20px;
    }

    #workspaces button {
      background-color: transparent;
      padding-left: 6px;
      margin: 0px 7px;
      font-family: JetBrains Mono Nerd Font;
      transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.68);
      color: #8A2BE2;
    }

    #workspaces button.urgent {
      color: #A52A2A;
    }

    #clock {
      font-weight: 700;
      font-size: 15px;
      font-family: "Iosevka Term";
    }

    #battery.warning {
      color: #A52A2A;
      background-color: inherit;
    }

    #battery.critical:not(.charging) {
      color: #7FFF00;
      background-color: inherit;
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
