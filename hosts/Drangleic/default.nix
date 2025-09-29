{ config, pkgs, ... }:

{

    imports = [ ./hardware.nix ];

    networking = {
        hostName = "Drangleic";
        networkmanager.enable = true;
    };

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.11";

    time.timeZone = "Europe/Amsterdam";
    i18n.defaultLocale = "en_US.UTF-8";

    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
        kernelPackages = pkgs.linuxPackages_latest;
    };

    hardware = {
        graphics = {
            enable = true;
        };
        enableRedistributableFirmware = true;
    };

    services = {

        xserver = {
            enable = true;
            xkb.layout = "us";
        };

        desktopManager.plasma6.enable = true;
        displayManager.sddm.enable = true;

        pipewire = {
            enable = true;
            pulse.enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            jack.enable = true;
        };
    };

    security.rtkit.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    users.users.sen = {
        isNormalUser = true;
        description = "Sen";
        extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
        packages = with pkgs; [
            kdePackages.kate
        ];
    };

    security.sudo.enable = true;
}
