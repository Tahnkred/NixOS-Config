{ pkgs, ... }:

{
  imports = [
    ./Auto-Upgrade.nix
    ./zramswap.nix
    ./Locale.nix
    ./Pipewire.nix
    ./Firewall.nix
    ./Flakes-support.nix
    ./Outdated-pkgs-support.nix
    ./NetworkManager.nix
    ./Printing-service.nix
    ./Console-keymap.nix
    ./Bootloader.nix
    ./Wireless-enable.nix
    ./Enable-all-firmware.nix
    ./Enable-touchpad-support.nix
    ./Proprietary-firmware-enable.nix
  ];
}
