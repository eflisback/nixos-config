{
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  security.pam.services.gdm.enableGnomeKeyring = true;
  security.pam.services.gdm-password.enableGnomeKeyring = true;
}
