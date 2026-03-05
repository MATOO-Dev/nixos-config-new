{ ... }: {
	flake.nixosModules.networking = { ... }: {
		networking = {
			networkmanager.enable = true;
			# for some reason this was set to false in my old config?
			enableIPv6 = true;

			firewall.enable = true;
		};
	};
}
