{
  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "codium";
    TERMINAL = "kitty";
    XCURSOR_SIZE = "24";

    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";

    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_SCALE_FACTOR = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_STYLE_OVERRIDE = "adwaita-dark";

    GTK_APPLICATION_PREFER_DARK_THEME = "1";

    XDG_CACHE_HOME = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_DATA_HOME = "\${HOME}/.local/share";
  };

  # home.sessionVariables above only reach login shells (via hm-session-vars.sh),
  # not `systemd --user`. Under UWSM the compositor, the noctalia bar/launcher, and
  # everything the launcher spawns run as systemd user services, so they never see
  # those vars.
  xdg.configFile."environment.d/10-wayland.conf".text = ''
    NIXOS_OZONE_WL=1
    MOZ_ENABLE_WAYLAND=1
  '';
}
