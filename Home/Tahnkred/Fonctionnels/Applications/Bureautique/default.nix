{ pkgs, config, ... }:

{
    imports = [
        # ./Firefox.nix
        ./Zen-browser.nix
    ];
}