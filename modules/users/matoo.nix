{ inputs, self, ... }: {
	flake.homeConfigurations.matoo = inputs.home-manager.lib.homeManagerConfiguration {
		pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";

		modules = [
			# general
			self.homeModules.matoo-general

			# programs
			self.homeModules.git
		];

	};

	flake.homeModules.matoo-general = { ... }: {
		home = {
			username = "matoo";
			homeDirectory = "/home/matoo";
			stateVersion = "25.11";
		};
	};
}
