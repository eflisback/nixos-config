let
  configDir = ../config;
in
{
  # Symlink traditional dotfiles from the config directory.
  # This bridges the gap between NixOS modules and legacy config files.
  home.file = {
    ".config/nvim".source = "${configDir}/nvim";
    ".config/wallpapers".source = "${configDir}/wallpapers";
    ".config/kitty".source = "${configDir}/kitty";
    ".config/swayidle".source = "${configDir}/swayidle";
    ".config/swaylock".source = "${configDir}/swaylock";
    ".config/wlogout".source = "${configDir}/wlogout";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/btop".source = "${configDir}/btop";
    ".config/wofi".source = "${configDir}/wofi";
    ".config/mako".source = "${configDir}/mako";
  };
}
