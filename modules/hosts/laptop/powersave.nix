{ ... }: {
	flake.nixosModules.powersave = { ... }: {
		services = {
			tlp = {
				enable = false;
				settings = {
					CPU_BOOST_ON_BAT = 0;
					CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
					CPU_SCALING_GOVERNOR_ON_AC = "performance";
					RUNTIME_PM_ON_BAT = "auto";
					RUNTIME_PM_ON_jac = "auto";
				};
			};
			power-profiles.daemon.enable = true;
		};
	};
}
