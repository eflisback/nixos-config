{ config, lib, ... }:

{
  options.addons.steam.enable = lib.mkEnableOption "Steam";

  config = lib.mkIf config.addons.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
