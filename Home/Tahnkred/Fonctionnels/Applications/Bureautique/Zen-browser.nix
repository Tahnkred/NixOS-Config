{ pkgs, config, inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.default
  ];

    
  programs.zen-browser = {
    enable = true;
    AutofillAddressEnabled = true;
    AutofillCreditCardEnabled = false;
    DisableAppUpdate = true;
    DisableFeedbackCommands = true;
    DisableFirefoxStudies = true;
    DisablePocket = true;
    DisableTelemetry = true;
    DontCheckDefaultBrowser = true;
    NoDefaultBookmarks = true;
    OfferToSaveLogins = false;
    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Cryptomining = true;
      Fingerprinting = true;
    };
  };
}

let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};

in {
  programs.zen-browser.profiles.default.extensions = {
    packages = with firefox-addons; [
      ublock-origin
    ];

    settings = {
      # uBlock Origin also accepts managed storage, see 04-extensions.nix.
      "uBlock0@raymondhill.net" = {
        force = true;
        settings.selectedFilterLists = [
          "user-filters"
          "ublock-filters"
          "ublock-badware"
          "ublock-privacy"
          "ublock-unbreak"
        ];
      };
    };
  };
}

