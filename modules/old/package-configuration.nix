{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.udisks2.enable = true;

# flatpak truly a shame

  services = {
#    sunshine = {
#      enable = true;
#      autoStart = true;
#      capSysAdmin = true;
#      openFirewall = true;
#      
#    };
    flatpak.enable = true;
  };
  users.users.ignas = {
    packages = with pkgs;
    [
      omnissa-horizon-client
      protontricks
      r2mod_cli
      rare
      sunshine
    ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    #CVE-2025-49794
    #CVE-2025-49796
    #CVE-2025-6021
    # don't have anything front facing based on this
    "libxml2-2.13.8"
    # END OF LIFE not an active security threat
    "electron-25.9.0"
  ];

  fonts = {
  packages = with pkgs;
    [
      arkpandora_ttf
      blueman
      corefonts
      font-awesome
      powerline-fonts
      powerline-symbols
      vistafonts
    ];
  };

  environment.systemPackages = with pkgs;
    [
      scrcpy
      ghc
      comma
      alacritty
      alsa-lib
      btop
      discord-canary
      discord-screenaudio
      webcord
      dmenu
      dotnet-sdk_8
      exfat
      fastfetch
      ffmpeg
      firefox
      gcc_multi
      gdb
      gimp
      git
      gnumake42
      grim
      hyprpaper
      jdk17
      lm_sensors
      mangohud
      nh
      nix-index
      nomacs
      onlyoffice-bin
      openscad
      openssh
      p7zip
      pkg-config
      protonup-qt
      qemu
      ranger
      signal-desktop
      steam
      tmux
      util-linux
      vim
      virt-manager
      vlc
      vscodium
      vulkan-headers
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers
      waybar
      whatsapp-for-linux
      wofi
      xdotool
      xorg.xf86inputevdev
      zig
    ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    gamemode.enable = true;

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      package = pkgs.steam.override {
        extraLibraries = p: with p;
	[
	  (lib.getLib networkmanager)
	];
      };
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        #add missing dynamic libraries
        nix-bundle
        bash
        zlib
        fuse
      ];
    };
    neovim = {
      enable = true;
    };
  };
  services = {
    openssh = {
      enable = true;
    };
    sshd.enable = true;

    tailscale = {
      enable = true;
    };

  };

  # libvirt initialisation
  virtualisation = {
    waydroid.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
  #        packages = [(pkgs.unstable.OVMF.override {
  #          secureBoot = true;
  #          tpmSupport = true;
  #        }).fd];
        };
      };
    };
  };
}
