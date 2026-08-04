{pkgs, inputs, ...}: {
  imports = [
    ../Global

    ../Fonctionnels/Applications/Bureautique
    ../Fonctionnels/Applications/Developpement
    ../Fonctionnels/Applications/Messageries/Vesktop.nix

    ../Fonctionnels/Environnements/Niri
  ];

  #  ------ 
  # | DP-1 |
  #  ------ 
 monitors = [
   {
     name = "DP-1";
     width = 1440;
     height = 900;
     workspace = "1";
     primary = true;
   }
 ];
}