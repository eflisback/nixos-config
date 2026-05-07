{ config, pkgs, ... }:

{
  services = {
    dbus.enable = true;
    openssh.enable = true;
    spice-vdagentd.enable = true;

    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };

    xserver = {
      enable = true;
      xkb.layout = "se";
    };

    power-profiles-daemon.enable = true;
    upower.enable = true;
  };
}
