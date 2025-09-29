{ pkgs, ... }:

{
    services = {
        flatpak.enable = true;
        printing.enable = true;
        avahi.enable = true;
    };

    environment.systemPackages = with pkgs; [
        alacritty p7zip ffmpeg-full flameshot gsmartcontrol neofetch
        vlc audacity obs-studio handbrake qbittorrent
        mullvad-vpn telegram-desktop vesktop thunderbird
        gimp btop ani-cli spotify vmware-workstation
    ];
    
    programs = {
        obs-studio.enable = true;
        firefox.enable = true;
        zsh.enable = true;
    };
}
