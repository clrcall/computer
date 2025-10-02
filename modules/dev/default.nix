{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    gdb
    cmake
    gnumake
    pkg-config
    git
    git-lfs
    python313
    rustc
    cargo
    vscodium
  ];
}
