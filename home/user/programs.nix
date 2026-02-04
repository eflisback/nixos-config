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

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      eamodio.gitlens
      jnoortheen.nix-ide
    ] ++ [
      (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          name = "synthwave-vscode";
          publisher = "RobbOwen";
          version = "0.1.15";
          sha256 = "sha256-bcjUWB0/agSoFAsFdh1a+RYOF12J2XQY3GCv400+Pb4=";
        };
      })
    ];
  };

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
