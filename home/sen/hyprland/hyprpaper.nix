{ config, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;

      preload = [
        "${config.home.homeDirectory}/computer/wallpapers/cube_prod.png"
        "${config.home.homeDirectory}/computer/wallpapers/loupe.png"
      ];

      wallpaper = [
        ",${config.home.homeDirectory}/computer/wallpapers/cube_prod.png"
      ];
    };
  };
}
