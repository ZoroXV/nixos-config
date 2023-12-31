{ pkgs, lib, ... }:
let
  wallpaper = builtins.fetchurl {
    url = https://images4.alphacoders.com/120/1200152.png;
    sha256 = "0z2hvppfpjmipjhc20g76vwkpf7ypyk7mrfr7zg464cfykbplns2";
  };
  cfg = {
    workspaces = {
    ws1 = "1";
    ws2 = "2";
    ws3 = "3";
    ws4 = "4";
    ws5 = "5";
    ws6 = "6";
    ws7 = "7";
    ws8 = "8";
    ws9 = "9";
    ws10 = "10";
    };
  };
in {
  enable = true;
  package = pkgs.i3;

  config = rec {
      modifier = "Mod4";
      terminal = "alacritty";

      window = {
        border = 0;
        titlebar = false;
      };

      gaps = {
        inner = 10;
        outer = 5;
      };

      fonts = {
        names = [ "DejaVu Sans Mono" ];
        style = "Bold Semi-Condensed";
        size = 8.0;
      };

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun -show-icons";
        "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";

        # Workspace management
        "${modifier}+1" = "workspace ${cfg.workspaces.ws1}";
        "${modifier}+2" = "workspace ${cfg.workspaces.ws2}";
        "${modifier}+3" = "workspace ${cfg.workspaces.ws3}";
        "${modifier}+4" = "workspace ${cfg.workspaces.ws4}";
        "${modifier}+5" = "workspace ${cfg.workspaces.ws5}";
        "${modifier}+6" = "workspace ${cfg.workspaces.ws6}";
        "${modifier}+7" = "workspace ${cfg.workspaces.ws7}";
        "${modifier}+8" = "workspace ${cfg.workspaces.ws8}";
        "${modifier}+9" = "workspace ${cfg.workspaces.ws9}";
        "${modifier}+0" = "workspace ${cfg.workspaces.ws10}";
        "${modifier}+Shift+1" = "move container to workspace ${cfg.workspaces.ws1}";
        "${modifier}+Shift+2" = "move container to workspace ${cfg.workspaces.ws2}";
        "${modifier}+Shift+3" = "move container to workspace ${cfg.workspaces.ws3}";
        "${modifier}+Shift+4" = "move container to workspace ${cfg.workspaces.ws4}";
        "${modifier}+Shift+5" = "move container to workspace ${cfg.workspaces.ws5}";
        "${modifier}+Shift+6" = "move container to workspace ${cfg.workspaces.ws6}";
        "${modifier}+Shift+7" = "move container to workspace ${cfg.workspaces.ws7}";
        "${modifier}+Shift+8" = "move container to workspace ${cfg.workspaces.ws8}";
        "${modifier}+Shift+9" = "move container to workspace ${cfg.workspaces.ws9}";
        "${modifier}+Shift+0" = "move container to workspace ${cfg.workspaces.ws10}";

        # Function keys
        "XF86AudioRaiseVolume" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ false, exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ false, exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%+";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";
      };

      modes = {
        resize = {
          Down = "resize grow height 10 px or 10 ppt";
          Escape = "mode default";
          Left = "resize shrink width 10 px or 10 ppt";
          Return = "mode default";
          Right = "resize grow width 10 px or 10 ppt";
          Up = "resize shrink height 10 px or 10 ppt";
          ShiftUp = "resize shrink height 2 px or 2 ppt";
          ShiftDown = "resize grow height 2 px or 2 ppt";
          ShiftLeft = "resize shrink width 2 px or 2 ppt";
          ShiftRight = "resize grow width 2 px or 2 ppt";
        };
      };

      bars = [];

      window.commands = [
        { command = "border pixel 0"; criteria = { class = "Firefox"; }; }
        { command = "border pixel 0"; criteria = { class = "discord"; }; }
      ];

      assigns = {
        "${cfg.workspaces.ws10}" = [ { class = "discord"; } ];
      };

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ${wallpaper}";
          always = true;
          notification = false;
        }

        {
          command = "exec i3-msg workspace 1";
          always = true;
          notification = false;
        }

        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
      ];
  };
}
