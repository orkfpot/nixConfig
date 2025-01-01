{ config , pkgs , ... }:

{
  home.packages = with pkgs;
  [
    waybar
  ];
  programs.waybar.settings.main = {
    modules-right = ["clock"];
  };
}
