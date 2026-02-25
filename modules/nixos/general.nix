{ ... }: {
	flake.nixosModules.general = { ... }: {
		users.users.matoo = {
			isNormalUser = true;
			description = "MATOO";
			extraGroups = [
				"networkmanager"
				"wheel"
			];
			initialPassword = "12345";
		};
	};
}
