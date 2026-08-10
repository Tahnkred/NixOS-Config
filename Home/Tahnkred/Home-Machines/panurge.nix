{pkgs, inputs, ...}: {
  imports = [
    ../Global

    ../Fonctionnels/Applications/Bureautique
    ../Fonctionnels/Applications/Developpement
    ../Fonctionnels/Applications/Messageries/Vesktop.nix

    ../Fonctionnels/Environnements/Niri
    ../Fonctionnels/Environnements/Niri/Extra/Clavier-Apple.nix
    ../Fonctionnels/Shell/Noctalia
  ];

  #  ------ 
  # | DP-1 |
  #  ------ 
 monitors = [
   {
     name = "eDP-1";
     width = 1440;
     height = 900;
     workspace = "1";
     primary = true;
   }
 ];
}