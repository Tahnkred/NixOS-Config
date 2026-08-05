{ config, ... }:

{
#   programs.niri.enable = true;

#   services.greetd = {
#     enable = true;
#     settings = {
#       default_session = {
#         command = "${pkgs.greetd.regreet}/bin/regreet";
#         user = "greeter";
#       };
#     };
#   };

#   # Toujours nécessaire : NixOS injecte un PATH restreint sur l'unit
#   # niri.service qui écrase le PATH complet préparé par niri-session.
#   systemd.user.services.niri.enableDefaultPath = false;

####################################################################

programs.niri = {
    enable = true;
    settings = {
        prefer-no-csd = true;
        input.keyboard.xkb = with osConfig.services.xserver.xkb; {
            inherit layout variant options;
            };

        window-rules = [
        {
            matches = [{ app-id = "^(authentication-agent-1|pwvucontrol)$"; }];
            open-floating = true;
        }
        ];};
    };
# services.greetd = {
#  enable = true;
#  settings = {
#    default_session = {
#      command = "${config.programs.niri.package}/bin/niri-session";
#      user = "tahnkred";
#    };
#  };
# };

# NixOS otherwise injects a stripped PATH via Environment= on the niri.service
# unit which shadows the imported user-manager PATH. Disabling the default
# lets niri inherit the full PATH set up by niri-session.
systemd.user.services.niri.enableDefaultPath = false;

}