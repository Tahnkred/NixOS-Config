{ pkgs, config, ... }:

{
    imports = [
        ./git.nix
        ./vscode.nix
        ./fastfetch.nix
    ];
}