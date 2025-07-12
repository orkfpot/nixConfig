{ config , pkgs , ... }:

{
  programs.waybar.settings.main = {
    modules-right = ["clock"];
  };
}
