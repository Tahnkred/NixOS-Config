{ config, inputs, pkgs, ... }:

{

    imports = [ inputs.niri.nixosModules.niri ];

    programs.niri = {
        enable = true;
        package = pkgs.niri-unstable;
        
    };

#    systemd.user.services.niri.enableDefaultPath = false;

}