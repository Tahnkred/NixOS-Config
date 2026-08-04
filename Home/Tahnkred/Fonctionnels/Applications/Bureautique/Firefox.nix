{ pkgs, lib, inputs, ... }:

{
    programs.firefox = {
      enable = true;
      profiles.default = {
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
      ublock-origin
    ];

      settings = {
        # Ask GTK to omit client-side decorations (respects niri's prefer-no-csd hint).
        "widget.gtk.suppress-client-decorations" = true;
        # Don't merge the tab bar into a native title bar either.
        "browser.tabs.inTitlebar" = 0;
      };
  };
};
}
