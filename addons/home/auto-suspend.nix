{
  config,
  lib,
  pkgs,
  ...
}:

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
        timeout = 600;
        action = "screen_off";
      };

      behavior.suspend = {
        enabled = true;
        timeout = 1200;
        action = "lock_and_suspend";
        lock_before_suspend = true;
      };
    };

    # Noctalia skips its idle actions while an idle inhibitor is held.
    systemd.user.services.audio-idle-inhibit = {
      Unit = {
        Description = "Inhibit idle while audio is playing";
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = "${pkgs.wayland-pipewire-idle-inhibit}/bin/wayland-pipewire-idle-inhibit";
        Restart = "on-failure";
      };

      Install.WantedBy = [ "graphical-session.target" ];
    };
  };
}
