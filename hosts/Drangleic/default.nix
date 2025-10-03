{ config, pkgs, ... }:
{
  imports = [ ./hardware.nix ];

  networking = {
    hostName = "Drangleic";
    networkmanager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages;
  };

  hardware = {
    graphics = {
      enable = true;
    };
    enableRedistributableFirmware = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
    };
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    kitty
    rofi-wayland
    waybar
    dunst

    hyprland
    hypridle
    hyprpaper
    hyprshot
    hyprlock
    hyprutils
    hyprpicker
    hyprpolkitagent

    nautilus

    grim
    slurp
    wl-clipboard
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  users.users.sen = {
    isNormalUser = true;
    description = "Sen";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
    ];
  };

  security.sudo.enable = true;
}
