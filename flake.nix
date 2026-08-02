{
  description = "Une configuration minimale de NixOS";

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

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

 #   sops-nix = {
 #     url = "github:Mic92/sops-nix";
 #     inputs.nixpkgs.follows = "nixpkgs";
 #   };

  };
  # Merci Misterio77 pour avoir publié ta configuration Nix psk ça douille par ici...
  outputs = { self, nixpkgs, systems, nixos-hardware, home-manager, plasma-manager, ... } @ inputs:
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

    #  overlays = import ./overlays {inherit inputs outputs;};
    #  hydraJobs = import ./hydra.nix {inherit inputs outputs;};

    #  packages = forEachSystem (pkgs: import ./pkgs {inherit pkgs;});
    #  devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});
    #  formatter = forEachSystem (pkgs: pkgs.alejandra);

    nixosConfigurations = {
      # Laptup inutile mais utile pour le test puisque les VM tournent MAL sur ma machine
      macbook = lib.nixosSystem {
        modules = [./Machines/MacBook-Air];
        specialArgs = {
          inherit inputs outputs;
        };
      };
    };

    homeConfigurations = {};
  };

  #      system = "x86_64-linux";
  #      pkgs = nixpkgs.legacyPackages.${system};
  #      allowUnfree = { nixpkgs.config.allowUnfree = true; };

  #      modulesBase = [
  #        ./Commons
  #        ./Users
  #        ./Modules/Environments
  #      ];

  #    mkMachine = { hostname, users }:
  #      nixpkgs.lib.nixosSystem {
	#     inherit system;
	#     specialArgs = {inherit inputs system hostname nixos-hardware;};

	#     modules = modulesBase ++ [
	#          ./Machines
	#          allowUnfree
	#          home-manager.nixosModules.home-manager
	#          inputs.plasma-manager.homeModules.plasma-manager
  #            {
  #            home-manager.useGlobalPkgs = true;
  #            home-manager.useUserPackages = true;
  #            home-manager.extraSpecialArgs = { inherit inputs system hostname; };

  #            home-manager.sharedModules =
  #              nixpkgs.lib.optional
  #                (builtins.pathExists ./Machines/${hostname}/Home/Commun.nix)
  #                ./Machines/${hostname}/Home/Commun.nix;

  #            home-manager.users = nixpkgs.lib.genAttrs users (name:
  #              { lib, ...}:
  #              {
  #                imports = [ ./Users/${name}/home.nix ]
  #                  ++ lib.optional
  #                    (builtins.pathExists ./Machines/${hostname}/Home/${name}.nix)
  #                    ./Machines/${hostname}/Home/${name}.nix
  #              ;}
  #            );
  #            }
  #        ];
  #       };

  #    in
  #    {
  #    nixosConfigurations = {

  #      macbook = mkMachine {
  #        hostname = "macbook";
  #        users = [ "tahnkred" ];
  #      };

   #     bureau = mkMachine {
   #       hostname = "bureau";
   #       users = [ "tahnkred" ];
   #     };
  #    };
  #  };
}
