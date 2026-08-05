{ inputs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./Bootloader.nix
    ./Console-keymap.nix
    ./Firewall.nix
    ./Locale.nix
    ./NetworkManager.nix
    ./Nix.nix
    ./Pipewire.nix
  ]
  ++ (builtins.attrValues outputs.nixosModules);

  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };

  nixpkgs = {
    #overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        # RS3
        "pnpm-10.29.2"
      ];
    };
  };

  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;

}
