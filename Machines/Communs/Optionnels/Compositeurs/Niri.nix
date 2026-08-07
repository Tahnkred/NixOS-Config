{ config, inputs, pkgs, ... }:

{

    imports = [ inputs.niri.nixosModules.niri ];

    programs.niri = {
        enable = true;
        package = pkgs.niri-unstable;

        # settings = {
        #     input.keyboard.xkb.layout = "no";
        #     input.mouse.accel-speed = 1.0;

        #     input.touchpad = {
        #         tap = true;
        #         dwt = true;
        #         natural-scroll = true;
        #         click-method = "clickfinger";
        #         };

        #     input.mouse.accel-speed = 1.0;
            
        #     input.touchpad = {
        #         tap = true;
        #         dwt = true;
        #         natural-scroll = true;
        #         click-method = "clickfinger";
        #     };

        #     spawn-at-startup = [
        #         { argv = ["noctalia"]; }
        #     ];
        };
        
    };

#    systemd.user.services.niri.enableDefaultPath = false;

}