{ hostname, ... }:

{
  imports =
    if hostname == "macbook" then
      [ ./Plasma/6/Plasma6.nix
       # ./GNOME/gnome.nix

      ]
    else if hostname == "desktop" then
      [ ./Plasma/6/Plasma6.nix ]
    else
      [ ./GNOME/gnome.nix ];
}
