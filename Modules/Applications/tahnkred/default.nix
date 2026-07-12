{ pkgs, lib, ... }:

{
  imports = [
    ./Firefox.nix
    ./Vesktop.nix
    ./Zen-browser.nix
    ./git.nix
  ];
}
