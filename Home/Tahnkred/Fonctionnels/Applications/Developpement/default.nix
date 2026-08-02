{ pkgs, config, ... }:

{
    imports = [
        ./git.nix
        ./vscode.nix
    ];
}