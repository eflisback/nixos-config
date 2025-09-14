{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    # Scala & Java
    scala
    sbt
    openjdk

    # NodeJS
    nodejs
    nodePackages.pnpm

    # Misc
    vscode
    claude-code
 
    # Bluetooth
    pkgs.blueberry

    # Social
    vesktop

    # Gaming
    pkgs.steam
    pkgs.steam-run
    (pkgs.lutris.override {
      extraPkgs = pkgs: [
        pkgs.wineWowPackages.stable
        pkgs.winetricks
      ];
    })

    # Utils
    hyprshot
    catppuccin-cursors.macchiatoBlue
    catppuccin-gtk
    papirus-folders
  ];
}
