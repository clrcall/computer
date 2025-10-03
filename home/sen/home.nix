{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  home.stateVersion = "25.05";
  home.username = "sen";
  home.homeDirectory = "/home/sen";

  imports = [
    ./hyprland/default.nix
  ];

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
