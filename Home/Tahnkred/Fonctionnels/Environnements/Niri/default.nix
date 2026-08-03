{ pkgs, ... }:
{
    xdg.configFile."niri/config.kdl".source = ./config.kdl;
  
    home.packages = with pkgs; [
        alacritty
        fuzzel
        swaybg
        wl-clipboard
    ];

    home.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        XDG_CURRENT_DESKTOP = "niri";
    };
}