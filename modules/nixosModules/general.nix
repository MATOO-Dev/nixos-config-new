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

			# move to separate module?
			shell = pkgs.zsh;
		};
		# move to separate module
		programs.zsh.enable = true;

		# login screen
		services.displayManager.ly.enable = true;
	};
}
