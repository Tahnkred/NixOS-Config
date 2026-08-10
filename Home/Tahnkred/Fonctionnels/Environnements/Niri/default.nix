{ pkgs, config, inputs, ... }:
{
 
    programs.kitty.enable = true;# Super+T in the default setting (terminal)
   
    services.polkit-gnome.enable = true; # polkit
    services.gnome-keyring.enable = true; 

    home.packages = with pkgs; [
        wl-clipboard
        nautilus
        # xwayland-satellite-unstable
        gcr 
        libsecret
        brightnessctl
        ddcutil
        playerctl
        wev
    ];

    programs.niri.settings = {
            prefer-no-csd = true;

            input.mouse.accel-speed = 1.0;

            input.touchpad = {
                tap = true;
                dwt = true;
                natural-scroll = true;
                click-method = "clickfinger";
                };


            spawn-at-startup = [
                { argv = ["noctalia"]; }
            ];
            window-rules = [
            {
            matches = [{ app-id = "^(authentication-agent-1|pwvucontrol)$"; }];
            open-floating = true;
            }
            ];};

    home.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };
}