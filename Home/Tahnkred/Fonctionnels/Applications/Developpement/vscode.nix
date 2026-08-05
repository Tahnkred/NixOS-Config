{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    argvSettings = {
      "password-store" = "gnome-keyring";
      "enable-crash-reporter" = false;
    };
  };
  # xdg.configFile."Code/User/argv.json".text = builtins.toJSON {
  # password-store = "gnome-libsecret";
  # };
}