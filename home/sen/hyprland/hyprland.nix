{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = "eDP-1, 1920x1080x144, 0x0, 1";

      exec-once = [
        "waybar"
        "hypridle"
        "hyprpaper"
        "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent"

        "firefox"
        "vesktop"
        "spotify"
      ];

      env = [
        "XDG_SESSION_TYPE, wayland"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "GNOME_SCHEMA, org.gnome.desktop.interface"

        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        accel_profile = flat;

        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      cursor = {
        no_hardware_cursors = true;
        no_warps = true;
      };

      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 0;

        resize_on_border = true;
        allow_tearing = true;
        layout = "dwindle";
      };

      decoration = {
        rounding = 0;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 5;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          enabled = true;
          size = 10;
          passes = 4;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = false;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, nautilus"

        "$mainMod, L, exec, wlogout -b 4 -m 400px"

        "$mainMod, V, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, F, fullscreen,"
        "$mainMod SHIFT, F, togglefloating"

        "$mainMod, L, exec, hyprlock"

        "$mainMod SHIFT, S, exec, hyprshot -m region --output-folder ~/Pictures/Screenshots"
        ", PRINT, exec, hyprshot -m output"

        "$mainMod SHIFT, C, exec, hyprpicker -a"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

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

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];
    };
  };
}
