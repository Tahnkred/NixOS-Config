{ config, lib, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session.command = ''
        ${pkgs.regreet}/bin/regreet --cmd /run/current-system/sw/bin/niri
      '';
    };
  };
}