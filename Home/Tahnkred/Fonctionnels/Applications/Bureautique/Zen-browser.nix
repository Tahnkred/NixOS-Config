{ pkgs, config, inputs, ... }:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};

  # Onglets épinglés (voir examples/10-pinned-tabs.nix du flake).
  # Chaque pin a besoin d'un id (UUID stable que tu inventes) pour être
  # reconnu à chaque rebuild sans être recréé/dupliqué.
  pins = {
    "YouTube" = {
      id = "b4a82b48-8254-4e98-b376-c55ed78fe1ea";
      url = "https://www.youtube.com/";
      position = 101;
      isEssential = true;
    };
    "iCloud" = {
      id = "5db0dfb1-1dab-4a27-832b-cb84e4e68fde";
      url = "https://www.icloud.com/";
      position = 102;
      isEssential = true;
    };
    "Twitter" = {
      id = "2d36fa9e-6d6e-4f10-8707-f5394d51764f";
      url = "https://x.com/home";
      position = 103;
      isEssential = true;
    };
    "Notion" = {
      id = "86acad07-7a25-4f06-b505-76bf60aa8513";
      url = "https://app.notion.com/";
      position = 104;
      isEssential = true;
    };
    "Freebox" = {
      id = "23d7288b-8254-47bf-9d97-5d7449f7786f";
      url = "https://mafreebox.freebox.fr";
      position = 105;
      isEssential = true;
    };
    "Claude" = {
      id = "b8a512bc-d3db-4b72-875b-9ecd40da401a";
      url = "https://claude.ai/";
      position = 106;
      isEssential = true;
    };
    "MCSManager Panel" = {
      id = "bcc9781c-4b4a-48ce-8419-39388443e8e0";
      url = "https://mc.glow-up.dev/#/instances/terminal";
      position = 107;
      isEssential = true;
    };
    "Minecraft PD" = {
      id = "ad313678-a13a-4d87-bb32-14c0e9f4b042";
      url = "https://dynmap.glow-up.dev/";
      position = 108;
      isEssential = true;
    };
    "GitHub" = {
      id = "2eb34786-9e3c-4986-89a1-902aca98a013";
      url = "https://github.com/Tahnkred/";
      position = 109;
      isEssential = true;
    };
  };
in
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

    # Épingle uBlock Origin dans la barre d'outils (navbar) dès l'installation,
    # au lieu de devoir cliquer sur "Pin to Toolbar" manuellement.
    ExtensionSettings = {
      "uBlock0@raymondhill.net".default_area = "navbar";
    };

    profiles.default = {
      extensions = {
        packages = with firefox-addons; [
          ublock-origin
        ];

        settings = {
          # uBlock Origin accepte aussi le "managed storage", voir 04-extensions.nix.
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

      pinsForce = true;
      pinsForceAction = "remove";
      inherit pins;
    };
  };
}
