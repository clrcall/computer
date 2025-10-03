{ config, pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        ignore_empty_input = true;
        grace = 0;
        no_fade_in = false;
        immediate_render = true;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 7;
        }
      ];

      input-field = [
        {
          size = "300, 60";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 2;
          placeholder_text = ''Password...'';
          shadow_passes = 2;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = 90;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "Hi, $USER";
          font_size = 25;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
