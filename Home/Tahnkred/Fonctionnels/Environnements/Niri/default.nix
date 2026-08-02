{
 # programs.niri.enable = true;
  
 # home-manager.users.username = {
    programs.niri.settings = {
    #  input.keyboard.xkb.layout = "fr, mac";
        prefer-no-csd = true;

        spawn-at-startup = [
            { argv = ["waybar"]; }
            { argv = ["mako"]; }
            { argv = ["swaybg" "--image" "./test_background.jpg"]; }
        ];
    
        binds = {
            "Mod+D".action.spawn = "fuzzel";
             "Mod+T".action.spawn = "alacritty";
             "Mod+L".action.spawn = "swaylock";
        };
    
        # Enable Wayland native mode for Electron apps
        environment.NIXOS_OZONE_WL = "1";
    };
# };
}