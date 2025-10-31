{ inputs, pkgs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  # Desktop-specific home configuration
  programs.zsh.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config/#nucleus";
  };

  wayland.windowManager.hyprland.settings = {
    # Desktop dual monitor setup
    monitor = [
      # 144Hz ASUS monitor on left (primary), 60Hz Samsung on right
      # Note: If screen sharing quality issues persist, try adding/removing ,bitdepth,10
      "DP-3,1920x1080@144,0x0,1.0,bitdepth,10"
      "HDMI-A-1,1920x1080@60,1920x0,1.0,bitdepth,10"
    ];

    # Workspace assignment for dual monitor
    workspace = [
      "1, monitor:DP-3, default:true"
    ];

    # Set cursor to primary monitor on startup
    exec-once = [
      "hyprctl dispatch workspace 1"
    ];
  };

  # Desktop-specific hyprpaper configuration
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/.config/wallpapers/wall.png"
      ];
      wallpaper = [
        "DP-3,~/.config/wallpapers/wall.png"
        "HDMI-A-1,~/.config/wallpapers/wall.png"
      ];
      splash = false;
    };
  };
}
