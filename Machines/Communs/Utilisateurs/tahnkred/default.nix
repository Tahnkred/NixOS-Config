{ config, ... }:
{
  users.users."tahnkred" = {
    isNormalUser = true;
    description = "Tancrède";
    extraGroups = ifTheyExist [ "networkmanager" "wheel" ];

    packages = [pkgs.home-manager];
  };
home-manager.users.tahnkred = import ../../../../Home/Tahnkred/Home-Machines/${config.networking.hostName}.nix;
}
