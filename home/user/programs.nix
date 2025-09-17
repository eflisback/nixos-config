{ inputs, pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    profiles.ebbe = {
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        darkreader
        facebook-container
        i-dont-care-about-cookies
        proton-pass
        to-google-translate
        view-image
        ublock-origin
        youtube-shorts-block
      ];

      settings = {
        # Enable dark mode preferences
        "ui.systemUsesDarkTheme" = 1;
        "layout.css.prefers-color-scheme.content-override" = 0;

        # Use system theme for Firefox interface
        "extensions.activeThemeID" = "default-theme@mozilla.org";
        "browser.theme.dark-private-windows" = true;

        # Dark scrollbars
        "widget.content.gtk-theme-override" = "Adwaita:dark";
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
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

}
