{ ... }: {
	flake.nixosModules.virtualization = { pkgs, ... }: {
		services.xserver.enable = true;
		services.spice-vdagentd.enable = true;
		services.xserver.videoDrivers = ["virtio"];
		hardware.graphics.enable = true;
	};
}
