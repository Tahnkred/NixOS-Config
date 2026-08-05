{ pkgs, config, inputs, ... }:
{
    imports = [
        inputs.niri.homeModules.niri
    ];
    # xdg.configFile."niri/config.kdl".source =
    #   config.lib.file.mkOutOfStoreSymlink
    #     "${config.home.homeDirectory}/NixOS-Config/Home/Tahnkred/Fonctionnels/Environnements/Niri/config.kdl";
  
    programs.alacritty.enable = true;
    programs.kitty.enable = true;# Super+T in the default setting (terminal)
    # programs.fuzzel.enable = true; # Super+D in the default setting (app launcher)
    # programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
    # services.swayidle.enable = true; # idle management daemon
    # services.polkit-gnome.enable = true; # polkit
    # services.gnome-keyring.enable = true; 

    home.packages = with pkgs; [
        # fuzzel
        # swaylock
        # swayidle
        wl-clipboard
        # pcmanfm
        # polkit_gnome
        # xwayland-satellite-unstable
        # gcr 
        # libsecret    
        # wayland-utils
    ];

    nixpkgs.overlays = [ inputs.niri.overlays.niri ];
    programs.niri = {
        package = pkgs.niri-unstable;
        settings = {
            prefer-no-csd = true;
            # input.keyboard.xkb = with osConfig.services.xserver.xkb; {
            #     inherit layout variant options;
            # };
            window-rules = [
            {
            matches = [{ app-id = "^(authentication-agent-1|pwvucontrol)$"; }];
            open-floating = true;
            }
            ];};
    };

    home.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        XDG_CURRENT_DESKTOP = "niri";
    };
}