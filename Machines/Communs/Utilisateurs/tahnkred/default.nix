{ pkgs, config, lib,... }:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;

in
{
  users.users."tahnkred" = {
    isNormalUser = true;
    description = "Tancrède";
    extraGroups = ifTheyExist [ "networkmanager" "wheel" ];

    packages = [pkgs.home-manager];
  };
home-manager.users.tahnkred = import ../../../../Home/Tahnkred/Home-Machines/${config.networking.hostName}.nix;

home-manager.backupFileExtension = "backup";
}
