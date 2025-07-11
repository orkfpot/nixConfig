{ ... }:

{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = false;
        enableXfwm = true;
      };
    };
  };
}
