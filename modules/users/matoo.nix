{ inputs, self, ... }: {
	flake.nixosModules.matoo = { ... }: {
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
	};

	flake.homeConfigurations.matoo = inputs.home-manager.lib.homeManagerConfiguration {
		pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
		extraSpecialArgs = {
			pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages."x86_64-linux";
		};

		modules = [
			# general
			self.homeModules.matoo-general

			# programs
			self.homeModules.git
			self.homeModules.kitty
		];

	};

	flake.homeModules.matoo-general = { ... }: {
		# let home manager install and manage itself
		programs.home-manager.enable = true;

		home = {
			username = "matoo";
			homeDirectory = "/home/matoo";
			stateVersion = "25.11";
		};
	};

}
