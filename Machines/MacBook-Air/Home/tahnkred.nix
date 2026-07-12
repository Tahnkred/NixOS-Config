{ pkgs, inputs, ... }:
{
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  programs.plasma = {
    enable = true;
    # ex de config :
    # workspace.theme = "breeze-dark";
    # panels = [ ... ];
    # shortcuts = { ... };
  };
}
