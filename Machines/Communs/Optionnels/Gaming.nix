{ pkgs, ... }:
{
  # Support 32-bit indispensable pour Steam/Proton sur AMD
  hardware.graphics.enable32Bit = true;

  programs.gamemode.enable = true; # Optimise perfs CPU/GPU pendant le jeu

  environment.systemPackages = with pkgs; [
    mangohud     # Overlay FPS/perf en jeu
    protonup-qt  # Gestion des versions Proton-GE custom
    lutris       # Launcher multi-plateformes (Epic, GOG, Battle.net via Wine)
  ];

  security.polkit.enable = true; # requis si tu ajoutes corectrl

# CoreCtrl pour l'overclocking/fan curves AMD en GUI (optionnel)
  environment.systemPackages = [ pkgs.corectrl ];
  security.polkit.enable = true; # requis si tu ajoutes corectrl
}