{ pkgs , ... }:
{
  imports =
    [
#    ./ld/main.nix
    ];
  environment.systemPackages = with pkgs;
  [
    openutau
#    jetbrains.idea-ultimate
  ];
}
