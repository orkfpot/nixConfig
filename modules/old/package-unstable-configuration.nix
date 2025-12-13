{ config, lib, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in 
{
  users.users.ignas = {
    packages = with pkgs;
    [
      r2modman
      osu-lazer
    ];
  };
  environment.systemPackages = with pkgs; [
#      ringracers
    wineWowPackages.unstable
    wineWowPackages.waylandFull
    winetricks
    emptty
    lutris
  ];
}
