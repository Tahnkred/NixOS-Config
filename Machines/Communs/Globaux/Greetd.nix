{ config, lib, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session.command = "${pkgs.regreet}/bin/regreet";
      initial_session = {
        user = "tahnkred";
        command = "${pkgs.dbus}/bin/dbus-run-session /run/current-system/sw/bin/niri";
      };
    };
  };
}