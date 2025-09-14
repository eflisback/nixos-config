{ config, lib, pkgs, ... }:

{
  # Pop Shell shortcuts configuration using dconf
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      # Disable default terminal shortcut to avoid conflicts
      terminal = [];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Launch Alacritty";
      command = "alacritty";
      binding = "<Super>a";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Launch Browser";
      command = "firefox"; # Change to your preferred browser
      binding = "<Super>w";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Launch File Manager";
      command = "nautilus";
      binding = "<Super>e";
    };

    # Register the custom keybindings
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };

    # i3-style workspace switching
    "org/gnome/desktop/wm/keybindings" = {
      # Switch to workspace 1-10 with Super+1-0
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];
      switch-to-workspace-9 = ["<Super>9"];
      switch-to-workspace-10 = ["<Super>0"];

      # Move window to workspace 1-10 with Super+Shift+1-0
      move-to-workspace-1 = ["<Super><Shift>1"];
      move-to-workspace-2 = ["<Super><Shift>2"];
      move-to-workspace-3 = ["<Super><Shift>3"];
      move-to-workspace-4 = ["<Super><Shift>4"];
      move-to-workspace-5 = ["<Super><Shift>5"];
      move-to-workspace-6 = ["<Super><Shift>6"];
      move-to-workspace-7 = ["<Super><Shift>7"];
      move-to-workspace-8 = ["<Super><Shift>8"];
      move-to-workspace-9 = ["<Super><Shift>9"];
      move-to-workspace-10 = ["<Super><Shift>0"];

      # Remove default workspace switching shortcuts that might conflict
      switch-to-workspace-left = [];
      switch-to-workspace-right = [];
      switch-to-workspace-up = [];
      switch-to-workspace-down = [];
    };

    # Enable workspaces on all displays (like i3)
    "org/gnome/mutter" = {
      workspaces-only-on-primary = false;
    };

    # Set number of workspaces
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 10;
    };
  };
}