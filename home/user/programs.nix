{ inputs, pkgs, ... }:
{
  # Application configurations managed by Home-Manager.
  # These generate config files declaratively instead of manual editing.
  programs.firefox = {
    enable = true;

    profiles.ebbe = {
      settings = {
        # Enable dark mode preferences
        "ui.systemUsesDarkTheme" = 1;
        "layout.css.prefers-color-scheme.content-override" = 0;

        # Use system theme for Firefox interface
        "extensions.activeThemeID" = "default-theme@mozilla.org";
        "browser.theme.dark-private-windows" = true;
      };
    };
  };

  programs.home-manager.enable = true;

  programs.obs-studio = {
    enable = true;

    # optional Nvidia hardware acceleration
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi
      obs-gstreamer
      obs-vkcapture
    ];
  };

}
