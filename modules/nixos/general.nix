{ ... }: {
	flake.nixosModules.general = { pkgs, ... }: {
		users.users.matoo = {
			isNormalUser = true;
			description = "MATOO";
			extraGroups = [
				"networkmanager"
				"wheel"
				# "dialout" bazecor, move to separate module
			];
			# only used once right after installing
			# dont forget to set password after installing
			initialPassword = "12345";
			shell = pkgs.zsh;
		};

		# login screen
		services.displayManager.ly.enable = true;
	};
}
