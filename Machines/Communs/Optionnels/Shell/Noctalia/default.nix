{ pkgs, config, inputs, ... }:
{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  programs.noctalia = {
    enable = true;

    # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
    recommendedServices.enable = true;
    systemd.enable = true;
  };

  # programs.noctalia.systemd.enable = true
}