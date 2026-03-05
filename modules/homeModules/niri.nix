{ ... }: {
	flake.homeModules.niri = { pkgs, lib, ... }: {
		home.packages = with pkgs; [
			niri
		];

		home.file = { "path" = lib.file.mkOutOfStoreSymlink "./../../dotfiles/niri/config.kdl"; };
	};
}
