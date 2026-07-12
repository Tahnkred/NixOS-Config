{ config, pkgs, ... }:

{
# Driver Broadcom pour le WiFi (pas supporté à ce jour)
  # boot.kernelModules = [ "b43" ];
  # networking.enableB43Firmware = true;

  # Configure keymap in X11
  services.xserver.xkb = {
  layout = "fr";
  variant = "mac";
  };
}
