{ ... }: {
	flake.nixOSModules.kdeconnect = { ... }: {
		networking.firewall = {
			enable = true;
			allowedTCPPortRanges = [{
				from = 1714;
				to = 1764;
			}];
			allowedUDPPortRanges = [{
				from = 1714;
				to = 1764;
			}];
		};
	};

	flake.homeModules.kdeconnect = { ... }: {
		services.kdeconnect = {
			enable = true;
			indicator = true;
		};
	};
}
