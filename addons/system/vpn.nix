{ config, lib, ... }:

{
  options.addons.vpn.enable = lib.mkEnableOption "VPN";

  config = lib.mkIf config.addons.vpn.enable {
    services.mullvad-vpn = {
      enable = true;
      gui.enable = true;
    };
  };
}
