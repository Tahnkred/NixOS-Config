{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [ ",preferred,auto,1" ];   # à adapter si multi-écran

      input = {
        kb_layout = "fr";                  # le clavier AZERTY, réglé ici (pas via services.xserver.xkb)
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
      };

      decoration = {
        rounding = 8;
        blur.enabled = true;
      };

      "$mod" = "SUPER";

      bind = [
        "$mod, Return, exec, kitty"                 # terminal (adapte à ton émulateur préféré)
        "$mod, Q, killactive"
        "$mod, E, exec, dolphin"                     # ou ton gestionnaire de fichiers
        "$mod, D, exec, wofi --show drun"            # lanceur d'applis
        "$mod, F, fullscreen"
        "$mod SHIFT, Q, exit"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
      ];

      exec-once = [
        "waybar"
        "hyprpaper"
      ];
    };
  };

  # Paquets complémentaires utiles avec Hyprland
  home.packages = with pkgs; [
    wofi        # lanceur d'applications
    hyprpaper   # fond d'écran
  ];

  programs.waybar.enable = true;   # barre de statut, en HM aussi
  wayland.windowManager.hyprland.systemd.enable = false;
}
