{ ... }: {
	flake.nixosModules.virtualization = { ... }: {
		services = {
			spice-vdagentd.enable = true;
			xserver.enable = true;
			xserver.videoDrivers = ["virtio"];
		};

		hardware.graphics.enable = true;
	};
}
