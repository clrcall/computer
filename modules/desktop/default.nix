{ pkgs, ... }:

{
  services = {
    flatpak.enable = true;
    printing.enable = true;
    avahi.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    p7zip
    ffmpeg-full
    flameshot
    gsmartcontrol
    neofetch
    vlc
    audacity
    handbrake
    qbittorrent
    mullvad-vpn
    telegram-desktop
    vesktop
    thunderbird
    gimp
    btop
    ani-cli
    spotify
    vmware-workstation
    rofi-wayland
  ];

  programs = {
    obs-studio.enable = true;
    firefox.enable = true;
    fish.enable = true;
  };

  virtualisation.vmware.host.enable = true;

}
