{ config, inputs, pkgs, ... }:

{

    imports = [ inputs.niri.nixosModules.niri ];

    programs.niri = {
        enable = true;
        package = pkgs.niri-unstable;
        settings = {
            prefer-no-csd = true;

            # keyboard.xkb.layout = "no";
            mouse.accel-speed = 1.0;

            touchpad = {
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
    };

#    systemd.user.services.niri.enableDefaultPath = false;

}