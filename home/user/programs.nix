{ inputs, pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    # SETUP - ersätt 'ebbe' med 'olle', eventuellt konfigurera Firefox
    profiles.ebbe = {
      id = 0;
      isDefault = true;
      # settings = {
      #
      # };
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

  xdg.configFile."mimeapps.list".force = true;

  programs.home-manager.enable = true;

  # programs.obs-studio = {
  #   enable = true;

  #   # NVIDIA hardware acceleration
  #   package = (
  #     pkgs.obs-studio.override {
  #       cudaSupport = true;
  #     }
  #   );

  #   plugins = with pkgs.obs-studio-plugins; [
  #     wlrobs
  #     obs-backgroundremoval
  #     obs-pipewire-audio-capture
  #     obs-vaapi
  #     obs-gstreamer
  #     obs-vkcapture
  #   ];
  # };
}
