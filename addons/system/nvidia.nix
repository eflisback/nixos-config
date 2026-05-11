{ config, lib, ... }:

{
  options.addons.nvidia.enable = lib.mkEnableOption "NVIDIA drivers";

  config = lib.mkIf config.addons.nvidia.enable {
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
