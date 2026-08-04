{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
  #  extensions = with pkgs.vscode-extensions; [
  #    dracula-theme.theme-dracula
  #    vscodevim.vim
  #    yzhang.markdown-all-in-one
  #  ];

    profiles.default.userSettings = {
      # Let niri draw the decorations instead of Electron's own title bar.
      "window.titleBarStyle" = "native";
    };
  };
}