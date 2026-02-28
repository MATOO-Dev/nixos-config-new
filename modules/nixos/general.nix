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
			# dont forget to set password after installing
			initialPassword = "12345";
		};

		services.displayManager.ly.enable = true;
	};
}
