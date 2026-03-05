{ inputs, self, ... }: {
	flake.homeConfigurations.matoo = inputs.home-manager.lib.homeManagerConfiguration {
		pkgs = inputs.nixpkgs;

		modules = [
			# general
			self.homeModules.matoo

			# programs
			self.homeModules.git
		];

	};

	flake.homeModules.matoo = { ... }: {
		home = {
			username = "matoo";
			homeDirectory = "/home/matoo";
			stateVersion = "25.11";
		};
	};
}
