{ config, lib, ... }:

{
  options.addons.autoSuspend.enable = lib.mkEnableOption "automatic suspend after a period of inactivity";

  config = lib.mkIf config.addons.autoSuspend.enable {
    programs.noctalia.settings.idle = {
      behavior_order = [
        "screen-off"
        "suspend"
      ];

      behavior.screen-off = {
        enabled = true;
        timeout = 300;
        action = "screen_off";
      };

      behavior.suspend = {
        enabled = true;
        timeout = 900;
        action = "lock_and_suspend";
        lock_before_suspend = true;
      };
    };
  };
}
