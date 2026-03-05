{ ... }: {
	flake.nixosModules.nix = { ... }: {
		nix = {
			settings.experimental-features = [ "nix-command" "flakes" ];
		};
		nixpkgs.config = {
			allowUnfree = true;
			system = "x86_64-linux";
		};
		# automatic updates
		# system.autoUpgrade = {
		# 	enable = false;
		# 	allowReboot = false;
		# 	flake = inputs.self.outPath;
		# 	flags = [
		# 		"--print-build-logs"
		# 	];
		# 	dates = "03:00";
		# 	randomizedDelaySec = "15min";
		# # if this ends up being used: inputs goes in outer function scope
		# 	channel = inputs.flake.nixpkgs;
		# };
	};
}
