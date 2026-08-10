{
  inputs,
  libs,
  pkgs,
  ...
}: {
  imports = [
    inputs.sidra.packages.homeModules.default
  ];

  programs.sidra = {
    enable = true;
    
  };
}
