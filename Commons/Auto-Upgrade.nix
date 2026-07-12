{ config, pkgs, hostname, ... }:
{
  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    persistent = true;
    flake = "path:/home/tahnkred/Projets/Nix-Config#${hostname}";
    flags = [
      "--update-input" "nixpkgs"
      "--update-input" "home-manager"
      "--update-input" "zen-browser"
      "--update-input" "firefox-addons"
      "--update-input" "plasma-manager"
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    persistent = true;
    options = "--delete-older-than 10d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  services.fwupd.enable = true;

  systemd.services.fwupd-refresh = {
    description = "Rafraîchir les métadonnées fwupd";
    serviceConfig.Type = "oneshot";
    serviceConfig.ExecStart = "${pkgs.fwupd}/bin/fwupdmgr refresh --force";
  };

  systemd.timers.fwupd-refresh = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
  };

  systemd.timers.nix-optimise.timerConfig.Persistent = true;
}
