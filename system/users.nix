{ config, pkgs, ... }:

{
  users.users.ebbe = {
    isNormalUser = true;
    description = "Ebbe Flisbäck";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "docker"
      "qemu"
      "kvm"
      "libvirtd"
      "networkmanager"
    ];
  };

  system.activationScripts.userAvatar = ''
    mkdir -p /var/lib/AccountsService/{icons,users}
    cp ${../assets/avatar.jpg} /var/lib/AccountsService/icons/ebbe
    echo -e "[User]\nIcon=/var/lib/AccountsService/icons/ebbe\n" > /var/lib/AccountsService/users/ebbe

    chown root:root /var/lib/AccountsService/users/ebbe
    chmod 0600 /var/lib/AccountsService/users/ebbe

    chown root:root /var/lib/AccountsService/icons/ebbe
    chmod 0444 /var/lib/AccountsService/icons/ebbe
  '';
}
