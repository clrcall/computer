{ config, pkgs, lib, inputs, ... }:

{
    home.stateVersion = "25.05";
    home.username = "sen";
    home.homeDirectory = "/home/sen";

    systemd.user = {
        enable = true;
        startServices = "sd-switch";
        services = lib.mkMerge [
            # makes an automapaper service and config for every monitor.
            (builtins.listToAttrs (
                builtins.map (
                {
                    name,
                    horizontal,
                    vertical,
                    ...
                }:
            let
            display_config = let
                display-shader = pkgs.replaceVars ../../modules/automapaper/display-with_vars.glsl {
                    background = "vec4(0.0, 0.0, 0.0, 1.0);";
                    foreground = "vec4(1.0, 0.1, 0.4, 1.0);";
                };
                state-shader = ../../modules/automapaper/state-game_of_life.glsl;
                init-shader = ../../modules/automapaper/init.glsl;
                # General configurations
                cycles = 2000;
                tps = 30;
                horizontal-dot-size = 10;
                vertical-dot-size = 10;
            in
                (import ../../modules/automapaper/config.nix {
                    inherit (pkgs) writeTextFile;
                    inherit
                    init-shader
                    state-shader
                    display-shader
                    tps
                    cycles
                    ;
                    display = name;
                    horizontal = builtins.div horizontal horizontal-dot-size;
                    vertical = builtins.div vertical vertical-dot-size;
                });

            in
            lib.attrsets.nameValuePair "automapaper-${name}" ({
            Install = {
                WantedBy = [ "niri.service" ];
            };
            Unit = {
                Description = "Automapaper for display ${name}";
                After = "graphical-session.target";
                Requisite = "graphical-session.target";
            };

            Service = {
                ExecStart = "${
                    inputs.automapaper.packages.${pkgs.system}.automapaper
                }/bin/automapaper -C ${display_config}/config.toml";
                Restart = "on-failure";
                RestartSec = 15;
            };
            })
                ) [{
                    name = "DP-1";
                    horizontal = 1920;
                    vertical = 1080;
                    horizontal-offset = 1080;
                    vertical-offset = 0;
                    refresh-rate = 360;
                    scale = "1";
                }
            {
                name = "DP-2";
                horizontal = 1080;
                vertical = 1920;
                horizontal-offset = 0;
                vertical-offset = 0;
                refresh-rate = 144;
                scale = "1";
            }]
            ))
        ];
    };

    programs.git = {
        enable = true;
        userName = "sen";
        userEmail = "git@sen.wtf";
    };
    
    programs.starship.enable = true;
    programs.fzf.enable = true;

    fonts.fontconfig.enable = true;
    home.packages = [
        pkgs.jetbrains-mono
        pkgs.noto-fonts
        pkgs.noto-fonts-cjk-sans
        pkgs.noto-fonts-emoji
    ];
}
