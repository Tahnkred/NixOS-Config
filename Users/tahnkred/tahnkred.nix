{ config, ... }:
{
  users.users."tahnkred" = {
    isNormalUser = true;
    description = "Tancrède";
    extraGroups = [ "networkmanager" "wheel" ];
  };

}
