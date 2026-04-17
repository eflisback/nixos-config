{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mkcert
    nss
  ];

  home-manager.users.ebbe.home.packages = with pkgs; [
    slack
    turbo
    gh
  ];
}
