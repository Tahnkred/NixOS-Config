{config, hostname, nixos-hardware, ...}:
{
imports =
    if hostname == "macbook" then
      [ ./MacBook-Air/configuration.nix
        ./MacBook-Air/hardware-configuration.nix
        ./MacBook-Air/MacBook-Air-2017.nix
        ../Commons/Kernel/Linux-zen.nix
        ../Commons/Display-managers/sddm.nix
        nixos-hardware.nixosModules.apple-macbook-air-7
      ]
#    else if hostname == "desktop" then
#      [ ./Plasma/6/Plasma6.nix ]
    else
      [ ];
}
