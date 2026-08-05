{
  inputs,
  libx,
  pkgs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.default
    ./xdg.nix
  ];

  programs.zen-browser = {
    enable = true;
    languagePacks = ["fr-FR"];
    policies = import ./policies-config.nix;

    profiles.default = rec {
      settings = {
        "zen.workspaces.continue-where-left-off" = true;
        "zen.workspaces.natural-scroll" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.view.compact.hide-toolbar" = true;
        "zen.view.compact.animate-sidebar" = false;
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";
      };

      # mods = [
      #   "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
      #   "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
      #   "c6813222-6571-4ba6-8faf-58f3343324f6" # Disable Rounded Corners
      #   "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
      #   "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
      #   "cb15abdb-0514-4e09-8ce5-722cf1f4a20f" # Hide Extension Name
      #   "803c7895-b39b-458e-84f8-a521f4d7a064" # Hide Inactive Workspaces
      #   "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8" # No Sidebar Scrollbar
      #   "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
      #   "c8d9e6e6-e702-4e15-8972-3596e57cf398" # Zen Back Forward
      # ];

      # bookmarks = {
      #   force = true;
      #   settings = [
      #     {
      #       name = "encore";
      #       tags = ["encore" "k9"];
      #       keyword = "encore";
      #       url = libx.base64.decode "aHR0cHM6Ly9hcHAuZW5jb3JlLmNsb3VkL2dhdGUtazktbXpuaQo=";
      #     }
      #     {
      #       name = "kernel.org";
      #       url = "https://www.kernel.org";
      #     }
      #     {
      #       name = "orders";
      #       url = "https://www.aliexpress.com/p/order/index.html";
      #       keyword = "orders";
      #     }
      #     {
      #       name = "s3";
      #       url = "https://sa-east-1.console.aws.amazon.com/s3/buckets?region=sa-east-1";
      #       keyword = "s3";
      #     }
      #     {
      #       name = "iam";
      #       url = "https://us-east-1.console.aws.amazon.com/iam/home?region=sa-east-1";
      #       keyword = "iam";
      #     }
      #   ];
      # };

      search = import ./search-config.nix {inherit pkgs;};

      pinsForce = true;
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

      # containersForce = true;
      # containers = {
      #   Shopping = {
      #     color = "yellow";
      #     icon = "dollar";
      #     id = 2;
      #   };
      # };

      # spacesForce = true;
      # spaces = {
      #   "Rendezvous" = {
      #     id = "572910e1-4468-4832-a869-0b3a93e2f165";
      #     icon = "🎭";
      #     position = 1000;
      #     theme = {
      #       type = "gradient";
      #       colors = [
      #         {
      #           red = 123;
      #           green = 56;
      #           blue = 58;
      #           algorithm = "analogous";
      #           type = "explicit-lightness";
      #           lightness = 35;
      #           position.x = 301;
      #           position.y = 176;
      #           primary = true;
      #           custom = false;
      #         }
      #         {
      #           red = 123;
      #           green = 110;
      #           blue = 55;
      #           algorithm = "analogous";
      #           type = "explicit-lightness";
      #           lightness = 35;
      #           position.x = 260;
      #           position.y = 271;
      #           primary = false;
      #           custom = false;
      #         }
      #         {
      #           red = 122;
      #           green = 56;
      #           blue = 114;
      #           algorithm = "analogous";
      #           type = "explicit-lightness";
      #           lightness = 35;
      #           position.x = 255;
      #           position.y = 84;
      #           primary = false;
      #           custom = false;
      #         }
      #       ];
      #       opacity = 0.8;
      #       texture = 0.5;
      #     };
      #   };
      #   "Research" = {
      #     id = "ec287d7f-d910-4860-b400-513f269dee77";
      #     icon = "💌";
      #     position = 1001;
      #     theme = {
      #       type = "gradient";
      #       colors = [
      #         {
      #           red = 171;
      #           green = 219;
      #           blue = 227;
      #           algorithm = "floating";
      #           type = "explicit-lightness";
      #         }
      #       ];
      #       opacity = 0.2;
      #       texture = 0.5;
      #     };
      #   };
      #   "Shopping" = {
      #     id = "2441acc9-79b1-4afb-b582-ee88ce554ec0";
      #     icon = "💸";
      #     container = containers."Shopping".id;
      #     position = 1002;
      #   };
      # };

      # keyboardShortcutsVersion = 13;
      # keyboardShortcuts = [
      #   {
      #     id = "zen-compact-mode-toggle";
      #     key = "c";
      #     modifiers.control = true;
      #     modifiers.alt = true;
      #   }
      #   {
      #     id = "zen-toggle-sidebar";
      #     key = "x";
      #     modifiers.control = true;
      #     modifiers.alt = true;
      #   }
      #   {
      #     id = "key_savePage";
      #     key = "s";
      #     modifiers.control = true;
      #   }
      #   {
      #     id = "key_quitApplication";
      #     disabled = true;
      #   }
      # ];
    };
  };
}
