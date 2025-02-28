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
      vmware-horizon-client
      audacity
      kdenlive
      protontricks
      r2mod_cli
      rare
      sunshine
    ];
  };

  nixpkgs.config.permittedInsecurePackages = [
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
      android-tools
      bottles
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
      heroic
      hyprpaper
      jdk17
      librewolf
      librewolf
      lm_sensors
      mangohud
      nh
      nix-index
      nomacs
      obs-studio
      onlyoffice-bin
      openscad
      openssh
      p7zip
      pkg-config
      protonup-qt
      python3
      python312Packages.vpk
      qemu
      ranger
      rustup
      signal-desktop
      steam
      sxhkd
      teams-for-linux
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
