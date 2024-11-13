{ config , pkgs , ... }:

{
  imports = [
    ./terminal/alacritty.nix
    ./editor/nvim.nix
    ./de/plasma5/x.nix
    ./de/plasma5/wayland.nix
    ./utils/nixos/nh.nix
    ./termTools/fastFetch.nix
    ./termTools/btop.nix
    ./webBrowser/firefox.nix
    ./system/networking/wireless.nix
    ./system/audio/pipewire.nix
  ];
}
