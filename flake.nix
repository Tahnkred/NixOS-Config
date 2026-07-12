{
  description = "Une configuration minimale de NixOS";

  inputs = {

    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
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

 #   sops-nix = {
 #     url = "github:Mic92/sops-nix";
 #     inputs.nixpkgs.follows = "nixpkgs";
 #   };

  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, plasma-manager, ... } @ inputs:
    let
    	system = "x86_64-linux";
    	pkgs = nixpkgs.legacyPackages.${system};
        allowUnfree = { nixpkgs.config.allowUnfree = true; };

        modulesBase = [
          ./Commons
          ./Users
          ./Modules/Environments
        ];

      mkMachine = { hostname, users }:
        nixpkgs.lib.nixosSystem {
	     inherit system;
	     specialArgs = {inherit inputs system hostname nixos-hardware;};

	     modules = modulesBase ++ [
	          ./Machines
	          allowUnfree
	          home-manager.nixosModules.home-manager
	        #  inputs.plasma-manager.homeModules.plasma-manager
              {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs system hostname; };

              home-manager.sharedModules =
                nixpkgs.lib.optional
                  (builtins.pathExists ./Machines/${hostname}/Home/Commun.nix)
                  ./Machines/${hostname}/Home/Commun.nix;

              home-manager.users = nixpkgs.lib.genAttrs users (name:
                { lib, ...}:
                {
                  imports = [ ./Users/${name}/home.nix ]
                    ++ lib.optional
                      (builtins.pathExists ./Machines/${hostname}/Home/${name}.nix)
                      ./Machines/${hostname}/Home/${name}.nix
                ;}
              );
              }
          ];
         };

      in
      {
      nixosConfigurations = {

        macbook = mkMachine {
          hostname = "macbook";
          users = [ "tahnkred" ];
        };

   #     bureau = mkMachine {
   #       hostname = "bureau";
   #       users = [ "tahnkred" ];
   #     };
      };
    };
}
