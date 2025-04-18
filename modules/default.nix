{ config , pkgs , ... }:

{
  imports = [
#    ./terminal/alacritty.nix
#    ./editor/nvim.nix
#    ./de/plasma5/x.nix
#    ./de/plasma5/wayland.nix
#    ./utils/nixos/nh.nix
#    ./wm/i3/i3.nix
#    ./termTools/fastFetch.nix
#    ./termTools/btop.nix
#    ./webBrowser/firefox.nix
#    ./system/networking/wireless.nix
#    ./system/audio/pipewire.nix
    ./packages.nix
    ./old/package-configuration.nix
    ./old/package-unstable-configuration.nix
  ];

  services.xserver = {
      # Configure keymap in X11
      xkb.layout = "gb";
      xkb.variant = "";
  };
}
