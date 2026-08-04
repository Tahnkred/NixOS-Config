{ pkgs, config, ...}:

{
  programs.vesktop = {
    enable = true;
    settings = {
      customTitleBar = false;
    };
  };
}
