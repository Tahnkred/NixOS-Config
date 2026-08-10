{pkgs, inputs, ...}: {
  imports = [
    ../Global

    ../Fonctionnels/Applications/Bureautique
    ../Fonctionnels/Applications/Developpement
    ../Fonctionnels/Applications/Divertissement/Vesktop.nix
    ../Fonctionnels/Applications/Divertissement/Sidra.nix

    ../Fonctionnels/Environnements/Niri
    ../Fonctionnels/Environnements/Niri/Extra/Clavier-Apple.nix
    ../Fonctionnels/Shell/Noctalia
  ];

  #  ------ 
  # | DP-1 |
  #  ------ 
 monitors = [
   {
     name = "DP-1";
     width = 1920;
     height = 1080;
     workspace = "1";
     primary = true;
     refreshRate = 144;
   }
 ];
}