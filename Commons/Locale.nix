{lib, ...}:
{
  i18n = {
    defaultLocale = lib.mkDefault "fr_FR.UTF-8";
    supportedLocales = lib.mkDefault [
      "fr_FR.UTF-8/UTF-8"
    ];
  };
  location.provider = "geoclue2";
  services.automatic-timezoned.enable = true;
  systemd.services.automatic-timezoned.serviceConfig.Restart = "always";
}
