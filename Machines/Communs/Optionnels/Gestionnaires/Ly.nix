{config, ...}:
{
   
    services.displayManager.ly = {
        enable = true;
        settings = {
            animation = "matrix";
            asterisk = "*";         # caractère affiché pour le mot de passe
            hide_borders = false;
            bigclock = "en";        # affiche une horloge XL
        };
    };
  

}