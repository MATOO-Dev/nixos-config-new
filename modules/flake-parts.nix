{ lib, inputs, ... }: {
	imports = [
		inputs.flake-parts.flakeModules.modules
		inputs.home-manager.flakeModules.home-manager
	];

	options.flake.diskoConfigurations = lib.mkOption {
		type = lib.types.attrsOf lib.types.deferredModule;
		default = {};
		description = "Custom disk configuration";
	};

	config = {
		debug = true;

		systems = [
			"x86_64-linux"
		];
	};
}
