{pkgs, ...}:
{
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;      # Steam Remote Play
        dedicatedServer.openFirewall = true; # Serveurs dédiés hébergés localement
        gamescopeSession.enable = true;      # Session Gamescope (mode "Big Picture" compositor)
};
}