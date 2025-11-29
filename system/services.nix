{ config, pkgs, ... }:

{
  services = {
    dbus.enable = true;
    openssh.enable = true;
    spice-vdagentd.enable = true;

    xserver = {
      enable = true;
      xkb.layout = "se";
    };

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-user-session --cmd Hyprland";
          user = "greeter";
        };
      };
    };
  };
}
