{ ... }: {
	flake.nixosModules.nix = { ... }: {
		nix.settings.experimental-features = [ "nix-command" "flakes" ];
		nixpkgs.config = {
			allowUnfree = true;
			system = "x86_64-linux";
		};
	};
}
