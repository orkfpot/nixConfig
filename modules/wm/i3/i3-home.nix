{ config, lib, pkgs, ... }:

let 
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      fonts = ["DejaVu Sans Mono, FontAwesome 6"];

      startup = mkOption [
        { command = "dex --autostart --environment i3"; }
        { command = "dex --autostart --environment i3"; }

      keybindings = lib.mkOptionDefault {
        "${mod}+space" = "exec ${pkgs.dmenu}/bin/dmenu_run";
        "${mod}+x" = "exec sh -c '${pkgs.maim}/bin/maim -s | xclip -selection clipboard -t image/png'";
        "${mod}+Shift+x" = "exec sh -c '${pkgs.i3lock}/bin/i3lock -c 222222 & sleep 5 && xset dpms force of'";

        # Focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+1" = "workspace number $ws1"
        "${mod}+2" = "workspace number $ws2"
        "${mod}+3" = "workspace number $ws3"
        "${mod}+4" = "workspace number $ws4"
        "${mod}+5" = "workspace number $ws5"
        "${mod}+6" = "workspace number $ws6"
        "${mod}+7" = "workspace number $ws7"
        "${mod}+8" = "workspace number $ws8"
        "${mod}+9" = "workspace number $ws9"
        "${mod}+0" = "workspace number $ws10"


        # Move
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+Shift+1" = "move container to workspace number $ws1"
        "${mod}+Shift+2" = "move container to workspace number $ws2"
        "${mod}+Shift+3" = "move container to workspace number $ws3"
        "${mod}+Shift+4" = "move container to workspace number $ws4"
        "${mod}+Shift+5" = "move container to workspace number $ws5"
        "${mod}+Shift+6" = "move container to workspace number $ws6"
        "${mod}+Shift+7" = "move container to workspace number $ws7"
        "${mod}+Shift+8" = "move container to workspace number $ws8"
        "${mod}+Shift+9" = "move container to workspace number $ws9"
        "${mod}+Shift+0" = "move container to workspace number $ws10"


        # Floating
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+r" = "mode \"resize\""

      };

      bars = [
        {
          position = "bottom";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${./i3status-rust.toml}";
        }
      ];
      modes = mkOption{
        resize = {
          h = "resize grow height 10 px or 10 ppt";
          j = "resize grow width 10 px or 10 ppt";
          k = "resize shrink height 10 px or 10 ppt";
          l = "resize shrink width 10 px or 10 ppt";
          Escape = "mode default";
        };
      };
    };
  };
}
