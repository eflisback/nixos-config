let
  configDir = ../config;
in
{
  home.file = {
    ".config/btop".source = "${configDir}/btop";
  };
}
