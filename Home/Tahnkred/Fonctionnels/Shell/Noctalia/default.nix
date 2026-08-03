# { pkgs, config, ... }:
# {
# #  imports = [
# #    inputs.noctalia.homeModules.default
# #  ];

# #  home.packages = [pkgs.inputs.noctalia.default];
#   home.packages = with pkgs ; [noctalia];

#   programs.noctalia = {
#   #  enable = true;
#     settings = {

#     };
#   };
# }

{ inputs, ... }:
{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  programs.noctalia = {
    enable = true;

    # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
    recommendedServices.enable = true;
  };
}