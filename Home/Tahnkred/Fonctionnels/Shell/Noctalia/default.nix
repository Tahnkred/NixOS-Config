{ pkgs, inputs, ... }:
{
#  imports = [
#    inputs.noctalia.homeModules.default
#  ];

  home.packages = [pkgs.inputs.noctalia.default];

  programs.noctalia = {
  #  enable = true;
    settings = {

    };
  };
}