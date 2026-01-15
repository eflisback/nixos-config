{ pkgs, ... }:

{
  virtualisation = {
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
      };
    };

    docker = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    qemu
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    win-spice
    virtio-win
  ];
}
