{ inputs, lib, ... }:

let
  flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;

in {
    nix = {
        settings = {
            extra-substituters = lib.mkAfter [
                "https://noctalia.cachix.org"
                "https://niri.cachix.org"
                ];
            extra-trusted-public-keys = [
                "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
                "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
                ];

            trusted-users = [
                "root"
                "@wheel"
            ];

        auto-optimise-store = lib.mkDefault true;
        experimental-features = [
            "nix-command"
            "flakes"
            "ca-derivations"
        ];

     warn-dirty = false;

     system-features = [
       "kvm"
       "big-parallel"
       "nixos-test"
     ];
     flake-registry = ""; # Disable global flake registry
    };

    gc = {
        automatic = true;
        dates = "daily";
        # Keep generations from the past week
        options = "--delete-older-than 7d";
    };

    # Add each flake input as a registry and nix_path
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };
}