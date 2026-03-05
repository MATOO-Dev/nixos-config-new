{ ... }: {
	flake.nixosModules.kernel = { pkgs-unstable, ... }: {
		# use newest available kernel
		boot.kernelPackages = pkgs-unstable.linuxPackages_latest;
	};
}
