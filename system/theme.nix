{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    glib
    gsettings-desktop-schemas

    nwg-look
  ];
}
