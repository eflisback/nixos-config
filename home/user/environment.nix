{ lib, ... }:
{
  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "codium";
    TERMINAL = "alacritty";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = lib.mkForce "kde";
    QT_SCALE_FACTOR = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    XCURSOR_SIZE = "24";
    GTK_THEME = "Catppuccin-Macchiato-Compact-Blue-Dark";
    XDG_CURRENT_DESKTOP = "KDE";
    XDG_SESSION_DESKTOP = "plasma";
    XDG_SESSION_TYPE = "wayland";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";

    # Force dark mode for applications
    GTK_APPLICATION_PREFER_DARK_THEME = "1";
    QT_STYLE_OVERRIDE = "adwaita-dark";
    XDG_CACHE_HOME = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    #XDG_BIN_HOME = "\${HOME}/.local/bin";
    XDG_DATA_HOME = "\${HOME}/.local/share";

  };
}
