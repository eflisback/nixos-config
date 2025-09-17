{ config, pkgs, ... }:

{
  hardware = {
    bluetooth.enable = true;
    graphics.enable = true;
  };

  # NVIDIA settings moved to host-specific configurations
}
