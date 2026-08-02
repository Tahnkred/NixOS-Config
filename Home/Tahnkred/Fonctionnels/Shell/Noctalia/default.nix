{ pkgs, inputs, ... }:
{
  home-manager.users.foobar = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = {
        # configure options
      };
    };
  };
}