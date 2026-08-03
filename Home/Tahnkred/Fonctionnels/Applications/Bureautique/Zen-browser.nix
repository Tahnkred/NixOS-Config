{ pkgs, inputs, ... }:
{
#  imports = [
#      inputs.zen-browser.homeModules.default
#  ];
    home.packages = [pkgs.inputs.zen-browser.default];
    
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;

      profiles.default.extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
      ublock-origin
      ];
  };
}
