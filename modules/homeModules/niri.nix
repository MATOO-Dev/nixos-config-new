{ ... }: {
	flake.homeModules.niri = { pkgs, lib, ... }: {
		home.packages = with pkgs; [
			niri
		];

		home.file.".config/niri/config.kdl".source = lib.file.mkOutOfStoreSymlink ./../../dotfiles/niri/config.kdl;
	};
}
