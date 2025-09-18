{ inputs, pkgs, ... }:

{
  imports = [
    ../../home/common.nix
  ];

  # Laptop-specific home configuration
  programs.zsh.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config/#orbit";
  };

  wayland.windowManager.hyprland.settings = {
    # Laptop single monitor setup
    monitor = [
      "eDP-1,1920x1200@59.95,0x0,1.0"
    ];

    # Single monitor workspace
    workspace = [
      "1, monitor:eDP-1, default:true"
    ];

    # Laptop-specific media keys (these physical keys only exist on laptop)
    bindel = [
      ", XF86AudioRaiseVolume, exec, pamixer -i 5"
      ", XF86AudioLowerVolume, exec, pamixer -d 5"
      ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ];

    bindl = [
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioMicMute, exec, pamixer --default-source -t"
    ];
  };

  # Laptop-specific hyprpaper configuration
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/.config/wallpapers/wall.png"
      ];
      wallpaper = [
        "eDP-1,~/.config/wallpapers/wall.png"
      ];
      splash = false;
    };
  };
}