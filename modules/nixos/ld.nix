{ ... }: {
	flake.nixosModules.template = { pkgs, ... }: {
		programs.nix-ld = {
			enable = true;
			libraries = pkgs.steam-run.fhsenv.args.multipkgs pkgs;
		};
	};
}
