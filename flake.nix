{
  description = "Une configuration minimale de NixOS";

  nixConfig = {
    extra-substituters = [ 
      "https://noctalia.cachix.org"
      "https://niri.cachix.org"
    ];

    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      ];
  };

  inputs = {

    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    systems = {
      url = "github:nix-systems/default-linux";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

   niri = {
     url = "github:sodiboo/niri-flake";
     inputs.nixpkgs.follows = "nixpkgs";
   };

   noctalia = {
     url = "github:noctalia-dev/noctalia/cachix";
   };
      
 #   sops-nix = {
 #     url = "github:Mic92/sops-nix";
 #     inputs.nixpkgs.follows = "nixpkgs";
 #   };

  };
  # Merci Misterio77 pour avoir publié ta configuration Nix psk ça douille par ici...
  outputs = { self, nixpkgs, systems, nixos-hardware, home-manager, ... } @ inputs:
    let
      inherit (self) outputs;
      lib = let
        base = nixpkgs.lib // home-manager.lib;
        in base // {
          # Ici on peut rajouter des paramètres qui écrasent ceux de nixpkgs.lib et home-manager.lib (merci Misterio77).
        };

        forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
        pkgsFor = lib.genAttrs (import systems) (
          system:
            import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            }
        );
    in {
      inherit lib;
      nixosModules = import ./Modules/NixOS;
      homeManagerModules = import ./Modules/Home-Manager;

      overlays = import ./Overlays {inherit inputs outputs;};
    #  hydraJobs = import ./hydra.nix {inherit inputs outputs;};

    #  packages = forEachSystem (pkgs: import ./pkgs {inherit pkgs;});
    #  devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});
    #  formatter = forEachSystem (pkgs: pkgs.alejandra);

    nixosConfigurations = {

      gargantua = lib.nixosSystem {
        modules = [./Machines/Gargantua];
        specialArgs = {
          inherit inputs outputs;
        };
      };
      
      # Laptup inutile mais utile pour le test puisque les VM tournent MAL sur ma machine
      panurge = lib.nixosSystem {
        modules = [./Machines/Panurge];
        specialArgs = {
          inherit inputs outputs;
        };
      };

      vm = lib.nixosSystem {
        modules = [./Machines/VM];
        specialArgs = {
          inherit inputs outputs;
        };
      };
    };

    homeConfigurations = {};
  };

}
