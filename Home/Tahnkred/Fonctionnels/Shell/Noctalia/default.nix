{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # programs.noctalia = {
  #   enable = true;

  #   # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
  #   recommendedServices.enable = true;
  # };
}