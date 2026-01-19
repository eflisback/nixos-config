let
  configDir = ../config;
in
{
  # Symlink traditional dotfiles from the config directory.
  # This bridges the gap between NixOS modules and legacy config files.
  home.file = {
    ".config/btop".source = "${configDir}/btop";
  };
}
