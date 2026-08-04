{ pkgs, config, ...}:

{ # Vérifier si Vesktop a été mis à jour avec une version de pnpm invulnérable
  programs.vesktop = {
    enable = true;
  };
}
