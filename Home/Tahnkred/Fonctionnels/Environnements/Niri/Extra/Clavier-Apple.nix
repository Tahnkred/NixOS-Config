{ ... }:
{
  programs.niri.settings.binds = {
    # ---- Applications ----
    "Mod+T".action.spawn = [ "kitty" ];
    "Mod+D".action.spawn = [ "noctalia" "msg" "panel-toggle" "launcher" ];
    "Mod+E".action.spawn = [ "nautilus" ];

    # ---- Fermer une fenêtre ----
    "Mod+Q".action.close-window = {};

    # ---- Screenshots ----
    "Mod+P".action.screenshot = {};
    "Mod+Super+P".action.screenshot-screen = {};
    "Mod+Shift+Print".action.screenshot-window = {};

    # ---- Navigation entre fenêtres/colonnes (flèches + vim-style hjkl) ----
    "Mod+Left".action.focus-column-left = {};
    "Mod+Right".action.focus-column-right = {};
    "Mod+Up".action.focus-window-up = {};
    "Mod+Down".action.focus-window-down = {};
    "Mod+H".action.focus-column-left = {};
    "Mod+L".action.focus-column-right = {};
    "Mod+K".action.focus-window-up = {};
    "Mod+J".action.focus-window-down = {};

    # ---- Déplacer les fenêtres/colonnes ----
    "Mod+Shift+Left".action.move-column-left = {};
    "Mod+Shift+Right".action.move-column-right = {};
    "Mod+Shift+Up".action.move-window-up = {};
    "Mod+Shift+Down".action.move-window-down = {};

    # ---- Redimensionner une colonne ----
    "Mod+R".action.switch-preset-column-width = {};
    "Mod+Shift+R".action.reset-window-height = {};
    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Equal".action.set-column-width = "+10%";

    # ---- Plein écran / flottant ----
    "Mod+F".action.maximize-column = {};
    "Mod+Shift+F".action.fullscreen-window = {};
    "Mod+V".action.toggle-window-floating = {};

    # ---- Espaces de travail (comme les "Spaces" macOS) ----
    "Mod+1".action.focus-workspace = 1;
    "Mod+2".action.focus-workspace = 2;
    "Mod+3".action.focus-workspace = 3;
    "Mod+4".action.focus-workspace = 4;
    "Mod+5".action.focus-workspace = 5;
    "Mod+Shift+1".action.move-column-to-workspace = 1;
    "Mod+Shift+2".action.move-column-to-workspace = 2;
    "Mod+Shift+3".action.move-column-to-workspace = 3;
    "Mod+Shift+4".action.move-column-to-workspace = 4;
    "Mod+Shift+5".action.move-column-to-workspace = 5;
    "Mod+Page_Down".action.focus-workspace-down = {};
    "Mod+Page_Up".action.focus-workspace-up = {};

    # ---- Luminosité écran (F1/F2 sur clavier MacBook) ----
    "XF86MonBrightnessDown".action.spawn = [ "brightnessctl" "set" "5%-" ];
    "XF86MonBrightnessUp".action.spawn = [ "brightnessctl" "set" "+5%" ];

    # ---- Rétroéclairage clavier (F5/F6 sur clavier MacBook) ----
    "XF86KbdBrightnessDown".action.spawn = [ "brightnessctl" "--device=smc::kbd_backlight" "set" "5%-" ];
    "XF86KbdBrightnessUp".action.spawn = [ "brightnessctl" "--device=smc::kbd_backlight" "set" "+5%" ];

    # ---- Son (F10/F11/F12 sur clavier MacBook) ----
    "XF86AudioMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
    "XF86AudioLowerVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-" ];
    "XF86AudioRaiseVolume".action.spawn = [ "wpctl" "set-volume" "-l" "1.0" "@DEFAULT_AUDIO_SINK@" "5%+" ];

    # ---- F3 : afficher toutes les fenêtres (Mission Control)
    "XF86LaunchA".action.toggle-overview = {};

    # ---- F4 : lanceur d'app (Launchpad)
    "XF86LaunchB".action.spawn = [ "noctalia" "msg" "panel-toggle" "launcher" ];

    # ---- Verrouillage / sortie ----
    "Mod+Shift+E".action.quit = {};
    "Mod+Shift+P".action.power-off-monitors = {};
    "Mod+Ctrl+L".action.spawn = [ "swaylock" ];
  };
}
