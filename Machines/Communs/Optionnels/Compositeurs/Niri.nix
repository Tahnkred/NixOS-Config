{ config, inputs, pkgs, ... }:

{

    imports = [ inputs.niri.nixosModules.niri ];

    programs.niri = {
        enable = true;
        package = pkgs.niri-unstable;

    };

    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-gnome
        ];
    config.common.default = [ "gtk" ];
};

}