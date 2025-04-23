{ pkgs , ... }:

{
  environment.systemPackages = with pkgs.obs-studio-plugins;
  [
    input-overlay
  ];
}
