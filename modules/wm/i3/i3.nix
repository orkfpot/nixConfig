{config , pkgs , callPAckage , ... }:

{
   services.xserver = {
    windowManager.i3 =
    {
      enable = true;
      extraPackages = with pkgs;
      [
        dmenu
        i3status
#        i3blocks
      ];
    };
  };
}

#    config = {
#      modifier = mod;
##      fonts = [""];
#      keybindings = lib.mkOptionDefault {
