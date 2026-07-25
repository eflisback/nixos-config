{ config, lib, ... }:

{
  options.addons.docker.enable = lib.mkEnableOption "Docker";

  config = lib.mkIf config.addons.docker.enable {
    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
    };

    users.users.ebbe.extraGroups = [ "docker" ];
  };
}
