{ pkgs, ... }:

{
  services = {
    flatpak.enable = true;
    printing.enable = true;
    avahi.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
  ];

  environment.systemPackages = with pkgs; [
    alacritty
    p7zip
    ffmpeg-full
    flameshot
    fastfetch
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
    rofi-wayland
  ];

  programs = {
    obs-studio.enable = true;
    firefox.enable = true;
    fish.enable = true;
  };

}
