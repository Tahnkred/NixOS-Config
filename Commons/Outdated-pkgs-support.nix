{config, ...}:
{
  # Permission de paquets non sécurisés (actuellement Vesktop)
  nixpkgs.config.permittedInsecurePackages = [
    "pnpm-10.29.2"
    ];
}
