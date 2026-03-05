{ ... }: {
	flake.homeModules.niri = { pkgs, lib, ... }: {
		home.packages = with pkgs; [
			niri
		];

		home.file.".config/niri".source = lib.file.mkOutOfStoreSymlink ./../../dotfiles/niri;
	};
}
