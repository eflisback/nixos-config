{ config, pkgs, ... }:

let
  sessions = "${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --sessions ${sessions}";
        user = "greeter";
      };
    };
  };
}
