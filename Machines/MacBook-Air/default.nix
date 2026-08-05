# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, ... }:

{

  imports = [
    inputs.nixos-hardware.nixosModules.apple-macbook-air-7
    ./hardware-configuration.nix

    ../Communs/Globaux
    ../Communs/Noyaux/Linux-latest.nix
    ../Communs/Utilisateurs/tahnkred

    ../Communs/Optionnels/Enable-touchpad-support.nix
    ../Communs/Optionnels/Printing-service.nix
    ../Communs/Optionnels/Zramswap.nix
  
    ../Communs/Optionnels/Gestionnaires/Ly.nix
    ../Communs/Optionnels/Compositeurs/Niri.nix
    ../Communs/Optionnels/Shell/Noctalia
  ];

  networking = {
    hostName = "macbook";
  #  useDHCP = true;
  };

  # Driver Broadcom pour le WiFi (pas supporté à ce jour)
  # boot.kernelModules = [ "b43" ];
  # networking.enableB43Firmware = true;

  # Configure keymap in X11 (je ne sais pas pourquoi mais c'est la seule façon de faire fonctionner le clavier correctement)
  services.xserver.xkb = {
  layout = "fr";
  variant = "mac";
  };
  boot.kernelParams = [ "hid_apple.fnmode=2" ];

  hardware.graphics.enable = true;
  
  powerManagement.powertop.enable = true;
  
  programs.dconf.enable = true;

system.stateVersion = "26.05";

}
