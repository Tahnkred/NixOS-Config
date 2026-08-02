{ pkgs, ... }:

{
    home-manager.users.tahnkred.services.desktopManager.plasma6.enable = true;
    #services.displayManager.sddm.enable = true;

  #  environment.plasma6.excludePackages = with pkgs.kdePackages; [

        # Application integration
   #     libplasma # provides Kirigami platform theme
   #     plasma-integration # provides Qt platform theme
   #     kde-gtk-config # syncs KDE settings to GTK

        # Artwork + themes
   #     breeze
   #     breeze-icons
   #     breeze-gtk
   #     ocean-sound-theme
   #     pkgs.hicolor-icon-theme # fallback icons
   #     qqc2-breeze-style
   #     qqc2-desktop-style

        # misc Plasma extras
   #     kdeplasma-addons
   #     pkgs.xdg-user-dirs # recommended upstream

        # Plasma utilities
   #     kmenuedit
   #     kinfocenter
   #     plasma-systemmonitor
   #     ksystemstats
   #     libksysguard
   #     systemsettings
   #     kcmutils

       #Paquets optionnels
   #     aurorae
   #     plasma-browser-integration
   #     plasma-workspace-wallpapers
   #     konsole
   #     kwin-x11
   #     (lib.getBin qttools) # Expose qdbus in PATH
   #     ark
   #     elisa
   #     gwenview
   #     okular
   #     kate
   #     ktexteditor # provides elevated actions for kate
   #     khelpcenter
   #     dolphin
   #     baloo-widgets # baloo information in Dolphin
   #     dolphin-plugins
   #     spectacle
   #     ffmpegthumbs
   #     krdp
   #  ];
}
