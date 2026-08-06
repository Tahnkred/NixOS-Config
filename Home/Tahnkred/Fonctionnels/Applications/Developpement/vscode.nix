{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    argvSettings = {
      "password-store" = "gnome-keyring";
    };
  };
  # xdg.configFile."Code/User/argv.json".text = builtins.toJSON {
  # password-store = "gnome-libsecret";
  # };
}