{ config, lib, pkgs, ... }:
{
  users.users.greeter = {
    extraGroups = [ "seat" ];
  };

  services = {
    seatd.enable = true;
    greetd = {
      enable = true;
      settings = {
        greeter = "${pkgs.regreet}/bin/regreet";
        default_session.command = lib.mkOverride 1499 "/run/current-system/sw/bin/niri";
      };
    };
  };
}