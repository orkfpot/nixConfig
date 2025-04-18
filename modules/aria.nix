{ config, lib, pkgs, ... }:

{
  imports = 
  [
    ./wm/i3/i3.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];



  users.users = { ignas.packages = with pkgs; [
      protonup-qt
      flatpak
      cage
      waydroid
      discord-canary
      vmware-horizon-client
      moonlight-qt
      prismlauncher
      signaldctl
      alsa-lib
      busybox
      discord
      gimp
      grim
      hyprpaper
      kitty
      librewolf
      neofetch
      nomacs
      obs-studio
      onlyoffice-bin
      pkg-config
      scrcpy
      util-linux
      wineWowPackages.stable
      wineWowPackages.waylandFull
      winetricks
      stack
      ghc
    ];
  };

  environment = {
    systemPackages = with pkgs;
    [
      nh
      flameshot
      webcord
      vlc
      ranger
      gcc_multi
      gnumake42
      firefox
      alacritty
      p7zip
      wofi
      gdb
      btop
      vim
      neovim
      tmux
      git
      waybar
      comma
      dmenu
    ];
  };

  programs = {
    steam = {
      enable = true;
    };
    neovim = {
     enable = true;
     defaultEditor = true;
    };
  };

  services = {
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
    plantuml-server = {
      enable = true;
      listenPort = 8080;
    };
    signald = {
      enable = true;
      user = "Ignas.42";
    };
    openssh = {
      enable = true;
    };
    tailscale = {
      enable = true;
    };
  };
}
