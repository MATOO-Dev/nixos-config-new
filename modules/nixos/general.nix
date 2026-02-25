{ ... }: {
	flake.nixosModules.general = { ... }: {
		users.users.matoo = {
			isNormalUser = true;
			description = "MATOO";
			extraGroups = [
				"networkmanager"
				"wheel"
			];
			# only used once right after installing
			initialPassword = "12345";
		};
	};
}
