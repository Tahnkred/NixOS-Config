{ lib, config, outputs, ... }:
{
  imports =
    [
    ./Nix.nix
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  programs.home-manager.enable = true;

  home = {
    username = lib.mkDefault "tahnkred";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "26.05";
  };

}
