{ config , pkgs , lib, ... }:

{
  imports =
  [
    ./waybar.nix
  ];
  environment.systemPackages = with pkgs; [
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    mako # notification system developed by swaywm maintainer
    nemo # file explorer
    eww # widgets
    xdg-desktop-portal
  ];

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

    # enavle sway
    programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}

