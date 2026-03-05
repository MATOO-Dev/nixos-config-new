{ ... }: {
	flake.homeModules.git = { ... }: {
		programs.git = {
			enable = true;

			settings.user = {
				name = "MATOO-Dev";
				email = "matoo-dev@proton.me";
			};

			lfs.enable = true;

			maintenance = {
				enable = true;
				timers = {
					weekly = "Mon 08:00:00";
				};
			};
		};

		programs.lazygit = {
			enable = true;
		};

		programs.zsh.shellAliases = {
			laz = "lazygit";
		};
	};
}
