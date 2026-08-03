# Graphical greeter, hooks into greetd
{ pkgs, ... }:
{
  programs.regreet = {
    enable = true;
    package = pkgs.regreet;
    theme.name = "Adwaita";
    font.name = "Cantarell";
    font.size = 14;
  };
}
