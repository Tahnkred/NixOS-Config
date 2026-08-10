{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    argvSettings = {
      "password-store" = "gnome-libsecret";
    };
  };
  # xdg.configFile."Code/User/argv.json".text = builtins.toJSON {
  # password-store = "gnome-libsecret";
  # };
}