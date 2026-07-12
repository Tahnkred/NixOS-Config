{config, pkgs, ...}:
{
    programs.git = {
        enable = true;
        userName = "Tahnkred";
        userEmail = "70665792+Tahnkred@users.noreply.github.com";

  #  settings = {
  #      init.defaultBranch = "main";
  #      pull.rebase = false;
  #      core.editor = "vim";
  #  };
    };
}
