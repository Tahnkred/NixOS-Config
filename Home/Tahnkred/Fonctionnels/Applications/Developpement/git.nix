{config, pkgs, ...}:
{
    programs.git = {
        enable = true;
        settings.user = {
            name = "Tahnkred";
            email = "70665792+Tahnkred@users.noreply.github.com";
        };
    };
}
