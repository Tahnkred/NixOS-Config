{ config, pkgs, ... }:

{
    services.desktopManager.gnome.enable = true;
  #  services.displayManager.sddm.enable = true;
  #  services.displayManager.sddm.wayland.enable = true;
    services.displayManager.gdm.enable = true;

#environment.gnome.excludePackages = with pkgs; [
#  gnome-tour
#  gnome-console
#  gnome-text-editor
#  gnome-photos
#  gnome-connections
#  gnome-music
#  gnome-weather
#  gnome-maps
#  gnome-contacts
#  epiphany       # le navigateur GNOME Web
#  geary          # client mail
#  totem          # lecteur vidéo
#  simple-scan
#  cheese
#];
}
