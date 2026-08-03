# { config, lib, pkgs, ... }:
# {
#   users.users.greeter = {
#     extraGroups = [ "seat" ];
#   };

#   services = {
#     seatd.enable = true;
#     seatd.keyMap = "fr";
#     greetd = {
#       enable = true;
#       settings = {
#         greeter = "${pkgs.regreet}/bin/regreet";
#         default_session.command = lib.mkOverride 1499 "${pkgs.dbus}/bin/dbus-run-session -- /run/current-system/sw/bin/niri";
#       };
#     };
#   };
# }

{ config, lib, pkgs, ... }:
{
  users.users.greeter.extraGroups = [ "seat" ];

  services = {
    seatd.enable = true;
    greetd = {
      enable = true;
      settings.default_session.command =
        "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --remember --cmd \\$SHELL";
    };
    displayManager = {
      enable = true;
      sessionPackages = lib.flatten (
        lib.mapAttrsToList (_: v: v.home.exportedSessionPackages) config.home-manager.users
      );
    };
  };
}