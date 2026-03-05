{ ... }: {
	flake.homeModules.git = { ... }: {
		programs.git = {
			enable = true;
			user = {
			    name = "MATOO-Dev";
				email = "matoo-dev@proton.me";
			};
			lfs.enable = true;
		};
	};
}
