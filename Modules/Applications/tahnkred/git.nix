{config, pkgs, home-manager, ...}:
{
    programs.git = {
        enable = true;
       # userName = "Ton Nom";
       # userEmail = "ton.email@example.com";

    settings = {
        init.defaultBranch = "main";
        pull.rebase = false;
        core.editor = "vim";
    };
    };
}
