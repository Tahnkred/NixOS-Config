{ config, ... }:
{
  users.users."tahnkred" = {
    isNormalUser = true;
    description = "Tancrède";
    extraGroups = [ "networkmanager" "wheel" ];
  };
home-manager.users.tahnkred = import ../../Home/Tahnkred/Global/Machines/${config.networking.hostName}.nix;
}
