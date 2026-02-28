{ ... }: {
	flake.nixosModules.virtualization = { ... }: {
		services = {
			spice-vdagentd.enable = true;
			xserver.enable = true;
			xserver.videoDrivers = ["virtio"];
		};

		# needed?
		# hardware.graphics.enable = true;

		# for future hosts
		# virtualisation.libvirtd.enable = true;
		# boot.kernelModules = [ "kvm-amd" ];
	};
}
