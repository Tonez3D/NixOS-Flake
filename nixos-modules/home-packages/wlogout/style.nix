{ ... }:
{
  programs.wlogout = {
    style = ''
      window {
            font-family: monospace;
            font-size: 14pt;
            color: #cdd6f4; /* text */
            background-color: rgba(30, 30, 46, 0.5);
          }

          button {
            background-repeat: no-repeat;
            background-position: center;
            background-size: 25%;
            border: none;
            background-color: rgba(30, 30, 46, 0);
            margin: 5px;
            transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
          }

          #logout {
            background-image: image(url("../../../assets/Screenshost (116).png"));
          }
    '';
  };
}
