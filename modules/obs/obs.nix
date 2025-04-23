{ pkgs , ... }:

{
  imports =
  [
    ./plugins/plugins.nix
    ./plugins/virt-cam/virtcam.nix
  ];

  environment.systemPackages = with pkgs;
  [
    obs-studio
  ];
}
