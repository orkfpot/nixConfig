{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Include own configurations
      # ./appImage-enable.nix
      # ./network-configuration.nix
      # ./package-configuration.nix
      # ./package-unstable-configuration.nix
      # ./package-custom-configuration.nix
      # ./flake-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  # enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes" ];

  networking.hostName = "gerald"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Enable networking
  # networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable the X11 windowing system. services = { xserver.enable = true;
  
  # Enable the KDE Plasma Desktop Environment.
  services = {
    displayManager.sddm.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      desktopManager = {
        plasma5.enable = true;
        xfce = {
          enable = true;
        };
      };
      windowManager = 
      {
#        bspwm.enable = true;
#        dwm.enable = true;
#        evilwm.enable = true;
      };
      # Configure keymap in X11
      xkb.layout = "gb";
      xkb.variant = "";
    };

    tailscale = {
      enable = true;
    };
  };
  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    ignas = {
      isNormalUser = true;
      description = "Ignas";
      extraGroups =
      [
        "networkmanager"
        "wheel"
        "libvirtd"
        "qemu-libvirtd"
      ];
      packages = with pkgs; [
        openssh
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # used by kdeconnect
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ignas" = import ./home.nix;
    };
  };

  hardware.opengl = { 
    enable = true;
    driSupport32Bit = true;
    driSupport = true;
    extraPackages = with pkgs;
    [
      rocm-opencl-icd
      rocm-opencl-runtime
      amdvlk
    ];
  };
}
