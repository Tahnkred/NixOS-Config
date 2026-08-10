{lib, ...}:
{
  i18n = {
    defaultLocale = lib.mkDefault "fr_FR.UTF-8";
    supportedLocales = lib.mkDefault [
      "fr_FR.UTF-8/UTF-8"
    ];
  };
}
