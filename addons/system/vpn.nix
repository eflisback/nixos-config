{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.addons.vpn.enable = lib.mkEnableOption "VPN";

  config = lib.mkIf config.addons.vpn.enable {
    services.mullvad-vpn = {
      enable = true;
      gui.enable = true;
    };

    networking.networkmanager.plugins = [ pkgs.networkmanager-openconnect ];
    environment.systemPackages = [ pkgs.openconnect ];

    networking.networkmanager.ensureProfiles.profiles.lu-vpn = {
      connection = {
        id = "LU VPN";
        type = "vpn";
        autoconnect = false;
      };
      vpn = {
        service-type = "org.freedesktop.NetworkManager.openconnect";
        protocol = "fortinet";
        gateway = "vpn.lu.se:443";
        authtype = "password";
        # flags=2: never store, always prompt
        cookie-flags = 2;
        gateway-flags = 2;
        gwcert-flags = 2;
      };
      ipv4.method = "auto";
      ipv6.method = "auto";
    };
  };
}
