{pkgs, ...}:
{
    services.xserver.enable = true;
    services.displayManager.sddm.wayland.enable = true;
}
