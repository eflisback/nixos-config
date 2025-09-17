{ config, pkgs, ... }:

{
  services = {
  	dbus.enable = true;
	openssh.enable = true;
    spice-vdagentd.enable = true;

	xserver = {
		enable = true;
		xkb.layout = "se";
	};

	displayManager = {
		sddm.enable = true;
		sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
	};
  };
}
