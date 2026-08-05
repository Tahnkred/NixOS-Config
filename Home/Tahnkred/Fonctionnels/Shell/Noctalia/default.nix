{ pkgs, config, ... }:
{
    imports = [
      inputs.noctalia.homeModules.default
    ];
    
    programs.noctalia.settings = {
        theme = "Noctalia";
        accent = "Noctalia";
        font = "FiraCode Nerd Font";
        font-size = 12;
    };
}