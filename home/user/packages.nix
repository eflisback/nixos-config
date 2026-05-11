{ pkgs, ... }:

{
  home.packages = with pkgs; [
    spotify
    anki-bin
  ];
}
