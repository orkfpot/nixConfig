{ pkgs , ... }:

{
  imports =
  [
    ./plugins/virt-cam/virtcam.nix
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins;
    [
      input-overlay
      obs-backgroundremoval
      wlrobs
      obs-pipewire-audio-capture
    ];
    enableVirtualCamera = true;
  };
}
