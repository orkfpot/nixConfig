{config , pkgs , callPAckage , ... }:

{
  xsession = {
    windowManager.i3 =
    {
      enable = true;
      extraPackages = with pkgs;
      [
        dmenu
        i3blocks
      ];
    };
    
    config = {
      modifier = mod;
#      fonts = [""];
      keybindings = lib.mkOptionDefault {
