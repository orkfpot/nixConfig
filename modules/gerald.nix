{ pkgs , ... }:
{
  imports =
    [
#    ./ld/main.nix
      ./obs/obs.nix
      ./video-editing/davinci-resolve.nix
      ./wm/i3/i3.nix
      ./wm/i3/sway/sway.nix
      ./wm/themes/theme.nix
      ./sunshine.nix
    ];
  environment.systemPackages = with pkgs;
  [
    openutau
    mindustry
    volk
    vulkan-tools
    blender
#    jetbrains.idea-ultimate
    lemurs
    swaybg
    waypaper
    wdisplays
    shikane
  ];
	
  programs = {
    kdeconnect.enable = true;
  };
}
