{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
  };
  xdg.configFile."Code/User/argv.json".text = builtins.toJSON {
  password-store = "gnome-libsecret";
  };
}