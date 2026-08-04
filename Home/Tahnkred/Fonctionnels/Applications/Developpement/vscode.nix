{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
  #  extensions = with pkgs.vscode-extensions; [
  #    dracula-theme.theme-dracula
  #    vscodevim.vim
  #    yzhang.markdown-all-in-one
  #  ];

    # Electron only asks the compositor for (server-side) decorations under
    # Wayland if the WaylandWindowDecorations Chromium feature is enabled.
    # Without this flag, "window.titleBarStyle": "native" below has no effect
    # and VSCode keeps drawing its own title bar with min/max/close buttons.
    package = pkgs.symlinkJoin {
      name = "vscode-wayland-decorations";
      paths = [ pkgs.vscode ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/code \
          --add-flags "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"
      '';
    };

    profiles.default.userSettings = {
      # Let niri draw the decorations instead of Electron's own title bar.
      "window.titleBarStyle" = "native";
    };
  };
}