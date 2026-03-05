{ ... }: {
	flake.homeModules.git = { ... }: {
		programs.git = {
			enable = true;
			settings.user = {
				name = "MATOO-Dev";
				email = "matoo-dev@proton.me";
			};
			lfs.enable = true;
		};

		programs.lazygit = {
			enable = true;
		};

		programs.zsh.shellAliases = {
			laz = "lazygit";
		};
	};
}
