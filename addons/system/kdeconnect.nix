{
  config,
  lib,
  ...
}:

{
  options.addons.kdeconnect.enable = lib.mkEnableOption "KDE Connect phone integration";

  config = lib.mkIf config.addons.kdeconnect.enable {
    # Installs the package and opens firewall ports 1714-1764.
    programs.kdeconnect.enable = true;

    home-manager.users.ebbe = {
      services.kdeconnect = {
        enable = true;
        indicator = true;
      };

      # HM provides tray.target; order it after the bar so the indicator finds a tray.
      systemd.user.targets.tray.Unit.After = [ "noctalia.service" ];
    };
  };
}
