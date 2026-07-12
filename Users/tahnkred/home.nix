{ pkgs, ... }:
{
  # Obligatoires pour tout profil Home Manager
  home.username = "tahnkred";
  home.homeDirectory = "/home/tahnkred";
  home.stateVersion = "26.05";

  # Paquets installés dans le profil utilisateur
    imports = [
      ../../Modules/Applications/tahnkred
    #  ../../Modules/Environments/Plasma/Plasma.nix
    ];

  #  modules = [
  #    ../../Modules/Environments/Plasma/Plasma.nix
  #  ];


  # Laisse Home Manager se gérer lui-même
  programs.home-manager.enable = true;
}
