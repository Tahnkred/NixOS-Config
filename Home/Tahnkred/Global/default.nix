{ pkgs, ... }:
{
  imports =
    [
    ./Fonctionnels/Gestionnaires/sddm.nix
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  programs.home-manager.enable = true;

  home = {
    username = lib.mkDefault "tahnkred";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "26.05";
  };
  # Paquets installés dans le profil utilisateur
  #  imports = [
  #    ../../Modules/Applications/tahnkred
  #    ../../Modules/Environments/Plasma/Plasma.nix
  #  ];
}
