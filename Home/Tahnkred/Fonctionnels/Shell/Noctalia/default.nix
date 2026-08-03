{ pkgs, config, ... }:
{
#  imports = [
#    inputs.noctalia.homeModules.default
#  ];

#  home.packages = [pkgs.inputs.noctalia.default];
  home.packages = with pkgs ; [noctalia];

  programs.noctalia = {
  #  enable = true;
    settings = {

    };
  };
}