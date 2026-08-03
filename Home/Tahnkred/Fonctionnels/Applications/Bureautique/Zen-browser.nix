{ pkgs, config, ... }:
{
 imports = [
     inputs.zen-browser.homeModules.default
 ];
    # home.packages = with pkgs ; [zen-browser];
    
    programs.zen-browser = {
    #  enable = true;
      setAsDefaultBrowser = true;

      profiles.default.extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
      ublock-origin
      ];
  };
}
